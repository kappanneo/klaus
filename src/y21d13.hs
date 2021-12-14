import qualified Klaus.Elves.Argo as Argo
import qualified Klaus.Elves.Justin as Justin
import qualified Klaus.Elves.Matthew as Matth
import qualified Klaus.Elves.Parsifal as Parsy
import qualified Klaus as Santa

import Klaus.WordBook ( Result )
import qualified Klaus.Submarine.ITICS.Manual as Manual

-- | @ --- Day 13: Transparent Origami --- @
--
-- <https://adventofcode.com/2021/day/13>
-- >>> main
-- .##....##.####..##..#....#..#.###....##
-- #..#....#....#.#..#.#....#..#.#..#....#
-- #.......#...#..#....#....#..#.#..#....#
-- #.##....#..#...#.##.#....#..#.###.....#
-- #..#.#..#.#....#..#.#....#..#.#....#..#
-- .###..##..####..###.####..##..#.....##.
-- 695
-- "GJZGLUPJ"
--
main :: IO ()
main = do -- IO
   file <- Argo.fromArgs 2021 13 :: IO FilePath
   (dots,folds) <- Parsy.parseFile file :: IO Manual.Page1
   let p1 = Matth.len ( Matth.fold dots (head folds) ):: Result
   putStr $ Matth.printGrid ( Matth.foldAll (dots,folds))
   let p2 = "GJZGLUPJ" :: String
   Santa.takeCreditForElvesUnderpaidWork p1 p2

