{-# LANGUAGE OverloadedStrings #-}
module Main where

import Control.Applicative ((<$>))
import Data.Monoid (Monoid(..))
import Hakyll


main :: IO ()
main = hakyll $ do
    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match "pages/*" $ do
        route $ setExtension "html"
        compile $ do
          nav <- templateCompiler >>= loadAndApplyTemplate "templates/navigation.html" mempty
          pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html"
                  (constField "navigation" (itemBody nav) `mappend` defaultContext)
            >>= relativizeUrls

    match "pages/**/*" $ do
        route $ setExtension "html"
        compile $ do
          nav <- templateCompiler >>= loadAndApplyTemplate "templates/navigation.html" mempty
          pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html"
                  (constField "navigation" (itemBody nav) `mappend` defaultContext)
            >>= relativizeUrls

    match "index.html" $ do
        route idRoute
        compile $ do
          nav <- templateCompiler >>= loadAndApplyTemplate "templates/navigation.html" mempty
          getResourceBody
            >>= loadAndApplyTemplate "templates/default.html"
                  (constField "navigation" (itemBody nav) `mappend` defaultContext)
            >>= relativizeUrls

    match "templates/*" $ compile templateCompiler
