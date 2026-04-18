module LeapYear (isLeapYear) where

-- secondBar :: Integer -> Bool
-- secondBar year = mod year 400 == 0

-- firstBar :: Integer -> Bool
-- firstBar year = if mod year 100 == 0
                  -- then secondBar year
                  -- else True

isLeapYear :: Integer -> Bool
isLeapYear year
  | notdivisibleBy 4   = False
  | notdivisibleBy 100 = True
  | notdivisibleBy 400 = False
  | otherwise          = True
  where
    notdivisibleBy n = mod year n /= 0
