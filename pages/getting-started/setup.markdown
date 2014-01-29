---
category: Getting started
item: Setup
---

*Make sure you successfully [installed][0] biegunka.*

The first step to use __Biegunka__ is to get sample `Biegunka.hs`. This file serves a
purpose of being declarative description of your configuration environment.

To get it, simply run

```shell
% mkdir biegunka
% biegunka init biegunka
Initialized biegunka script at biegunka/Biegunka.hs
```

Generated `Biegunka.hs` should look like the following (modulo comments)

```haskell
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveDataTypeable #-}
import Control.Biegunka
import Control.Biegunka.Source.Git
import Control.Lens

data Environments = Default deriving (Typeable, Data)

main :: IO ()
main = do
  let biegunkaSettings = set root "~"
  (environment, runBiegunka) <- options [Default]
  case environment of
    Default -> runBiegunka biegunkaSettings script

script :: Script Sources ()
script = do
  profile "my-dotfiles" $ do
    git "git@github.com:user/dotfiles" "somewhere/under/~" $
      return ()
    return ()
  return ()
```
 [0]: /pages/install.html
