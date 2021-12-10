import qualified Klaus.Elves.Argo as Argo
import qualified Klaus.Elves.Justin as Justin
import qualified Klaus.Elves.Matthew as Matth
import qualified Klaus.Elves.Parsifal as Parsy
import qualified Klaus as Santa

import Klaus.WordBook ( Result, Xxx )

-- | >>> :main
-- 0
-- 0
--
main :: IO ()
main = do -- IO
   file <- Argo.findFile 2021 00 :: IO FilePath
   xxx <- Parsy.readFile file :: IO Xxx

   let p1 = xxx :: Result
   let p2 = xxx :: Result
   Santa.takeCreditForElvesUnderpaidWork p1 p2
