module Klaus.Submarine.Bingo where

import Klaus.WordBook ( Number )
import Data.List ( transpose ) 

data Slot = Slot {number :: Number, marked :: Bool} deriving (Eq,Read,Show)

type Board = [[Slot]]

type Round = ([Number],[Board])

fromNumber :: Number -> Slot
fromNumber n = Slot n False

type Win = ([Number],Board)

hasWon :: Board -> Bool
hasWon = any (all marked) . rowsAndCols

rowsAndCols :: Board -> [[Slot]]
rowsAndCols b = rows b ++ cols b

rows :: Board -> [[Slot]]
rows = id

cols :: Board -> [[Slot]]
cols = transpose

slots :: Board -> [Slot]
slots = concat
