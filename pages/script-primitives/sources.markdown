---
category: Script primitives
item: Sources
---

The upper layer in the `Script` hierarchy above [`Actions`][6].

## Git support

Can be found in [`biegunka-core`][0], supports cloning and updating (with merge)

Some examples:

```haskell
dotfiles :: Script Sources ()
dotfiles = git "git@github.com:supki/.dotfiles" "git/dotfiles" $ do
  ...
```

```haskell
idris :: Script Sources ()
idris = "git@github.com:edwinb/Idris-dev" ==> "git/" $ def
   & remotes .~ ["origin", "stream"]
   & actions .~ do
       link "contribs/tool-support/vim" ".vim/bundle/idris-vim"
         ...
```

[Haddocks][3]

---

## Darcs support

Can be found in [`biegunka-darcs`][1], supports cloning and updating

[Haddocks][4]

---

## Archives support

Can be found in [`biegunka-archive`][2], support downloading and redownloading on changes

[Haddocks][5]

  [0]: https://github.com/biegunka/biegunka-core
  [1]: https://github.com/biegunka/biegunka-darcs
  [2]: https://github.com/biegunka/biegunka-archive
  [3]: http://biegunka.github.io/biegunka-core/Biegunka-Source-Git.html
  [4]: http://biegunka.github.io/biegunka-darcs/
  [5]: http://biegunka.github.io/biegunka-archive/
  [6]: /pages/script-primitives/actions.html
