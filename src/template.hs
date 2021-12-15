import qualified Klaus.Elves.Argo as Argo
import qualified Klaus.Elves.Parsifal as Parsy
import qualified Klaus as Santa

import Klaus.WordBook ( Result, Xxx )

-- | @  @
--
-- <https://adventofcode.com/2021/day/xx>
-- >>> main
-- 0
-- 0
--
main :: IO ()
main = do -- IO
   file <- Argo.fromArgs 2000 00 :: IO FilePath
   xxx <- Parsy.parseFile file :: IO Xxx

   let p1 = 0 :: Result
   let p2 = 0 :: Result
   Santa.takeCreditForElvesUnderpaidWork p1 p2
