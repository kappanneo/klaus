import System.Environment

import Klaus.WordBook

import qualified Klaus.Elves.Parsifal as Parsy
import qualified Klaus.Submarine.Data as Data
import qualified Klaus as Santa

main :: IO ()
main = do -- IO
   args <- getArgs
   printout <- readFile $ if null args then "inputs/y21d03.txt" else args !! 0
   let bins = Parsy.read printout:: [Data.Bin]
   print (read (show bins) :: [Data.Bin])
   
   let p1 = 0 :: Result
   let p2 = 0 :: Result
   Santa.takeCreditForElvesUnderpaidWork p1 p2
