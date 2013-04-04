---
category: Script
item: Profiles
---

Not much to say here. Use `profile` from [`biegunka-core`][1] to define profile scopes:

```haskell
profile "my/dotfiles" $ do
  ...
profile "my/tools" $ do
  ...
```

Profiles are "reentrable": if you have more than one `profile` declaration, then all of them will be noticed! For example:

```haskell
profile "my/dotfiles" $
  git "git@dotfiles.com/repoOne" "here"
profile "my/dotfiles" $
  git "git@dotfiles.com/repoTwo" "both"
```

Both `repoOne` and `repoTwo` will be in profile file after successful execution.

Profile files are stored in application data directory (`~/.biegunka` by default).
If you don't like defaults, you may use `appData` lens to change it.

  [1]: https://github.com/biegunka/biegunka-core
