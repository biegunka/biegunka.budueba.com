---
category: Settings
item: Common
---

A bunch of common __Biegunka__ settings

They are bundled in `Settings a` type. Note, that you do not have
access to constructors directly, instead you are supposed
to use [lens][0]es.

  * Set root path

    Root path is the path against which `Sources` and `Actions`
    targets relative paths are resolved. `Actions` sources relative
    paths are resolved against `Sources` locations.

    Modifiable with `root :: Lens' (Settings a) FilePath`


    ```haskell
    settings = set root "~" -- default
    ```

    Or, if you mess with system files too, this would be useful:

    ```haskell
    settings = set root "/"
    ```

  * Set application data directory path

    This path is where __Biegunka__ looks for saved data about
    installed `Sources` and relevant files

    Modifiable with `appData :: Lens' (Settings a) FilePath`

    ```haskell
    settings = set root "~/.biegunka" -- default
    ```

  * Templates mappings

    If you want to use `substitute` primitive, you must tell __Biegunka__
    which templates to substitute with what, i.e. substitution mapping.

    Modifiable with `templates :: Lens' (Settings a) Templates   `

    ```haskell
    settings = set templates () -- default
    ```

    or (this adds [HStringTemplate][1] mapping for `$templates.value1$` and `$templates.value2$`):

    ```haskell
    {-# LANGUAGE DeriveDataTypeable #-}
    import Data.Data (Data)
    import Data.Typeable (Typeable)

    data Values = Values { value1, value2 :: Int }
      deriving (Data, Typeable)

    settings = set templates (hStringTemplate (Values { value1 = 4, value2 = 7 }))
    ```

  * Custom colorscheme

    Modifiable with `colors :: Lens' (Settings a) ColorScheme`

    ```haskell
    settings = set colors def -- default
    ```

    or, in case you do not like colors,

    ```haskell
    settings = set colors noColors
    ```

  * Execution mode

    __Biegunka__ execution supports `Online` (the default) and `Offline` modes.
    `Online` is just what you can assume about execution.  `Offline` mode
	is a bit different: it skips sources updates entirely, so you can focus on
	testing your local configuration when updating is annoyingly long.

    Modifiable with `mode :: Lens' (Settings a) Mode`

    ```haskell
    settings = set mode Online -- default
    ```

    or

    ```haskell
    settings = set mode Offline
    ```

And of course you can compose settings, for example:

```haskell
settings = set root "~" . set appData "~/.biegunka"
```

  [0]: http://hackage.haskell.org/package/lens
  [1]: http://hackage.haskell.org/package/HStringTemplate
