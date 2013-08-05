---
category: Settings
---

Recall initial `Biegunka.hs` template:

```haskell
main :: IO ()
main = do
  let biegunkaSettings = set root "~"
  (environment, runBiegunka) <- options
  case environment of
    Default -> runBiegunka biegunkaSettings script
```

Here, `biegunkaSettings` are settings to modify __Biegunka__
behaviour while interpreting your scripts. It applies to all interpreters. Not every interpreter will use
all settings, of course, that's not mandatory, but they are nevertheless available to them
