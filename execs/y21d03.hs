import qualified Klaus.Elves.Argo as Argo
import qualified Klaus.Elves.Justin as Justin
import qualified Klaus.Elves.Matthew as Matth
import qualified Klaus.Elves.Parsifal as Parsy
import qualified Klaus.Elves.Linus as Linus
import qualified Klaus as Santa

import Klaus.WordBook
import qualified Klaus.Submarine.Data as Data

main :: IO ()
main = do -- IO
   file <- Argo.findFile 2021 03 :: IO FilePath
   bins <- Parsy.readFile file :: IO Data.Diagnostics
   let nibs = Matth.transpose bins :: [Data.Bin]
   let gamma = map (Justin.fromJust . Linus.mostFreqBit) nibs :: Data.Bin
   let epsilon = Linus.compl gamma :: Data.Bin
   let p1 = Linus.fromBin gamma * Linus.fromBin epsilon :: Result
   let co2 = read "000000" :: Data.Bin
   let oxygen = read "000000" :: Data.Bin
   let p2 = Linus.fromBin co2 * Linus.fromBin oxygen :: Result
   Santa.takeCreditForElvesUnderpaidWork p1 p2
