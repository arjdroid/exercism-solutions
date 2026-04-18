module Darts (score) where

score :: Float -> Float -> Int
score x y
  | notWithin 10 = 0
  | notWithin 5  = 1
  | notWithin 1  = 5
  | otherwise    = 10
  where
    dist = sqrt ((x * x) + (y * y))
    notWithin d = dist > d
