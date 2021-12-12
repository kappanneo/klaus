import qualified Klaus.Elves.Argo as Argo
import qualified Klaus.Elves.Justin as Justin
import qualified Klaus.Elves.Matthew as Matth
import qualified Klaus.Elves.Parsifal as Parsy
import qualified Klaus as Santa

import Klaus.WordBook ( Result )

import qualified Klaus.Submarine.Sonar as Sonar

-- | @ --- Day 12: Passage Pathing --- @
--
-- <https://adventofcode.com/2021/day/12>
-- >>> main
-- 0
-- 0
--
main :: IO ()
main = do -- IO
   file <- Argo.fromArgs 2021 12 :: IO FilePath
   scan <- Parsy.parseFile file :: IO Sonar.Scan
   print scan
   let p1 = 0 :: Result
   let p2 = 0 :: Result
   Santa.takeCreditForElvesUnderpaidWork p1 p2
