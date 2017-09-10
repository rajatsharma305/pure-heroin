--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Hakyll

--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do
    match "images/**" $ do
        route   idRoute
        compile copyFileCompiler

    match "js/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "fonts/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match "index.html" $ do
        route idRoute
        compile $ do

            getResourceBody
                >>= applyAsTemplate defaultContext
                >>= loadAndApplyTemplate "templates/default.html" defaultContext
                >>= relativizeUrls

    match "portfolio.html" $ do
        route idRoute
        compile $ do

          getResourceBody
              >>= applyAsTemplate defaultContext
              >>= loadAndApplyTemplate "templates/default.html" defaultContext
              >>= relativizeUrls

    match "protected.html" $ do
        route idRoute
        compile $ do

            getResourceBody
                >>= applyAsTemplate defaultContext
                >>= loadAndApplyTemplate "templates/bare.html" defaultContext
                >>= relativizeUrls

    match "templates/*" $ compile templateBodyCompiler
