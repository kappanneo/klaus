import qualified Klaus.Elves.Argo as Argo
import qualified Klaus.Elves.Justin as Justin
import qualified Klaus.Elves.Matthew as Matth
import qualified Klaus.Elves.Parsifal as Parsy
import qualified Klaus as Santa

import Prelude ((.), IO, FilePath)
import Klaus.WordBook

main :: IO ()
main = do -- IO
   file <- Argo.findFileName 2021 0x :: IO FilePath
   xxx <- Parsy.readFile file :: IO Xxx

   let p1 = 0 :: Result
   let p2 = 0 :: Result
   Santa.takeCreditForElvesUnderpaidWork p1 p2
