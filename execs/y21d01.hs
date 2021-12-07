import System.Environment

import Klaus.WordBook

import qualified Klaus.Submarine.Sonar as Sonar
import qualified Klaus.Elves.Parsifal as Parsy
import qualified Klaus.Elves.Matthew as Matth
import qualified Klaus as Santa

main :: IO ()
main = do -- IO
   args <- getArgs
   printout <- readFile $ if null args then "inputs/y21d01.txt" else args!!0
   let (Sonar.SweepData xs) = Parsy.read printout :: Sonar.SweepData
   let p1 = Matth.count (uncurry (<)) (zip xs (tail xs)) :: Result
   let p2 = Matth.count (uncurry (<)) (zip xs (drop 3 xs)) :: Result
   Santa.takeCreditForElvesUnderpaidWork p1 p2