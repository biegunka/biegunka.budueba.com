---
category: Getting started
item: Installation
---

There are several ways to install __Biegunka__:

  * From [`hackage`][0] (currently not available)

    ```shell
	% cabal install biegunka-core
	```

  * From [`git` repository][1]

    ```shell
	% git clone https://github.com/biegunka/biegunka-core.git
	% cd biegunka-core
	% cabal install
	```

After successful installation you should have:

  * `biegunka-core` library

    ```shell
	% ghc -e 'import Biegunka'
	%
	```

  * `biegunka` tool

    ```shell
	% which biegunka
	/home/maksenov/.cabal/bin/biegunka
	```

	(Do not forget to add `~/.cabal/bin/` directory to `$PATH`)

__Note__: it is highly recommended to use a tool ([`cabal-dev`][3]/[`hsenv`][4]/[`cabal` HEAD][5])
which provides sandboxes: `biegunka-core` has a whole lot of dependencies,
you probably do not want to install all of them into your default package database.

  [0]: http://hackage.haskell.org/package/biegunka-core
  [1]: https://github.com/biegunka/biegunka-core.git
  [2]: https://github.com/biegunka/biegunka-core.git
  [3]: https://github.com/creswick/cabal-dev
  [4]: https://github.com/tmhedberg/hsenv
  [5]: https://github.com/haskell/cabal
