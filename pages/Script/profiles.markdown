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

Profile files are stored in application data directory (`~/.biegunka` by default).
If you don't like defaults, you may use `appData` lens to change it.

  [1]: https://github.com/biegunka/biegunka-core
