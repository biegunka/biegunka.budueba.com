---
category: Biegunka tool
item: Init
---

`biegunka init` initializes default (sample) __Biegunka__ script in current directory:

```shell
% biegunka init
Initialized biegunka script at Dotfiles.hs
% ls
Dotfiles.hs
```

It also has an optional filepath argument to initialize a script somewhere else (with the same content)

```shell
% biegunka init AnotherDotfiles.hs
Initialized biegunka script at Dotfiles.hs
% ls
AnotherDotfiles.hs Dotfiles.hs
% diff AnotherDotfiles.hs Dotfiles.hs
%
```
