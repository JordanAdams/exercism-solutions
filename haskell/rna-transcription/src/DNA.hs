module DNA
  ( toRNA
  ) where

toRNA :: String -> Either Char String
toRNA = traverse toRNA'

toRNA' :: Char -> Either Char Char
toRNA' 'G' = Right 'C'
toRNA' 'C' = Right 'G'
toRNA' 'T' = Right 'A'
toRNA' 'A' = Right 'U'
toRNA' c   = Left c
