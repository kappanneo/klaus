module Klaus.Submarine where

import Klaus.WordBook ( UInt, Number )

-- | Single submarine movement instruction.
data Command = Forward Number | Down Number | Up Number deriving (Read, Show)

-- | List of commands.
type Program = [Command]

-- | Identifies different submarine operational models.
data Version
 = Mk1 -- ^ Operational mode that allows for forward or up/down movement. No aiming.
 | Mk2 -- ^ Operational mode that allows for forward aimed movement and aim adjustment operations.
 deriving ( Eq, Read, Show )

-- | Santa's submarine stats: horizontal direction, depth and aim.
type Stats = 
   ( UInt -- x
   , UInt -- depth
   , Int  -- aim
   )

-- | Initial stats.
start :: Stats
start = ( 0, 0, 0 )
