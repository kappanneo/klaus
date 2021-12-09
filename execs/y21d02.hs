import qualified Klaus.Elves.Argo as Argo
import qualified Klaus.Elves.Nemo as Nemo
import qualified Klaus.Elves.Justin as Justin
import qualified Klaus.Elves.Matthew as Matth
import qualified Klaus.Elves.Parsifal as Parsy

import qualified Klaus as Santa

import Klaus.WordBook
import qualified Klaus.Submarine as Subby

main :: IO ()
main = do -- IO
   file <- Argo.findFile 2021 02 :: IO FilePath
   prog <- Parsy.readFile file :: IO Subby.Program
   let (x, depth, _) = Nemo.runFromStart Subby.Mk1 prog :: Subby.Stats
   let p1 = x * depth :: Result
   let (x, depth, _) = Nemo.runFromStart Subby.Mk2 prog :: Subby.Stats
   let p2 = x * depth :: Result
   Santa.takeCreditForElvesUnderpaidWork p1 p2
