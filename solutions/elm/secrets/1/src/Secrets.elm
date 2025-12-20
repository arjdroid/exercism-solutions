module Secrets exposing (clearBits, decrypt, flipBits, setBits, shiftBack)

import Bitwise


shiftBack : Int -> Int -> Int
shiftBack amount value =
    Bitwise.shiftRightZfBy amount value


setBits : Int -> Int -> Int
setBits mask value =
    Bitwise.and mask value


flipBits : Int -> Int -> Int
flipBits mask value =
    Bitwise.xor value mask


clearBits : Int -> Int -> Int
clearBits mask value =
    Bitwise.and value (Bitwise.complement mask)


decrypt : Int -> Int
decrypt secret =
    clearBits 17 (shiftBack 5 (flipBits 2009 (setBits 1996 secret)))
