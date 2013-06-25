---
category: Biegunka tool
item: Run
---

`biegunka run` provides options to run (in several ways) __Biegunka__ script

---

## Dry run

```shell
% biegunka run --dry -- --default
```

Only shows what *would* be done, and also statistics

---

## Safe run [default]

```shell
% biegunka run -- --default
Proceed? [y/n]
```

or

```shell
% biegunka run --safe -- --default
Proceed? [y/n]
```

---

## Forced run

Does not ask for confirmation

```shell
% biegunka run --force -- --default
```

---

## Full run

```shell
% biegunka run --full -- --default
```

is the equivalent of

```shell
% biegunka run --dry -- --default
% biegunka run --safe -- --default
% biegunka check -- --default
```

---

It also has an optional filepath argument to run a script with non-default name
