import System.Environment

import qualified Klaus as Santa

main :: IO ()
main = do -- IO
   args <- getArgs
   printout <- readFile $ if null args then "inputs/.txt" else args !! 0
   let p1 = 0 :: Result
   let p2 = 0 :: Result
   Santa.takeCreditForElvesUnderpaidWork p1 p2