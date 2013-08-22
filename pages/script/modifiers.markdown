---
category: Script
item: Modifiers
---

Script primitives which do not belong to a particular layer but modify
others in some way.

[Haddocks][0]

##Grouping

Grouping is aimed to separating unrelated sources, so management becomes easier.

Each group has a name (an arbitrary sequence of characters). Groups can also have
*subgroups* (i.e. grouping can be nested), for example:

```haskell
script =
  group "foo" $ do
    ...
    group "bar" $ do
      ...
    group "baz" $ do
      ...
```

will create 3 groups: `foo`, `foo/bar`, and `foo/baz`.

If you don't use named groups all the stuff goes to `` (yeah, the name is empty) group.

Groups data can be found under `~/.biegunka/groups` (assuming default settings)
though you really want to use `biegunka list` tool if you happen to want convenient interface.

All of these are aliases:

```haskell
group   :: String -> Script Sources a -> Script Sources a
profile :: String -> Script Sources a -> Script Sources a
role    :: String -> Script Sources a -> Script Sources a
```

##Change user

Use another user's powers to do something:

```haskell
data User = UserID Int | Username String

instance Num      User where ...
instance IsString User where ...

sudo :: User -> Script s a -> Script s a
```

```haskell
{-# LANGUAGE OverloadedStrings #-}

dotfiles :: Script Sources ()
dotfiles = git "git@github.com:supki/.dotfiles" "git/dotfiles" $ do
  ...
  sudo      0 $ link "profile"  "/etc/profile"
  sudo "root" $ link "zprofile" "/etc/zprofile"
  ...
```

*Note:* Sinse __Biegunka__ tries to run as many commands concurrently as it
possibly can, using `sudo` may result a weird order of things. Still
it should not ignore `isPrerequisiteOf`/`<~>` directives.

*Note:* Using `sudo` generally implies you are running script
under `sudo`/`su` command too.

---

##Change retries count

Before falling back to "failure reaction" (how to change it is described
below), __Biegunka__ will try to retry an action, associated with term
`n` times. By default `n` is 1. (That protects against accidential failures
fairly well.)

```haskell
retries :: Int -> Script s a -> Script s a
```

---

##Change failure reaction

Default reaction depends on scope: for `Actions` it's to ignore the failure and proceed,
for `Sources` though it's to stop processing failed source. `reacting` allows to change that
behaviour (note, that it changes it for both scopes).

```haskell
reacting :: React -> Script s a -> Script s a
```

```haskell
dotfiles :: Script Sources ()
dotfiles = git "git@github.com:supki/.dotfiles" "git/dotfiles" $ do
  ...
  reacting Abortive $ link "really-important-dotfile" "somewhere"
  reacting Ignorant $ link "not-very-important-dotfile" "somewhere-else"
  ...
```

---

##Sequential execution

By default, *everything* is executed concurrently. If you want to sequentially execute
some commands before the others you should state that explicitly:

```haskell
infixr 7 `prerequisiteOf`, <~>
prerequisiteOf :: Script Sources a -> Script Sources b -> Script Sources b
(<~>) :: Script Sources a -> Script Sources b -> Script Sources b
```

```haskell
dotfiles :: Script Sources ()
dotfiles = git "git@github.com:supki/.dotfiles" "git/dotfiles" $ do
  ...
  shell "the prerequisite command" <~> shell "the following command"
  ...
```

Chaining could be nested too:

```haskell
dotfiles :: Script Sources ()
dotfiles = git "git@github.com:supki/.dotfiles" "git/dotfiles" $ do
  ...
  shell "the prerequisite command"
 <~>
  shell "another prerequisite command"
 <~>
  shell "the following command"
  ...
```

  [0]: http://biegunka.github.io/biegunka/Control-Biegunka-Primitive.html#g:3
