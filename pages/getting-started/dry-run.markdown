---
category: Getting started
item: Dry run
---

Dry run script interereter outputs execution log and
then stats (if anything will change on filesystem):

For customized example the output would be like the following:

```shell
% runhaskell Biegunka.hs --default --dry-run
[localhost] (git@github.com:wikitopian/hardmode) update git source at
              /home/maksenov/.vim/bundle/hardmode
[localhost] (git@github.com:supki/.dotfiles) update git source at
              /home/maksenov/git/dotfiles
[localhost] (git@budueba.com:tools) update git source at
              /home/maksenov/git/tools
[localhost] (git@budueba.com:tools) [1/1]
              link /home/maksenov/bin/publish-haddocks to
              /home/maksenov/git/tools/publish-haddocks.sh
[localhost] (git@github.com:supki/.dotfiles) [1/2]
              copy /home/maksenov/git/dotfiles/core/vimrc to
              /home/maksenov/.vimrc
[localhost] (git@github.com:supki/.dotfiles) [2/2]
              copy /home/maksenov/git/dotfiles/extended/xmonad.hs to
              /home/maksenov/.xmonad/xmonad.hs

added files (3):
  /home/maksenov/bin/publish-haddocks
  /home/maksenov/.vimrc
  /home/maksenov/.xmonad/xmonad.hs

added sources (3):
  /home/maksenov/git/tools
  /home/maksenov/git/dotfiles
  /home/maksenov/.vim/bundle/hardmode
```
