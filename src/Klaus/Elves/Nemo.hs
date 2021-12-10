module Klaus.Elves.Nemo where

import Klaus.Submarine ( Stats, Version(..), Program, Command(..), start )

-- | Execute a single action of an Mk1 model submarine 
-- returning the updated state of the submarine.
-- This version of submarine moves only forward and
-- can float up and down when not without moving.
-- The aim stat is never changed.
--
-- >>> mk1 (0,0,0) (Forward 10)
-- (10,0,0)
--
-- >>> mk1 (mk1 (10,0,0) (Down 1290)) (Up 3000)
-- (10,0,0)
--
mk1 :: Stats -> Command -> Stats
mk1 (x, d, a) (Forward n) = (x + n, d, a)
mk1 (x, d, a) (Up n) = (x, if d > n then d - n else 0, a)
mk1 (x, d, a) (Down n) =  (x, d + n, a)

-- | Execute a single action of an Mk2 model submarine 
-- returning the updated state of the submarine.
-- This version of submarine moves only forward and
-- cannot float upp and down without moving.
-- To move vertically the aim angle has to be adjusted accordingly
-- before moving.
--
-- >>> mk2 (0,0,1) (Forward 10)
-- (10,10,1)
--
-- >>> mk2 (mk2 (10,0,0) (Down 1290)) (Up 3000)
-- (10,0,-1710)
--
mk2 :: Stats -> Command -> Stats
mk2 (x, d, a) (Forward n) = (x + n, max 0 (d + toEnum a * n), a)
mk2 (x, d, a) (Up n) = (x, d, a - fromEnum n)
mk2 (x, d, a) (Down n) = (x, d, a + fromEnum n)

-- | Run a program from the starting submarine state until completion
-- and returns the final state of the submarine.
--
-- >>> runFromStart Mk1 [Forward 5, Down 5, Forward 8, Up 3, Down 8, Forward 2]
-- (15,10,0)
-- 
-- >>> runFromStart Mk2 [Forward 5, Down 5, Forward 8, Up 3, Down 8, Forward 2]
-- (15,60,10)
--
runFromStart :: Version -> Program -> Stats
runFromStart Mk1 = foldl mk1 start
runFromStart Mk2 = foldl mk2 start
