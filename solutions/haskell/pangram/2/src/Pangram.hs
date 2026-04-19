module Pangram (isPangram) where

import qualified Data.Set as Set
import qualified Data.Char as Char

uppers = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

-- This does not feel idiomatic, probably not performant either, but is fun

isPangram :: String -> Bool
isPangram text =
  Set.null (Set.difference (Set.fromList uppers) (Set.fromList (map (Char.toUpper) text)))
