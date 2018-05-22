#!/usr/bin/env stack
{- stack
  script
  --resolver lts-11.5
-}
{-# LANGUAGE QuasiQuotes #-}

import qualified Data.Text.Lazy.IO as TLIO
import           Text.Lucius

render = undefined

transition :: ToCss a => a -> Mixin
transition val =
  [luciusMixin|
    -webkit-transition: #{val};
    -moz-transition: #{val};
    -ms-transition: #{val};
    -o-transition: #{val};
    transition: #{val};
 |]

myCSS =
  [lucius|
    .some-class {
      ^{transition "all 4s ease"}
    }
 |]

main :: IO ()
main = TLIO.putStrLn $ renderCss $ myCSS render
