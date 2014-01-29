---
category: Getting started
item: Customizing
---

Next, we customize the sample `Biegunka.hs` for repositories that we want to have on
our machine. We do not touch `Environments` or `main` yet but instead concentrate on `script`:

```haskell
script :: Script Sources ()
script = do
  profile "my-dotfiles" $ do
    git "git@github.com:user/dotfiles" "somewhere/under/~" $
      return ()
    return ()
  return ()
```

First, we do some renaming and add our dotfiles repository:

```haskell
script :: Script Sources ()
script =
  profile "dotfiles" $
    git "git@github.com:supki/.dotfiles" "git/dotfiles" $
      return ()
```

After that, we actually want to copy files from dotfiles repository in `~`:

```haskell
script :: Script Sources ()
script = do
  profile "dotfiles" $ do
    git "git@github.com:supki/.dotfiles" "git/dotfiles" $ do
      copy "core/vimrc" ".vimrc"
      copy "extended/xmonad.hs" ".xmonad/xmonad.hs"
    return ()
  return ()
```

We also have a repository with useful little scripts and we *love* hardmode for vim, so we'll add them too:

```haskell
script :: Script Sources ()
script = do
  profile "dotfiles" $ do
    git "git@github.com:supki/.dotfiles" "git/dotfiles" $ do
      copy "core/vimrc" ".vimrc"
      copy "extended/xmonad.hs" ".xmonad/xmonad.hs"
    git "git@budueba.com:tools" "git/tools" $
      link "publish-haddocks.sh" "bin/publish-haddocks"
  profile "vim" $
    git_ "git@github.com:wikitopian/hardmode" ".vim/bundle/"
```
