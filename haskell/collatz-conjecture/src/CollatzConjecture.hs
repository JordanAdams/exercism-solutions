module CollatzConjecture
  ( collatz
  ) where

collatz :: Integer -> Maybe Integer
collatz = collatz' 0

collatz' :: Integer -> Integer -> Maybe Integer
collatz' c n
  | n < 1 = Nothing
  | n == 1 = Just c
  | otherwise = collatz' (c + 1) (next n)
  where
    next n
      | even n = n `div` 2
      | otherwise = (n * 3) + 1
