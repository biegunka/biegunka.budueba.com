---
category: Getting started
item: Real run
---

Real run script make filesystem look like described in script:

```shell
% runhaskell Dotfiles.hs --default --safe-run
Proceed? [y/N] y
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
```

There is also `--run` flag if you want to skip confirmation
