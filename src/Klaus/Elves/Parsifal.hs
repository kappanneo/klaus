{-# LANGUAGE FlexibleInstances #-}

module Klaus.Elves.Parsifal where

import qualified Klaus.Submarine as Submarine
import qualified Klaus.Submarine.Data as Data
import qualified Klaus.Submarine.Sonar as Sonar
import qualified Klaus.Submarine.Bingo as Bingo
import qualified Klaus.Submarine.ITICS.Manual as Manual

import Klaus.WordBook ( Number )

import Data.Char ( toUpper )
import Data.List.Split ( splitOn, chunksOf, Splitter )
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

   parseLine :: String -> a
   parseLine = read

   parseLines :: String -> a
   parseLines = parseLine

   parseFile :: FilePath -> IO a
   parseFile file = do -- IO
      s <- readFile file
      return (parseLines s)

instance Parsiable Number

instance Parsiable [Number] where -- Sonar.Sweep
   parseLine s = read ("[" ++ s ++ "]")
   parseLines = map read . lines

-- | Parsing funtions for 'Sonar.Passage'. 
--
-- >>> parseLine "AB-CD" :: Sonar.Passage
-- "AB" `LeadsTo` "CD"
--
instance Parsiable Sonar.Passage where
   parseLine = uncurry LeadsTo . head2 . splitOn "-"

instance Parsiable Sonar.Scan where
   parseLines = map parseLine . lines

instance Parsiable Submarine.Command where
   parseLine = read . uppercase

instance Parsiable Submarine.Program  where
   parseLines = map parseLine . lines

instance Parsiable Data.Bin

instance Parsiable Data.Diagnostics where
   parseLines = map parseLine . lines

instance Parsiable Bingo.Slot where
   parseLine = fromNumber . read

instance Parsiable Bingo.Board where
   parseLines = chunksOf 5 . map parseLines . take 25 . words

instance Parsiable Bingo.Round where
   parseFile file = do -- IO
      s <- readFile file :: IO String
      let (ns:bs) = splitOn "\n\n" s
      return (parseLine ns, map parseLines bs)

instance Parsiable Manual.Page1 where
   parseFile file = do -- IO
      s <- readFile file 
      let (dots,folds) = head2 (splitOn "\n\n" s)
      return (parseLines dots, parseLines folds)

instance Parsiable Manual.Dot where
   parseLine = Manual.Dot . head2 . map read . splitOn ","

instance Parsiable [Manual.Dot] where
   parseLines = map parseLine . lines

instance Parsiable Manual.Fold where
   parseLine s
    | take k s == pre = p (drop k s)
    | otherwise = error "no parse"
      where
         pre = "fold along "
         k = length pre

         p (ch:'=':n) = Manual.FoldAlong (rch ch) (read n)
         p _ = error "no parse"

         rch = read . pure . toUpper

instance Parsiable [Manual.Fold] where
   parseLines = map parseLine . lines
