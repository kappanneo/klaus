{-# LANGUAGE FlexibleInstances #-}

module Klaus.Elves.Parsifal where

import qualified Klaus.Submarine as Submarine
import qualified Klaus.Submarine.Data as Submarine.Data
import qualified Klaus.Submarine.Sonar as Sonar
import qualified Klaus.Submarine.Bingo as Bingo

import Klaus.WordBook ( Xxx, Number )

import System.IO ( readFile )
import Data.Char ( toUpper )
import Data.List.Split ( splitOn )

-- | Return the given string, but with the first letter capitalized.
-- 
-- uppercase ""
-- ""
--
-- uppercase "anna"
-- "Anna"
--
-- uppercase "Arianna"
-- "Arianna"
--
uppercase :: String -> String
uppercase "" = ""
uppercase (c:cs) = toUpper c : cs

class Read a => Parsiable a where

   parse :: String -> a
   parse = read

   parseFile :: FilePath -> IO a
   parseFile file = do -- IO
      s <- readFile file
      return (parse s)

instance Parsiable Xxx

instance Parsiable Sonar.Sweep where
   parse = map parse . lines

instance Parsiable Submarine.Program where
   parse = map ( read . uppercase ) . lines

instance Parsiable Submarine.Data.Diagnostics where
   parse = map read . lines

{-
instance Parsiable Bingo.Round where
   parseFile file = do -- IO
      s <- readFile file :: IO String
      let xs = splitOn "\n\n" s :: [String]
      let ns = read $ "[" ++ head xs ++ "]" :: [Number]
      let bs = map (map (Bingo.slot . read . words) . lines) (tail xs) :: [Bingo.Board]
      return (ns,bs)
-}