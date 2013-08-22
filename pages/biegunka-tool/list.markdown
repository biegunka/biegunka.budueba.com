---
category: Biegunka tool
item: List
---

`biegunka list` shows saved __Biegunka__ groups data

If it's ran without any arguments it will show all available data:

```shell
% biegunka list
Group dotfiles
  Source /home/maksenov/git/dotfiles
    Link /home/maksenov/.XCompose
    ...
Group tools
  Source /home/maksenov/git/tools
    ...
...
```

If you can use arguments to filter data to be shown:

```shell
% biegunka list tools
Group tools
  Source /home/maksenov/git/tools
    ...
```

(It does still show all subgroups)

```shell
% biegunka list vim
Group vim/coq
  ...
Group vim/haskell
  ...
Group vim/ruby
  ...
...
```

## Custom data directory

`biegunka list` supports non-default data directory:

```shell
% biegunka list --data-dir=~/.biegunka-experimental
Group experimental
  ...
```

The default data directory is `~/.biegunka`

## Custom formatting

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

The default format pattern is `Group %p%n%;  Source %p%n%;    %T %p%n`

## JSON

`biegunka list` can output data as JSON:

```shell
% biegunka list vim/coq --json
{"groups":{"vim/coq":{"sources": ...
```

Yeah, the output is not pretty, but there is enough tools that can transform JSON to a format that
is nice to read for humans.

The scheme is as follows:

```JSON
{ "groups":
	{ <GROUP>:
		{ "sources":
			[ { "files":
					[ { "path": <TARGET>
					  , "from": <SOURCE>
					  , "type": <TYPE>
					  }
					, ...
					]
			  , "path": <TARGET>
			  , "from": <SOURCE>
			  , "type": <TYPE>
			  }
			, ...
			]
		}
	, ...
	}
}
```
