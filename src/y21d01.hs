import qualified Klaus.Elves.Argo as Argo
import qualified Klaus.Elves.Matthew as Matth
import qualified Klaus.Elves.Parsifal as Parsy
import qualified Klaus as Santa

import Klaus.WordBook ( Result )
import qualified Klaus.Submarine.Sonar as Sonar

-- | @ --- Day 1: Sonar Sweep --- @
--
-- <https://adventofcode.com/2021/day/1>
-- >>> main
-- 1688
-- 1728
--
main :: IO ()
main = do -- IO
   file <- Argo.fromArgs 2021 01 :: IO FilePath
   (Sonar.Sweep ms) <- Parsy.parseFile file :: IO Sonar.Sweep
   let p1 = Matth.count ( uncurry (<) ) ( zip ms ( tail ms ) ) :: Result
   let p2 = Matth.count ( uncurry (<) ) ( zip ms ( drop 3 ms ) ) :: Result
   Santa.takeCreditForElvesUnderpaidWork p1 p2 :: IO ()
