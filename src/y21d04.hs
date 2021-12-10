import qualified Klaus.Elves.Argo as Argo
import qualified Klaus.Elves.Justin as Justin
import qualified Klaus.Elves.Matthew as Matth
import qualified Klaus.Elves.Parsifal as Parsy
import qualified Klaus as Santa

import Klaus.WordBook ( Result, Xxx )
import qualified Klaus.Submarine.Bingo as Bingo

-- | @ --- Day 4: Giant Squid --- @
--
-- <https://adventofcode.com/2021/day/4>
-- >>> main
-- 69579
-- 14877
--
main :: IO ()
main = do -- IO
   file <- Argo.inputFileFromArgs 2021 04 :: IO FilePath
   xxx <- Parsy.parseFile file :: IO Xxx

   let p1 = 0 :: Result
   let p2 = 0 :: Result
   Santa.takeCreditForElvesUnderpaidWork p1 p2
