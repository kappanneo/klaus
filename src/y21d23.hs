import qualified Klaus.Elves.Argo as Argo
import qualified Klaus.Elves.Parsifal as Parsy
import qualified Klaus as Santa

import Klaus.WordBook ( Result, Xxx )

-- | @ --- Day 23: Amphipod --- @
--
-- <https://adventofcode.com/2021/day/23>
-- >>> main
-- 0
-- 0
--
main :: IO ()
main = do -- IO
   file <- Argo.fromArgs 2021 23 :: IO FilePath
   xxx <- Parsy.parseFile file :: IO Xxx

   let p1 = 0 :: Result
   let p2 = 0 :: Result
   Santa.takeCreditForElvesUnderpaidWork p1 p2
