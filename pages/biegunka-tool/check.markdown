---
category: Biegunka tool
item: Check
---

`biegunka check` check current filesystem state against what is written in `Dotfiles.hs`:

```shell
% biegunka check -- --default
Verification:
[localhost] git source (git@github.com:user/dotfiles) does not exist at
            /home/maksenov/somewhere/under/~
```

It also has an optional filepath argument to check a script somewhere else:

```shell
% biegunka check AnotherDotfiles.hs -- --default
% Verification: OK
```
