import System.Environment

import Klaus.WordBook

import qualified Klaus.Elves.Parsifal as Parsy 
import qualified Klaus.Elves.Nemo as Nemo
import qualified Klaus.Submarine as Subby
import qualified Klaus as Santa

main :: IO ()
main = do -- IO
   args <- getArgs
   printout <- readFile $ if null args then "inputs/y21d02.txt" else args !! 0
   let prog = Parsy.read printout :: Subby.Program
   let (x, depth, _) = Nemo.runFromStart Subby.Mk1 prog :: Subby.Stats
   let p1 = x * depth :: Result
   let (x, depth, _) = Nemo.runFromStart Subby.Mk2 prog :: Subby.Stats
   let p2 = x * depth :: Result
   Santa.takeCreditForElvesUnderpaidWork p1 p2
