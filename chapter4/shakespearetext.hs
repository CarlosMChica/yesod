{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}

import           Text.Shakespeare.Text

import           Control.Monad         (forM_)
import           Data.Text             (Text)
import qualified Data.Text.Lazy.IO     as TLIO

data Item = Item
  { itemName :: Text
  , itemQty  :: Integer
  }

items :: [Item]
items =
  [ Item "apples" 5
  , Item "bananas" 10
  ]

main :: IO ()
main = forM_ items $ \item -> TLIO.putStrLn
  [lt|You have #{show $ itemQty item} #{itemName item}.|]
