---
category: Getting started
item: Check run
---

Check script interpreter outputs `OK` if filesystem state corresponds to what script has
or failures otherwise. For example, for customized example, before real run:

```shell
% runhaskell Biegunka.hs --default --check
Verification:
[localhost] git source (git@github.com:supki/.dotfiles)
            does not exist at /home/maksenov/git/dotfiles
[localhost] git source (git@budueba.com:tools) does not exist at
            /home/maksenov/git/tools
[localhost] git source (git@github.com:wikitopian/hardmode)
            does not exist at /home/maksenov/.vim/bundle/hardmode
```

And after:

```shell
% runhaskell Biegunka.hs --default --check
Verification: OK
```
