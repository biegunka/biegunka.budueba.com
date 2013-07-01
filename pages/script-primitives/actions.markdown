---
category: Script primitives
item: Actions
---

The lower layer in `Script` hierarchy below [`Sources`][0] and [`Profiles`][1].

[Haddocks][2]

##Link

Link the file from source to host file system somewhere.
The first filepath is relative to source root and the second is to biegunka root.

```haskell
link :: FilePath -> FilePath -> Script Actions ()
```

---

Link the source to host file system somewhere.
The filepath is relative to biegunka root.

```haskell
registerAt :: FilePath -> Script Actions ()
```

---

## Copy

Copy the file from source to host file system somewhere.
The first filepath is relative to source root and the second is to biegunka root.

```haskell
copy :: FilePath -> FilePath -> Script Actions ()
```

---

Copy the file from source to host file system somewhere.
Substitute any templates in it. (Currently [`HStringTemplate`][3] syntax is used.)
The first filepath is relative to source root and the second is to biegunka root.

```haskell
substitute :: FilePath -> FilePath -> Script Actions ()
```

---

## Misc

Run the default shell command. It will probably run `bash` on most systems.

```haskell
shell :: String -> Script Actions ()
```
 [0]: /pages/script-primitives/sources.html
 [1]: /pages/script-primitives/profiles.html
 [2]: http://biegunka.github.io/biegunka-core/Biegunka-Primitive.html#g:2
 [3]: http://hackage.haskell.org/package/HStringTemplate
