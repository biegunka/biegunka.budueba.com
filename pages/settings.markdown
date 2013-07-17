---
category: Settings
---

Recall initial `Biegunka.hs` template:

```haskell
main :: IO ()
main = do
  let biegunkaSettings = set root "~"
      runSettings      = set priviledges Drop
  (environment, runBiegunka) <- optionsParser
  case environment of
    Default -> runBiegunka biegunkaSettings runSettings script
```

Here, both `biegunkaSettings` and `runSettings` are settings to modify __Biegunka__
behaviour while interpreting your scripts

  * `biegunkaSettings` applies to all interpreters. Not every interpreter will use
all settings, of course, that's not mandatory, but they are nevertheless available to them

  * `runSettings` applies only to `run` interpreter, thus it has more specific run-related settings
