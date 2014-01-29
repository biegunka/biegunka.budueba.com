---
category: Getting started
item: Run
---

When we `--run` script we observe the `--changes`:

```shell
% runhaskell Biegunka.hs --default
Proceed? [y/n] y
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

There is also the `--force` flag to skip confirmation step
