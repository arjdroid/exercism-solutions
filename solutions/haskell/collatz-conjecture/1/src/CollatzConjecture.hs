module CollatzConjecture (collatz) where

recurser :: Integer -> Integer
recurser num
  | (num == 1) = 0
  | (even num) = ((recurser (div num 2)) + 1) 
  | otherwise = ((recurser ((3 * num) + 1)) + 1)

collatz :: Integer -> Maybe Integer
collatz n
  | (n == 1) = Just 0
  | ((n > 1) && (even n)) = Just ((recurser (div n 2)) + 1)
  | (n>1) = Just ((recurser (3*n + 1)) + 1)
  | otherwise = Nothing
