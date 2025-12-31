module MagicianInTraining exposing (..)

import Array exposing (Array)


getCard : Int -> Array Int -> Maybe Int
getCard index deck =
    Array.get index deck


setCard : Int -> Int -> Array Int -> Array Int
setCard index newCard deck =
    Array.set index newCard deck


addCard : Int -> Array Int -> Array Int
addCard newCard deck =
    Array.push newCard deck


removeCard : Int -> Array Int -> Array Int
removeCard index deck =
    -- slice then splice, kinda like CRISPR?
    if index < Array.length deck && index >= 0 then
        Array.append (Array.slice 0 index deck) (Array.slice (index + 1) (Array.length deck) deck)

    else
        deck


isEven : Int -> Bool
isEven num =
    if remainderBy 2 num == 0 then
        True

    else
        False


evenCardCount : Array Int -> Int
evenCardCount deck =
    -- filter, then count
    Array.length (Array.filter isEven deck)
