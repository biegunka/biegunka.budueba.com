---
category: Script primitives
item: Profiles
---

The upper layer in the `Script` hierarchy under [`Sources`][0] and [`Actions`][1].

[Haddocks][2]

##Grouping

Groups several `Sources` into profile.

```haskell
profile :: String -> Script Sources () -> Script Profiles ()
```

  [0]: /pages/script-primitives/sources.html
  [1]: /pages/script-primitives/actions.html
  [2]: http://biegunka.github.io/biegunka-core/Biegunka-Primitive.html#g:1
