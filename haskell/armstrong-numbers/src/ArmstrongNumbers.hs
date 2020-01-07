module ArmstrongNumbers
  ( armstrong
  ) where

armstrong :: Integral a => a -> Bool
armstrong n = (== n) $ sum $ map (^ p) $ digits n
  where
    p = length $ digits n

digits :: Integral n => n -> [n]
digits n
  | rest == 0 = [d]
  | otherwise = digits rest ++ [d]
  where
    d = n `mod` 10
    rest = n `div` 10
