---
category: Installation
---

There are several ways to install __Biegunka__:

  * ~~From [`hackage`][0]~~ (currently not available)

  * From the [`git` repository][1]

    ```shell
	% git clone https://github.com/biegunka/biegunka.git
	% cd biegunka
	% cabal install
	```

After successful installation you should have:

  * The `biegunka` library

    ```shell
	% ghc -e 'import Control.Biegunka'
	%
	```

  * The `biegunka` tool

    ```shell
	% which biegunka
	/home/maksenov/.cabal/bin/biegunka
	```

	(Do not forget to check `~/.cabal/bin/` directory is in the `$PATH`)

__Note__: it is highly recommended to use a [`cabal`][4] sandboxes: `biegunka` has a whole lot of dependencies, you probably do not want to install all of them into your default package database.

  [0]: http://hackage.haskell.org/package/biegunka
  [1]: https://github.com/biegunka/biegunka
  [4]: https://github.com/haskell/cabal
