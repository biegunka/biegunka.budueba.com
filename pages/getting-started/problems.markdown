---
category: Getting started
item: Problems
---

If we run `Biegunka.hs` script with the `--problems` option, it will tell us how the system
differ from what's declared in the script.

Suppose we ran `Biegunka.hs` script with `--problems` before we ran it with `--run`:

```shell
% runhaskell Biegunka.hs --default --problems:
Verification:
[localhost] git source (git@github.com:supki/.dotfiles)
            does not exist at /home/maksenov/git/dotfiles
[localhost] git source (git@budueba.com:tools) does not exist at
            /home/maksenov/git/tools
[localhost] git source (git@github.com:wikitopian/hardmode)
            does not exist at /home/maksenov/.vim/bundle/hardmode
```

After `--run` finished, nothing broken should be found:

```shell
% runhaskell Biegunka.hs --default --problems
Verification: OK
```
