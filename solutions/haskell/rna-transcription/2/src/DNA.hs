module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA = traverse itIs
  where
    itIs :: Char -> Either Char Char
    itIs 'G' = pure 'C'
    itIs 'C' = pure 'G'
    itIs 'T' = pure 'A'
    itIs 'A' = pure 'U'
    itIs c = Left c
