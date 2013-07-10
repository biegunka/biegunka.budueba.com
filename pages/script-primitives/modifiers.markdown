---
category: Script primitives
item: Modifiers
---

Script primitives which do not belong to a particular layer but modify
other primitives in some way.

[Haddocks][0]

##Grouping

Grouping is convenience thing aimed at separation of concerns. These are aliases:

```haskell
profile :: String -> Script Sources a -> Script Sources a
group :: String -> Script Sources a -> Script Sources a
```

Each group/profile information is stored after a real run under `appData` directory.
For example, data for "dotfiles" group could be found at `~/.biegunka/profiles/dotfiles.profile` if
`appData` has default value

##Change user

Use another user's powers to do something:

```haskell
sudo :: String -> Script s () -> Script s ()
```

```haskell
dotfiles :: Script Sources ()
dotfiles = git "git@github.com:supki/.dotfiles" "git/dotfiles" $ do
  ...
  sudo "root" $ link "zprofile" "/etc/zprofile"
  ...
```

Works for any layer, just in case:

```haskell
root_dotfiles :: Script Sources ()
root_dotfiles = sudo "root" $ 
  git "git@github.com:supki/secret-dotfiles" "/root/dotfiles" $ do
    ...
```

Using `sudo` generally implies you are running script with `sudo` command too; all
priviledges are just dropped for script commands which are not explicitly under `sudo`

---

##Change failure reaction

Default reaction is to retry one time. You can change that in `Controls`
but it could be useful to alter default reaction for a specific command too:

```haskell
reacting :: React -> Script s () -> Script s ()
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

  [0]: http://biegunka.github.io/biegunka-core/Biegunka-Primitive.html#g:3
