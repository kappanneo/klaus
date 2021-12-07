module Klaus.Submarine where

import Klaus.WordBook

data Command = Forward ElfFeet | Down ElfFeet | Up ElfFeet
 deriving (Read, Show)

type Program = [Command]

data Version = Mk1 | Mk2 deriving (Eq, Read, Show)

type Stats = 
   ( ElfFeet -- x
   , ElfFeet -- depth
   , ElfFeet -- aim
   )

start :: Stats
start = (0, 0, 0)
