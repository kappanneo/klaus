import qualified Klaus.Elves.Argo as Argo
import qualified Klaus.Elves.Matthew as Matth
import qualified Klaus.Elves.Parsifal as Parsy
import qualified Klaus as Santa

import Klaus.WordBook
import qualified Klaus.Submarine.Sonar as Sonar

main :: IO ()
main = do -- IO
   file <- Argo.findFile 2021 01 :: IO FilePath
   ms <- Parsy.readFile file :: IO Sonar.Sweep
   let p1 = Matth.count (uncurry (<)) (zip ms (tail ms)) :: Result
   let p2 = Matth.count (uncurry (<)) (zip ms (drop 3 ms)) :: Result
   Santa.takeCreditForElvesUnderpaidWork p1 p2
