#!/usr/bin/env stack

{- stack
  script
  --resolver lts-11.5
  --package yesod
-}

{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE QuasiQuotes          #-}
{-# LANGUAGE TemplateHaskell      #-}
{-# LANGUAGE TypeFamilies         #-}

import           Yesod

data App = App

mkYesod "App" [parseRoutes|
/ HomeR GET
|]

instance Yesod App

getHomeR :: HandlerFor App Value
getHomeR = return $ object ["msg" .= "Hello, World"]

main :: IO ()
main = warp 3000 App
