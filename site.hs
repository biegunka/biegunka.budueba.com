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
          val <- pandocCompiler
          title <- loadAndApplyTemplate "templates/smalltitle.html" defaultContext val
          loadAndApplyTemplate "templates/default.html"
            (constField "navigation" (itemBody nav) `mappend`
             constField "title"      (itemBody title) `mappend`
             defaultContext) val
            >>= relativizeUrls

    match "pages/**/*" $ do
        route $ setExtension "html"
        compile $ do
          nav <- templateCompiler >>= loadAndApplyTemplate "templates/navigation.html" mempty
          val <- pandocCompiler
          title <- loadAndApplyTemplate "templates/bigtitle.html" defaultContext val
          loadAndApplyTemplate "templates/default.html"
            (constField "navigation" (itemBody nav) `mappend`
             constField "title"      (itemBody title) `mappend`
             defaultContext) val
            >>= relativizeUrls

    match "index.html" $ do
        route idRoute
        compile $ do
          nav <- templateCompiler >>= loadAndApplyTemplate "templates/navigation.html" mempty
          val <- getResourceBody
          title <- loadAndApplyTemplate "templates/smalltitle.html" defaultContext val
          loadAndApplyTemplate "templates/default.html"
            (constField "navigation" (itemBody nav) `mappend`
             constField "title"      (itemBody title) `mappend`
             defaultContext) val
            >>= relativizeUrls

    match "templates/*" $ compile templateCompiler
