module AnnalynsInfiltration exposing (canFastAttack, canFreePrisoner, canSignalPrisoner, canSpy, stealthAttackDamage)


canFastAttack : Bool -> Bool
canFastAttack knightIsAwake =
    if not knightIsAwake then
        True

    else
        False


canSpy : Bool -> Bool -> Bool -> Bool
canSpy knightIsAwake archerIsAwake prisonerIsAwake =
    if knightIsAwake || archerIsAwake || prisonerIsAwake then
        True

    else
        False


canSignalPrisoner : Bool -> Bool -> Bool
canSignalPrisoner archerIsAwake prisonerIsAwake =
    if prisonerIsAwake && not archerIsAwake then
        True

    else
        False


canFreePrisoner : Bool -> Bool -> Bool -> Bool -> Bool
canFreePrisoner knightIsAwake archerIsAwake prisonerIsAwake petDogIsPresent =
    if petDogIsPresent then
        if not archerIsAwake then
            True

        else
            False

    else if not knightIsAwake && not archerIsAwake && prisonerIsAwake then
        True

    else
        False


stealthAttackDamage : Bool -> Int
stealthAttackDamage annalynIsDetected =
    if annalynIsDetected then
        7

    else
        12
