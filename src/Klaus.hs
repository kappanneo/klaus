module Klaus where

import Klaus.WordBook ( Result )

-- | Just prints the two given numbers one after the other.
-- 
-- >>> takeCreditForElvesUnderpaidWork 2 390490
-- 2 
-- 390490
--
takeCreditForElvesUnderpaidWork :: Result -> Result -> IO ()
takeCreditForElvesUnderpaidWork part1 part2 = do print part1
                                                 print part2

-- we all know this is all Santa is good for