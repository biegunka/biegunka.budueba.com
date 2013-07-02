---
category: Script primitives
item: Other
---

Script primitives which do not belong to a particular layer.

[Haddocks][0]

##Change user

Use another user's powers to do something:

```haskell
sudo :: String -> Script sc () -> Script sc ()
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
reacting :: React -> Script sc () -> Script sc ()
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
some commands (may be useful if the latter commmand depends on the former),
you should state that explicitly:

```haskell
chain :: Script sc () -> Script sc () -> Script sc ()
(<~>) :: Script sc () -> Script sc () -> Script sc ()
```

```haskell
dotfiles :: Script Sources ()
dotfiles = git "git@github.com:supki/.dotfiles" "git/dotfiles" $ do
  ...
  shell "the prerequisite command" <~> shell "the following command"
  ...
```

  [0]: http://biegunka.github.io/biegunka-core/Biegunka-Primitive.html#g:3
