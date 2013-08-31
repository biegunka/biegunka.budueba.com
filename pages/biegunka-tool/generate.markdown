---
category: Biegunka tool
item: Generate
---

`biegunka generate [PROFILES]` can generate a script for specified profiles.
Some information isn't there (such as dependencies or how to react on failure) but generated script
is fairly comprehensive.

This could be useful if script is somehow lost, but the data is not.

Running generated script should not change any data. i.e.:

```shell
% biegunka generate > Biegunka.hs
% biegunka run --dry -- --default
...
```

should not contain any changes.

## Options

  * `--data-dir`

	Where to find __Biegunka__ state. `~/.biegunka` by default

  * `--app-dir`

	Where was __Biegunka__ root. `~` by default
