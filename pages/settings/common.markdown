---
category: Settings
item: Common
---

A bunch of common __Biegunka__ settings

They are bundled in `Settings a` type. Note, that you do not have
access to constructors directly, instead you are supposed
to use [lens][0]es.

  * `root :: Lens' (Settings a) FilePath`

    The path against which (almost) all others relative paths will be resolved

    ```haskell
    settings = set root "~" -- default
    ```

	Or, if you mess with system files too, this would be sensible:

    ```haskell
    settings = set root "/"
    ```

  * `appData :: Lens' (Settings a) FilePath`

    The path where __Biegunka__ looks for saved data

    ```haskell
    settings = set root "~/.biegunka" -- default
    ```

  * `templates :: Lens' Run Templates   `

      If you want to use `substitute` primitive, __Biegunka__ must know
    which templates to substitute with what:

    ```haskell
    settings = set templates () -- default
    ```

    or

    ```haskell
    {-# LANGUAGE DeriveDataTypeable #-}
    import Data.Data (Data)
    import Data.Typeable (Typeable)

    data Values = Values { value1, value2 :: Int }
      deriving (Data, Typeable)

    settings = set templates (Values { value1 = 4, value2 = 7 })
    ```

  * `colors :: Lens' (Settings a) ColorScheme`

    ```haskell
    settings = set colors def -- default
    ```

	Or, if you do not like colors:

    ```haskell
    settings = set colors noColors
    ```

And of course you can compose settings, for example:

```haskell
settings = set root "~" . set appData "~/.biegunka"
```

  [0]: https://github.com/ekmett/lens
