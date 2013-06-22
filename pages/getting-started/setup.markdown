---
category: Getting started
item: Setup
---

The first step to use __Biegunka__ is to get sample `Dotfiles.hs`. This file serves a
purpose of being declarative description of your configuration environment.

To get it, simply run

```shell
% mkdir ~/biegunka-files
% cd ~/biegunka-files
% biegunka init
Initialized biegunka script at Dotfiles.hs
```

Generated `Dotfiles.hs` should look like the following (modulo comments)

```haskell
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TemplateHaskell #-}
import Biegunka
import Biegunka.Source.Git
import Control.Lens

data Environments = Default

makeOptionsParser ''Environments

main :: IO ()
main = do
  let biegunkaSettings = set root "~"
      execSettings     = set priviledges Drop
  (environment, run) <- optionsParser
  case environment of
    Default -> run biegunkaSettings execSettings script

script :: Script Profiles ()
script = do
  profile "my-dotfiles" $ do
    git "git@github.com:user/dotfiles" "somewhere/under/~" $
      return ()
    return ()
  return ()
```