module Pangram (isPangram) where

import Data.Char (toLower)

isPangram :: String -> Bool
isPangram text = null [l | l <- ['a'..'z'], l `notElem` lowerText]
  where lowerText = map toLower text
