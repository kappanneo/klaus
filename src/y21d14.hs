import qualified Klaus.Elves.Argo as Argo
import qualified Klaus.Elves.Parsifal as Parsy
import qualified Klaus as Santa

import Klaus.WordBook ( Result )

import qualified Klaus.Submarine.Polymerization as Polymerization

-- | @ --- Day 14: Extended Polymerization --- @
--
-- <https://adventofcode.com/2021/day/14>
-- >>> main
-- 0
-- 0
--
main :: IO ()
main = do -- IO
   file <- Argo.fromArgs 2021 14 :: IO FilePath
   (templ, rules) <- Parsy.parseFile file :: IO Polymerization.Process
   print templ
   print rules
   let p1 = 0 :: Result
   let p2 = 0 :: Result
   Santa.takeCreditForElvesUnderpaidWork p1 p2
