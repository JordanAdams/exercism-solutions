module Bob (responseFor) where

import Data.Char (toUpper, isAlpha, isSpace)
import Data.List (isSuffixOf, dropWhileEnd)

responseFor :: String -> String
responseFor input
  | isShouting trimmed = "Whoa, chill out!"
  | isQuestion trimmed = "Sure."
  | isSilence trimmed  = "Fine. Be that way!"
  | otherwise          = "Whatever."
  where
    trimmed = trim input

stringIsUpper :: String -> Bool
stringIsUpper input =
  (map toUpper input) == input

stringHasAlpha :: String -> Bool
stringHasAlpha = any isAlpha

isShouting :: String -> Bool
isShouting =
  (stringIsUpper input) && (stringHasAlpha input)

isQuestion :: String -> Bool
isQuestion = isSuffixOf "?"

isSilence :: String -> Bool
isSilence = all isSpace

trimRight :: String -> String
trimRight = dropWhileEnd isSpace

trimLeft :: String -> String
trimLeft = dropWhile isSpace

trim :: String -> String
trim input = trimLeft (trimRight input)
