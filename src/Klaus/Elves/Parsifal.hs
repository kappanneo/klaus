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

   parse :: String -> a
   parse = read

   fileParse :: String -> a
   fileParse = parse

   parseFile :: FilePath -> IO a
   parseFile file = do -- IO
      s <- readFile file
      return (fileParse s)

instance Parsiable Number

instance Parsiable [Number] where
   parse s = read ("[" ++ s ++ "]")
   fileParse = map parse . lines

instance Parsiable Submarine.Command where
   parse = read . uppercase

instance Parsiable Submarine.Program  where
   fileParse = map parse . lines

instance Parsiable Data.Bin

instance Parsiable Data.Diagnostics where
   fileParse = map parse . lines

instance Parsiable Bingo.Slot where
   parse = fromNumber . read

instance Parsiable Bingo.Board where
   parse = chunksOf 5 . map parse . take 25 . words

instance Parsiable Bingo.Round where
   parseFile file = do -- IO
      s <- readFile file
      let (ns:bs) = splitOn "\n\n" s
      return (parse ns, map fileParse bs)
