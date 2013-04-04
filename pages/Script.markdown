---
category: Script
---

Script is a collection of declarations that describe the state of configuration files world.
It contains 3 scopes inside:

  * Profiles scope
  * Sources scope
  * Actions scope

##Profiles

Profiles are the simplest scope. Each profile has a name ("label") and knows what sources are inside it:

```haskell
profile "vim/coq" $ do
  git_ "git@github.com:vim-scripts/coq-syntax" ".vim/bundle/coq-syntax"
  git_ "git@github.com:vim-scripts/Coq-indent" ".vim/bundle/Coq-indent"
```

After successful script execution you may find profiles files under `~/.biegunka` directory.
These files are in JSON format, for example, `~/.biegunka/vim/coq` would be:

```json
{
  "sources": [
    {
      "files": [],
      "info": {
        "base": "git@github.com:vim-scripts/Coq-indent",
        "location": "/home/maksenov/.vim/bundle/Coq-indent",
        "recordtype": "git"
      }
    },
    {
      "files": [],
      "info": {
        "base": "git@github.com:vim-scripts/coq-syntax",
        "location": "/home/maksenov/.vim/bundle/coq-syntax",
        "recordtype": "git"
      }
    }
  ]
}
```

##Sources

Sources are locations with files. Each source is 2 paths and a bunch of actions to do with files.
The first path is where to get this source, the second is where to put it.

```haskell
darcs_ "http://code.haskell.org/xmonad" "projects/misc/xmonad"
```

This takes `darcs` repository at `http://code.haskell.org/xmonad` and
puts it under the `root` at `projects/misc/xmonad`

## Actions

Actions are filesystem, well, actions. They copy files, link them, etc.

```haskell
git ... ... $ do
  link "xmonad.hs" ".xmonad/xmonad.hs"
  copy "vimrc" ".vimrc"
  shell "echo Done!"
```

So, this bit links and copies files from git repository under `root` and then reports it's done.
