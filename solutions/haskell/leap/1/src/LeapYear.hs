module LeapYear (isLeapYear) where

secondBar :: Integer -> Bool
secondBar year = mod year 400 == 0
                    -- then True
                    -- else False

firstBar :: Integer -> Bool
firstBar year = if mod year 100 == 0
                  then secondBar year
                  else True

isLeapYear :: Integer -> Bool
isLeapYear year = if mod year 4 == 0
                    then firstBar year
                    else False
