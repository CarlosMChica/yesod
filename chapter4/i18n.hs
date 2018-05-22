#!/usr/bin/env stack
{- stack
  script
  --resolver lts-11.5
-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}

import           Data.Text                       (Text)
import qualified Data.Text                       as T
import           Text.Blaze.Html                 (toHtml)
import           Text.Blaze.Html.Renderer.String (renderHtml)
import           Text.Hamlet                     (HtmlUrlI18n, ihamlet)

data MyRoute = Home | Time | StyleSheet

renderUrl :: MyRoute -> [(Text, Text)] -> Text
renderUrl Home _       = "/home"
renderUrl Time _       = "/time"
renderUrl StyleSheet _ = "/style.css"

data Msg = Hello | Apples Int

renderEnglish :: Msg -> Text
renderEnglish Hello = "Hello"
renderEnglish (Apples 0) = "You did not buy any apples."
renderEnglish (Apples 1) = "You bought 1 apple"
renderEnglish (Apples i) = T.concat ["You bought", T.pack $ show i, " apples."]

template :: Int -> HtmlUrlI18n Msg MyRoute
template count = [ihamlet|
$doctype 5
<html>
  <head>
    <title>i18n
  <body>
    <h1>_{Hello}
    <p>_{Apples count}
|]

main :: IO ()
main = putStrLn $ renderHtml
  $ (template 5) (toHtml . renderEnglish) renderUrl
