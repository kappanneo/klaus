{-# LANGUAGE FlexibleInstances #-}

module Klaus.Elves.Parsifal where

import qualified Klaus.Submarine as Submarine
import qualified Klaus.Submarine.Data as Data
import qualified Klaus.Submarine.Sonar as Sonar
import qualified Klaus.Submarine.Bingo as Bingo

import Klaus.WordBook ( Number )

import Data.Char ( toUpper )
import Data.List.Split ( splitOn, chunksOf )
import Klaus.Submarine.Bingo (fromNumber)

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

   lineParse :: String -> a
   lineParse = read

   fileParse :: String -> a
   fileParse = lineParse

   parseFile :: FilePath -> IO a
   parseFile file = do -- IO
      s <- readFile file
      return (fileParse s)

instance Parsiable Number

instance Parsiable [Number] where
   lineParse s = read ("[" ++ s ++ "]")
   fileParse = map read . lines

instance Parsiable Submarine.Command where
   lineParse = read . uppercase

instance Parsiable Submarine.Program  where
   fileParse = map lineParse . lines

instance Parsiable Data.Bin

instance Parsiable Data.Diagnostics where
   fileParse = map lineParse . lines

instance Parsiable Bingo.Slot where
   lineParse = fromNumber . read

instance Parsiable Bingo.Board where
   fileParse = chunksOf 5 . map fileParse . take 25 . words

instance Parsiable Bingo.Round where
   parseFile file = do -- IO
      s <- readFile file :: IO String
      let (ns:bs) = splitOn "\n\n" s
      return (lineParse ns, map fileParse bs)
