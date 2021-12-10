module Klaus.Submarine.Bingo where

import Klaus.WordBook ( Number )

data Slot = Slot {number :: Number, marked :: Bool} deriving (Eq,Read,Show)

type Board = [[Slot]]

type Round = ([Number],[Board])

slot :: Number -> Slot
slot n = Slot n False