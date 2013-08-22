---
category: Biegunka tool
item: Run
---

```shell
   ___  _                    __
  / _ )(_)__ ___ ___ _____  / /_____ _
 / _  / / -_) _ `/ // / _ \/  '_/ _ `/
/____/_/\__/\_, /\_,_/_//_/_/\_\\_,_/  0.2
           /___/
```

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
```

or

```shell
% biegunka run --safe -- --default
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
