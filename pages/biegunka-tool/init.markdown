---
category: Biegunka tool
item: Init
---

`biegunka init` initializes default (sample) __Biegunka__ script in the current directory:

```shell
% biegunka init
Initialized biegunka script at Biegunka.hs
```

It has optional filepath argument, and is smart enough to figure out what you want in most cases:

```shell
% biegunka init Foo.hs
Initialized biegunka script at Foo.hs

# assuming Foo is an existing directory
% biegunka init Foo/
Initialized biegunka script at Foo/Biegunka.hs

# assuming Foo is an existing directory
% biegunka init Foo/Bar.hs
Initialized biegunka script at Foo/Bar.hs
```
