---
category: Overview
---

So Biegunka is a library for convenient configuration file management.  
Library API consists of two main parts:

 * `Script` is a sequence of instructions that specifies desired configuration files structure
 * `Interpreters` are, uhm, *interpreters* that *interpret* Scripts

Generally, you take several steps when using Biegunka:

 * Declare configuration files structure on a machine (`Script`)
 * Select interpreters you want to run on this script
 * Configure these interpreters
 * Run your program with `runhaskell`!

## Detailed example

Now we will walk through simple example which nevertheless shows many Biegunka features. Here is the full code:

``` {.haskell .numberLines startFrom="1"}
module Main (main) where

import Biegunka
import Control.Lens


main :: IO ()
main = do
  biegunka (set root "~") script (execute id)
 where
  script = do
    profile "dotfiles" $ do
      git "git@github.com:supki/dotfiles" "git/dotfiles" $ do
        link "xmonad.hs" ".xmonad/xmonad.hs"
        link "vimrc"     ".vimrc"
```

Let's start with control line:

``` {.haskell .numberLines startFrom="9"}
  biegunka (set root "~") script (execute id)
```

`biegunka :: (Controls -> Controls) -> Script Profiles -> Interpreter -> IO ()` is a gate into Biegunka, it expects:

 * modifications for common Interpreters settings: we are setting `root` to be user home directory
 * script to interpret
 * a composition of interpreters: for now we will just `execute` script

Note on `root`: all paths in Biegunka may be related. They will possibly be related to 2 things easily distinguished depending on context: either a `root` or current source location.



``` {.haskell .numberLines startFrom="11"}
  script = do
    profile "dotfiles" $ do
      git "git@github.com:supki/dotfiles" "git/dotfiles" $ do
        link "xmonad.hs" ".xmonad/xmonad.hs"
        link "vimrc"     ".vimrc"
```

Scripts consist of operations on files, like `link` (note that where first argument path is related to source location, second is to `root`), related to particular source, like my dotfiles repo, which are grouped into profiles.

So, this one declares profile `dotfiles` containing git repository `github.com:supki/dotfiles` located at `~/git/dotfiles`. and we want to link `~/.xmonad/xmonad.hs` to `~/git/dotfiles/xmonad.hs` and also `~/.vimrc` to `~/git/dotfiles/vimrc`.
