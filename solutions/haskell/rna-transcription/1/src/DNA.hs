module DNA (toRNA) where

import Data.List (find)

-- logic is, we run conv, then compliance via all,
-- then return str or 1st bad char
-- the either char or string thing is not fun.
-- gonna be lazy and do O(2n) instead of O(n)

conv :: Char -> Char
conv c
  | itIs 'G'  = 'C'
  | itIs 'C'  = 'G'
  | itIs 'T'  = 'A'
  | itIs 'A'  = 'U'
  | otherwise = c
  where
    itIs x = (c == x)

-- good :: Char -> Bool
-- good c = (c == 'G') || (c == 'C') || (c == 'T') || (c == 'A')

bad :: Char -> Bool
bad c = (c /= 'G') && (c /= 'C') && (c /= 'T') && (c /= 'A')

toRNA :: String -> Either Char String
toRNA xs = case (find bad xs) of
  Just c -> Left c
  Nothing -> Right (map conv xs)

-- | all good xs = Right (map conv xs)
-- | otherwise   = Left (find bad xs)
-- | isChar    = Left (conv (head xs))
--where
-- isChar = ((length xs) == 1)
