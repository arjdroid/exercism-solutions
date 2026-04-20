module Bob (responseFor) where

-- import qualified Data.Set as Set
import qualified Data.Text as T
import           Data.Text (Text)
import qualified Data.Char as Char

-- ideally should just need Data.Text, and write way more idiomatic code

responseFor :: Text -> Text
responseFor xs
  | isYellQ    = T.pack "Calm down, I know what I'm doing!"
  | isQuestion = T.pack "Sure."
  | isYell     = T.pack "Whoa, chill out!"
  | isSilence  = T.pack "Fine. Be that way!"
  | otherwise  = T.pack "Whatever."
    where
      isQuestion = T.isSuffixOf (T.singleton '?') (T.strip xs)
      isYell = ((T.toUpper xs) == xs && (or (map Char.isLetter (T.unpack xs))))
      isSilence = (T.words xs) == [] -- could use strip too?
      isYellQ = (T.isSuffixOf (T.singleton '?') xs) && ((T.toUpper xs) == xs && (or (map Char.isLetter (T.unpack xs))))
