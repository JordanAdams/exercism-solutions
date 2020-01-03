module Pangram (isPangram) where

import Data.Set (Set, fromList, isSubsetOf)
import Data.Char (toLower)

isPangram :: String -> Bool
isPangram text = alphabet `isSubsetOf` chars
  where chars = fromList $ map toLower text

alphabet :: Set Char
alphabet = fromList ['a'..'z']
