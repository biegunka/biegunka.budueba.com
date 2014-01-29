---
category: Getting started
item: Changes
---

To see what filesystem actions will occur to reflect the changes in the sample
`Biegunka.hs` file, we run `Biegunka.hs` script with the `--changes` option

```shell
% runhaskell Biegunka.hs --default --changes

added files (3):
  /home/maksenov/bin/publish-haddocks
  /home/maksenov/.vimrc
  /home/maksenov/.xmonad/xmonad.hs

added sources (3):
  /home/maksenov/git/tools
  /home/maksenov/git/dotfiles
  /home/maksenov/.vim/bundle/hardmode
```
