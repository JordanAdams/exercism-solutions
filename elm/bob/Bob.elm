module Bob exposing (hey)

import String
import Regex exposing (regex)


hey : String -> String
hey message =
    if isShouting message && hasLetters message then
        "Whoa, chill out!"
    else if isQuestion message then
        "Sure."
    else if isEmpty message then
        "Fine. Be that way!"
    else
        "Whatever."


isQuestion : String -> Bool
isQuestion =
    String.endsWith "?"


isShouting : String -> Bool
isShouting str =
    String.toUpper str == str


isEmpty : String -> Bool
isEmpty str =
    String.trim str == ""


hasLetters : String -> Bool
hasLetters str =
    let
        matches =
            Regex.find Regex.All (regex "[a-zA-Z]") str
    in
        List.length matches > 0
