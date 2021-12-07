import System.Environment

import qualified Klaus as Santa

main :: IO ()
main = do -- IO
   args <- getArgs
   printout <- readFile $ if null args then "inputs/y21d02.txt" else args!!0

   Santa.takeCreditForElvesUnderpaidWork p1 p2