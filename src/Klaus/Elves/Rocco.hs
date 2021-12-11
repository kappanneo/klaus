module Klaus.Elves.Rocco where

import Klaus.Submarine.Bingo
import Klaus.WordBook ( Number )
import Data.List ( inits, transpose ) 

mark :: Number -> Slot -> Slot
mark n slot | n == number slot= Slot n True
mark _ slot = slot

markAll :: [Number] -> Board -> Board
markAll ns = map ( map (\slot -> foldr mark slot ns) )

play :: Round -> [Win]
play (ns,bs)
 = [ (ns', b')
   | ns' <- inits ns
   , b <- bs
   , let b' = markAll ns' b 
   , hasWon b' && not ( hasWon ( markAll (init ns') b ) )
   ] :: [([Number],Board)]


countPoints :: Win -> Number 
countPoints (ns,b) = p (last ns) b
 where 
   p :: Number -> Board -> Number
   p n = (*) n . sum . map number . filter (not . marked) . slots