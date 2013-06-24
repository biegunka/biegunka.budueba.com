---
category: Getting started
item: Dry run
---

Dry run script interereter outputs execution log and
then stats (if anything will change on filesystem):

For customized example the output would be like the following:

```shell
% runhaskell Dotfiles.hs --default --dry-run
profile dotfiles:
  update git source git@github.com:supki/.dotfiles at
  /home/maksenov/git/dotfiles
    /home/maksenov/.vimrc is a copy of
    /home/maksenov/git/dotfiles/core/vimrc
    /home/maksenov/.xmonad/xmonad.hs is a copy of
    /home/maksenov/git/dotfiles/extended/xmonad.hs
  update git source git@budueba.com:tools at /home/maksenov/git/tools
    /home/maksenov/bin/publish-haddocks links to
    /home/maksenov/git/tools/publish-haddocks.sh
profile vim:
  update git source git@github.com:wikitopian/hardmode at
  /home/maksenov/.vim/bundle/hardmode

added files (3):
  /home/maksenov/bin/publish-haddocks
  /home/maksenov/.vimrc
  /home/maksenov/.xmonad/xmonad.hs

added sources (3):
  /home/maksenov/git/tools
  /home/maksenov/git/dotfiles
  /home/maksenov/.vim/bundle/hardmode
```
