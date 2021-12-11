import qualified Klaus.Elves.Argo as Argo
import qualified Klaus.Elves.Justin as Justin
import qualified Klaus.Elves.Matthew as Matth
import qualified Klaus.Elves.Parsifal as Parsy
import qualified Klaus as Santa

import Klaus.WordBook ( Result, Xxx )
import qualified Klaus.Submarine.Bingo as Bingo

-- | @ --- Day 4: Giant Squid --- @
--
-- <https://adventofcode.com/2021/day/4>
-- >>> main
-- 69579
-- 14877
--
main :: IO ()
main = do -- IO
   file <- Argo.inputFileFromArgs 2021 04 :: IO FilePath
   xxx <- Parsy.parseFile file :: IO Xxx

   let p1 = 0 :: Result
   let p2 = 0 :: Result
   Santa.takeCreditForElvesUnderpaidWork p1 p2

{- from old repo
solve :: String -> IO ()
solve s = do -- IO
   let ss = split "\n\n" s :: [String]
   let ns = map read . split "," $ head ss :: [Number]
   let bs = map readBoard $ tail ss :: [Board]
   let wins = [ (last ns', b ! markAll ns')
              | ns'<-(inits ns)
              , b <- bs
              , b ! markAll ns' ! hasWon && not (b ! markAll(init ns') ! hasWon)
              ] :: [(Number,Board)]
   let f (n,b) = (*) n . sum . map number . filter (not.marked) $ slots b
   putStr "part I: "
   print . f $ head wins
   putStr "part II: "
   print . f $ last wins
-}