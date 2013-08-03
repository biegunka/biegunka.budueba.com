---
category: Getting started
item: Setup
---

*Make sure you successfully [installed][0] biegunka.*

The first step to use __Biegunka__ is to get sample `Biegunka.hs`. This file serves a
purpose of being declarative description of your configuration environment.

To get it, simply run

```shell
% mkdir ~/biegunka
% biegunka
% biegunka init biegunka/Biegunka.hs
Initialized biegunka script at biegunka/Biegunka.hs
```

*Note*: `biegunka init` without arguments will create `Biegunka.hs` file in the
current directory


Generated `Biegunka.hs` should look like the following (modulo comments)

```haskell
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TemplateHaskell #-}
import Control.Biegunka
import Control.Biegunka.Source.Git
import Control.Lens

data Environments = Default

makeOptionsParser ''Environments

main :: IO ()
main = do
  let biegunkaSettings = set root "~"
  (environment, runBiegunka) <- optionsParser
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
