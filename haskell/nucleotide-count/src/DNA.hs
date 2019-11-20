module DNA
  ( nucleotideCounts
  , Nucleotide(..)
  ) where

import           Data.Map (Map, adjust, empty, fromList)

data Nucleotide
  = A
  | C
  | G
  | T
  deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = Right (foldl reducer initial xs)
  where
    reducer :: Map Nucleotide Int -> Char -> Map Nucleotide Int
    reducer m c = adjust (+ 1) (charToNucleotide c) m
    initial :: (Map Nucleotide Int)
    initial = fromList [(A, 0), (C, 0), (G, 0), (T, 0)]

charToNucleotide :: Char -> Nucleotide
charToNucleotide 'A' = A
charToNucleotide 'C' = C
charToNucleotide 'G' = G
charToNucleotide 'T' = T
charToNucleotide _   = error "Not a valid nucleotide"
