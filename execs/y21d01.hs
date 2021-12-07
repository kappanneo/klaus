import System.Environment

import Klaus.WordBook

import qualified Klaus.Submarine.Sonar as Sonar
import qualified Klaus.Elves.Parsifal as Parsy
import qualified Klaus.Elves.Matthew as Matth
import qualified Klaus as Santa

main :: IO ()
main = do -- IO
   args <- getArgs
   p <- readFile $ if null args then "inputs/y21d01.txt" else args !! 0
   let ms = Parsy.readSonarSweepPrintout p :: [Sonar.Measurement]
   let p1 = Matth.count (uncurry (<)) (zip ms (tail ms)) :: Result
   let p2 = Matth.count (uncurry (<)) (zip ms (drop 3 ms)) :: Result
   Santa.takeCreditForElvesUnderpaidWork p1 p2