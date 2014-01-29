---
category: Biegunka tool
---

`biegunka` is command line tool to make working with __Biegunka__ scripts easier.

Before trying to use it, check if you have it in your `PATH`:

```shell
% which biegunka
/home/maksenov/.cabal/bin/biegunka
```

Output you'll receive should be similar.

The structure of all biegunka tool subcommands is:

```shell
% biegunka SUBCOMMAND [OPTIONS] [BIEGUNKAFILE] -- [-GHCOPTIONS] [--SCRIPTOPTIONS]
```

Note that you can pass commands to ghc (these start with one hyphen) and also
to script which is ran (those start with two hyphens). Don't forget the `--`, though!
