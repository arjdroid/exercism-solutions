module RolePlayingGame exposing (Player, castSpell, introduce, revive)


type alias Player =
    { name : Maybe String
    , level : Int
    , health : Int
    , mana : Maybe Int
    }


introduce : Player -> String
introduce { name } =
    case name of
        Nothing ->
            "Mighty Magician"

        Just smth ->
            smth


revive : Player -> Maybe Player
revive player =
    if player.health == 0 then
        if player.level >= 10 then
            --{ name = player.name, level = player.level, health = 100, mana = 100 }
            Just (Player player.name player.level 100 (Just 100))

        else
            -- { name = player.name, level = player.level, health = 100, mana = player.mana }
            Just (Player player.name player.level 100 player.mana)

    else
        Nothing


castSpell :
    Int
    -> Player
    -> ( Player, Int ) -- second var is damage
castSpell manaCost player =
    case player.mana of
        Nothing ->
            if player.health > manaCost then
                ( Player player.name player.level (player.health - manaCost) player.mana, 0 )

            else
                ( Player player.name player.level 0 player.mana, 0 )

        Just mana ->
            if mana > manaCost then
                ( Player player.name player.level player.health (Just (mana - manaCost)), manaCost * 2 )

            else
                ( player, 0 )
