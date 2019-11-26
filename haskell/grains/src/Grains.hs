module Grains (square, total) where

square :: Int -> Maybe Integer
square n
  | n <= 0 = Nothing
  | n > 64 = Nothing
  | otherwise = Just $ last $ take n $ board

total :: Integer
total = sum board

board :: [Integer]
board = take 64 $ iterate (* 2) 1
