---
category: Overview
---

So Biegunka is a library for convenient configuration file management.  
Library API consists of two main parts:

 * `Script` is a sequence of instructions that specifies desired configuration files structure
 * `Interpreters` are, uhm, *interpreters* that *interpret* Scripts

Generally, you take several steps when using Biegunka:

 * Declare configuration files structure on a machine (`Script`)
 * Choose and compose interpreters you want to run on this script
 * Configure them
 * Run your program with `runhaskell`!

## Detailed example

We will walk through simple example which nevertheless shows many Biegunka features.  
Full snippet is here:

```haskell
import Biegunka
import Biegunka.Source.Git
import Control.Lens


main :: IO ()
main = do
  biegunka (set root "~") script (execute id)
 where
  script = do
    profile "dotfiles" $ do
      git "git@github.com:me/dotfiles" "dotfiles" $ do
        link "xmonad.hs" ".xmonad/xmonad.hs"
        link "vimrc"     ".vimrc"
```

---

Starting with imports:

```haskell
import Biegunka
import Biegunka.Source.Git
import Control.Lens
```

 * `Biegunka` module exports most of Biegunka
 * `Biegunka.Source.Git` module exports git support
 * `Control.Lens` module exports [lens][0] library. We will use a tiny subset of it

---

Next, "control" line:

```haskell
  biegunka (set root "~") script (execute id)
```

`biegunka` is an entry gate into Biegunka; it expects:

 * modifications for default settings used by all Interpreters:
   we are setting `root` to be the user home directory
 * script to interpret
 * interpreter: for now we will just `execute` script but in general there is some composition of interpreters user wants

---

Okay, script definition:

```haskell
    profile "dotfiles" $ do
```

Defines profile "dotfiles". Profile is a "labeled bag" of related sources.
All interesting information about it will be in `~/.biegunka/dotfiles`
after script execution. You can use your favourite tool to read it (it's JSON).

```haskell
      git "git@github.com:me/dotfiles" "dotfiles" $ do
```

Defines git repository (source) `https://github.com/me/dotfiles.git` as cloned at `~/dotfiles`.
Remember we set `root` to `~` earlier? `root` prefixes every source location in host filesystem. (It's quite handy!)

```haskell
        link "xmonad.hs" ".xmonad/xmonad.hs"
        link "vimrc"     ".vimrc"
```

Defines a couple of filesystem operations: it links `~/dotfiles/xmonad.hs`
to `~/.xmonad/xmonad.hs` creating all intermediate directories and
`~/dotfiles/vimrc` links to `~/.vimrc`. Note that the first `link` argument is path
relative to the source path and the second one is path relative to the `root`.

So, after execution we will end up with configuration files for Vim and XMonad!

  [0]: https://github.com/ekmett/lens
