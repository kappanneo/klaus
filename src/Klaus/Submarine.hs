module Klaus.Submarine where

import Klaus.WordBook

data Command = Forward Number | Down Number | Up Number
 deriving (Read, Show)

type Program = [Command]

data Version = Mk1 | Mk2 deriving (Eq, Read, Show)

type Stats = 
   ( UInt -- x
   , UInt -- depth
   , Int -- aim
   )

start :: Stats
start = (0, 0, 0)
