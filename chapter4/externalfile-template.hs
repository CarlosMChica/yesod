#!/usr/bin/env stack
{- stack
  script
  --resolver lts-11.5
-}
{-# LANGUAGE CPP               #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

import           Data.Text         (Text)
import qualified Data.Text.Lazy.IO as TLIO
import           Text.Lucius       (CssUrl, luciusFile, luciusFileDebug,
                                    renderCss)

data MyRoute = Home | Time | StyleSheet

render :: MyRoute -> [(Text, Text)] -> Text
render Home _       = "/home"
render Time _       = "/time"
render StyleSheet _ = "/style.css"

template :: CssUrl MyRoute
#if PRODUCTION
template = $(luciusFile "template.lucius")
#else
template = $(luciusFileDebug "template.lucius")
#endif

main :: IO ()
main = TLIO.putStrLn $ renderCss $ template render
