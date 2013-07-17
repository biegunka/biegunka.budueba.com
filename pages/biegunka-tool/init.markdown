---
category: Biegunka tool
item: Init
---

`biegunka init` initializes default (sample) __Biegunka__ script in current directory:

```shell
% biegunka init
Initialized biegunka script at Biegunka.hs
% ls
Biegunka.hs
```

It also has an optional filepath argument to initialize a script somewhere else (with the same content)

```shell
% biegunka init AnotherBiegunka.hs
Initialized biegunka script at AnotherBiegunka.hs
% ls
AnotherBiegunka.hs Biegunka.hs
% diff AnotherBiegunka.hs Biegunka.hs
%
```
