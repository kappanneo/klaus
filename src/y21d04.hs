import qualified Klaus.Elves.Argo as Argo
import qualified Klaus.Elves.Justin as Justin
import qualified Klaus.Elves.Matthew as Matth
import qualified Klaus.Elves.Parsifal as Parsy
import qualified Klaus.Elves.Rocco as Rocco

import qualified Klaus as Santa

import Klaus.WordBook ( Result, Number )
import qualified Klaus.Submarine.Bingo as Bingo
import qualified GHC.IO.Encoding.Failure as Bingo

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
   round <- Parsy.parseFile file :: IO Bingo.Round
   let wins = Rocco.play round :: [Bingo.Win]
   let p1 = Rocco.countPoints (head wins) :: Result
   let p2 = Rocco.countPoints (last wins) :: Result
   Santa.takeCreditForElvesUnderpaidWork p1 p2
