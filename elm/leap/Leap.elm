module Leap exposing (isLeapYear)


isLeapYear year =
    if isDivisbleBy 400 year then
        True
    else if isDivisbleBy 100 year then
        False
    else if isDivisbleBy 4 year then
        True
    else
        False


isDivisbleBy factor number =
    rem number factor == 0
