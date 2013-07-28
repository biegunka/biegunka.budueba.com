---
category: Settings
item: Run-only
---

A bunch of settings for `run` specifically.

They are bundled in `Run` type. Note, that you do not have
access to constructors directly, instead you are supposed
to use [lens][0]es.

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

  * `retries :: Lens' Run Int         `

      If __Biegunka__ encounters some kind of failure while
    doing an operation, it will try to redo it. This sets maximum amount of such retries

    ```haskell
    settings = set retries 1 -- default
    ```

And of course you can compose settings, for example:

```haskell
settings = set retries 1 . set react Ignorant
```

  [0]: https://github.com/ekmett/lens
