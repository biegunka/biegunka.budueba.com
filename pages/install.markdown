---
category: Installation
---

There are several ways to install __Biegunka__:

  * From [`hackage`][0] (currently not available)

    ```shell
	% cabal install biegunka
	```

  * From [`git` repository][1]

    ```shell
	% git clone https://github.com/biegunka/biegunka.git
	% cd biegunka
	% cabal install
	```

After successful installation you should have:

  * `biegunka` library

    ```shell
	% ghc -e 'import Control.Biegunka'
	%
	```

  * `biegunka` tool

    ```shell
	% which biegunka
	/home/maksenov/.cabal/bin/biegunka
	```

	(Do not forget to add `~/.cabal/bin/` directory to `$PATH`)

__Note__: it is highly recommended to use a tool ([`cabal-dev`][2]/[`hsenv`][3]/[`cabal` HEAD][4])
which provides sandboxes: `biegunka` has a whole lot of dependencies,
you probably do not want to install all of them into your default package database.

  [0]: http://hackage.haskell.org/package/biegunka
  [1]: https://github.com/biegunka/biegunka.git
  [2]: https://github.com/creswick/cabal-dev
  [3]: https://github.com/tmhedberg/hsenv
  [4]: https://github.com/haskell/cabal
