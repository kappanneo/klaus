{-# LANGUAGE FlexibleInstances #-}

module Klaus.Elves.Parsifal where

import qualified Klaus.Submarine as Submarine
import qualified Klaus.Submarine.Data as Data
import qualified Klaus.Submarine.Sonar as Sonar
import qualified Klaus.Submarine.Bingo as Bingo
import qualified Klaus.Submarine.ITICS.Manual as Manual
import qualified Klaus.Submarine.Polymerization as Polymerization
import qualified Klaus.Bestiary.Amphipod as Amphipod

import Klaus.WordBook ( Number, Measurement )

import Data.Char ( toUpper )
import Data.List.Split ( splitOn, chunksOf )
import Klaus.Submarine.Bingo (fromNumber)
import Klaus.Submarine.Sonar (Passage(LeadsTo))

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


-- | The first two elements of a list.
--
-- >>> head2 [1,2,3]
-- (1,2)
--
head2 :: [a] -> (a,a)
head2 xs = ( head xs, head (tail xs) )

class Read a => Parsiable a where

   parse :: String -> a
   parse = read

   parseLines :: [String] -> [a]
   parseLines = map parse

   parseFile :: FilePath -> IO a
   parseFile file = do -- IO
      s <- readFile file
      return (parse s)

instance Parsiable Number

instance Parsiable [Number]

instance Parsiable Sonar.Sweep where
   parse = Sonar.Sweep . parseLines . lines

-- | Parsing functions for 'Sonar.Passage'. 
--
-- >>> parseLine "AB-CD" :: Sonar.Passage
-- "AB" `LeadsTo` "CD"
--
instance Parsiable Sonar.Passage where
   parse = uncurry LeadsTo . head2 . splitOn "-"

instance Parsiable Sonar.Scan where
   parse = parseLines . lines

instance Parsiable Submarine.Command where
   parse = read . uppercase

instance Parsiable Submarine.Program  where
   parse = map parse . lines

instance Parsiable Data.Bin

instance Parsiable Data.Diagnostics where
   parse = map parse . lines

instance Parsiable Bingo.Slot where
   parse = fromNumber . read

instance Parsiable Bingo.Board where
   parse = chunksOf 5 . parseLines . take 25 . words

instance Parsiable Bingo.Round where
   parseFile file = do -- IO
      s <- readFile file :: IO String
      let (ns:bs) = splitOn "\n\n" s
      return (parse ("[" ++ ns ++ "]"), parseLines bs)

instance Parsiable Manual.Page1 where
   parseFile file = do -- IO
      s <- readFile file 
      let (dots,folds) = head2 (splitOn "\n\n" s)
      return (parseLines (lines dots), parseLines (lines folds))

instance Parsiable Manual.Dot where
   parse = Manual.Dot . head2 . map read . splitOn ","

instance Parsiable [Manual.Dot] where
   parse = parseLines . lines

instance Parsiable Manual.Fold where
   parse s
    | take k s == pre = p (drop k s)
    | otherwise = error "no parse"
      where
         pre = "fold along "
         k = length pre

         p (ch:'=':n) = Manual.FoldAlong (rch ch) (read n)
         p _ = error "no parse"

         rch = read . pure . toUpper

instance Parsiable [Manual.Fold] where
   parse = parseLines . lines

instance Parsiable Polymerization.Process where
   parseFile file = do -- IO
      s <- readFile file
      let (templ,rules) = head2 $ splitOn "\n\n" s
      return (parse s, parseLines (lines rules))

instance Parsiable Polymerization.Template where
   parse = id

instance Parsiable Polymerization.Rule where
   parse = uncurry Polymerization.Then . head2 . splitOn " -> "

instance Parsiable [Polymerization.Rule] where
   parse = parseLines . lines

instance Parsiable Amphipod.Nest where
   parseLines = undefined