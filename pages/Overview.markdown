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

Now we will walk through simple example which nevertheless shows many Biegunka features.  
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

 * `Biegunka` module includes the most of biegunka definitions you see later
 * `Biegunka.Source.Git` module includes git support
 * `Control.Lens` is from [lens][0] library. We will use tiny subset of it

---

Next, "control" line:

```haskell
  biegunka (set root "~") script (execute id)
```

`biegunka` is an entry gate into biegunka; it expects:

 * modifications for general interpreters settings: we are setting `root` to be user home directory
 * script to interpret
 * a composition of interpreters: for now we will just `execute` script but in general there is more complex expression

---

Now, script description:

```haskell
    profile "dotfiles" $ do
```

Defines profile "dotfiles". All interesting information about this profile will
be (in JSON format) in `~/.biegunka/dotfiles` after script execution. You can use your favourite tool to read it.

```haskell
      git "git@github.com:me/dotfiles" "dotfiles" $ do
```

Defines git repository `https://github.com/me/dotfiles.git` as cloned at `~/dotfiles`.
Remember we set `root` to `~` earlier? `root` prefixes every source location in host filesystem. (It's quite handy!)

```haskell
        link "xmonad.hs" ".xmonad/xmonad.hs"
        link "vimrc"     ".vimrc"
```

Defines a couple of filesystem operations: it links `~/dotfiles/xmonad.hs` to `~/.xmonad/xmonad.hs` creating all
intermediate directories and `~/dotfiles/vimrc` to `~/.vimrc`. So after execution you will end up with configuration files
for Vim and XMonad!

  [0]: https://github.com/ekmett/lens
