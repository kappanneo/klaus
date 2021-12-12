import qualified Klaus.Elves.Argo as Argo
import qualified Klaus.Elves.Justin as Just
import qualified Klaus.Elves.Matthew as Matth
import qualified Klaus.Elves.Parsifal as Parsy
import qualified Klaus.Elves.Linus as Linus
import qualified Klaus as Santa

import Klaus.WordBook ( Result, Number )
import qualified Klaus.Submarine.Data as Data

-- | @ --- Day 3: Binary Diagnostic --- @
--
-- <https://adventofcode.com/2021/day/3>
-- >>> main
-- 3912944
-- 4996233
--
main :: IO ()
main = do -- IO
   file <- Argo.fromArgs 2021 03 :: IO FilePath
   diagn <- Parsy.parseFile file :: IO Data.Diagnostics
   let (epsilon, gamma) = Linus.decodeEpsilonGamma diagn :: (Number, Number)
   let p1 = gamma * epsilon :: Result
   let oxygen = Linus.decodeOxygen diagn :: Number
   let co2_scrub = Linus.decodeCO2Scrub diagn :: Number
   let p2 = co2_scrub * oxygen :: Result
   Santa.takeCreditForElvesUnderpaidWork p1 p2
