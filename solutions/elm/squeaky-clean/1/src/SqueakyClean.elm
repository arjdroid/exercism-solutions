module SqueakyClean exposing (clean, clean1, clean2, clean3, clean4)


clean1 : String -> String
clean1 str =
    String.replace " " "_" str


clean2 : String -> String
clean2 str =
    -- cleverness is complicated
    -- map uncons (String.split "\" str)
    String.replace "\u{000D}" "[CTRL]" (String.replace "\t" "[CTRL]" (String.replace "\n" "[CTRL]" (clean1 str)))


camelCaser : String -> String
camelCaser str =
    case String.uncons str of
        Nothing ->
            str

        Just ( a, b ) ->
            String.cons (Char.toUpper a) b


clean3 : String -> String
clean3 str =
    -- need to separate head from rest
    String.concat (List.map camelCaser (String.split "-" (clean2 str)))


isntDigit : Char -> Bool
isntDigit c =
    not (Char.isDigit c)


clean4 : String -> String
clean4 str =
    String.filter isntDigit (clean3 str)


isntGreek : Char -> Bool
isntGreek c =
    let
        code =
            Char.toCode c
    in
    not (code > 0x0370 && code < 0x03FF)


clean : String -> String
clean str =
    String.filter isntGreek (clean4 str)
