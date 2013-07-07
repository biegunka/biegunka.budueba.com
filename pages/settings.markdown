---
category: Settings
---

Recall initial `Dotfiles.hs` template:

```haskell
main :: IO ()
main = do
  let biegunkaSettings = set root "~"
      execSettings     = set priviledges Drop
  (environment, runBiegunka) <- optionsParser
  case environment of
    Default -> runBiegunka biegunkaSettings execSettings script
```

Here, both `biegunkaSettings` and `execSettings` are settings to modify __Biegunka__
behaviour while interpreting your scripts

  * `biegunkaSettings` applies to all interpreters. Not every interpreter will use
all settings, of course, that's not mandatory, but they are nevertheless available to them

  * `execSettings` applies only to `run` interpreter, thus it has more specific run-related settings
