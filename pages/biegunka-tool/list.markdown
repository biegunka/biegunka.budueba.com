---
category: Biegunka tool
item: List
---

`biegunka list` shows saved __Biegunka__ state

If it's ran without any arguments it will show available profiles (sorted alphabetically):

```shell
% biegunka list
dotfiles
tools
...
```

If you want detailed information about profiles use their names as arguments:

```shell
% biegunka list dotfiles tools
Profile dotfiles
  Source /home/maksenov/git/dotfiles
    ...
    Link /home/maksenov/.vimrc
    ...
Profile tools
  Source /home/maksenov/git/tools
    ...
```

## Custom data directory

`biegunka list` supports non-default data directory:

```shell
% biegunka list --data-dir=~/.biegunka-experimental
vim/haskell
vim/ruby
```

The default data directory is `~/.biegunka`

## Formatting

`biegunka list` supports custom formatting:

```shell
% biegunka list dotfiles tools --format "%;%l -> %p%;  %p"
git@github.com:supki/.dotfiles -> /home/maksenov/git/dotfiles
  ...
  /home/maksenov/.vimrc
  ...
git@github.com:supki/tools -> /home/maksenov/git/tools
  ...
```

Format pattern consists of 3 sections, separated by `%;`:

  * Profiles information format. Understands `%p` placeholder as profile name.

  * Sources information format. Understands `%p` placeholder as
      source path on host, `%l` as source location and `%t` as source type.

  * Files information format. Understands `%p` placeholder as
      file path on host, `%l` as file source location and `%t`(`%T`) as file (capitalized) type.

Also `%n` is interpreted as `\n` character.

The default format pattern is `Profile %p%n%;  Source %p%n%;    %T %p%n`
