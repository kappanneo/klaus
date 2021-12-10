{-# LANGUAGE FlexibleInstances #-}

module Klaus.Elves.Parsifal where

import qualified Klaus.Submarine as Submarine
import qualified Klaus.Submarine.Data as Submarine.Data
import qualified Klaus.Submarine.Sonar as Sonar

import Klaus.WordBook ( Xxx )

import System.IO ( readFile )
import Data.Char ( toUpper )

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

class Parsiable a where
   readFile :: FilePath -> IO a

instance Parsiable Xxx where
   readFile = const (return 0) 

instance Parsiable Sonar.Sweep where
   readFile file = do -- IO
      s <- System.IO.readFile file
      return . map read $ lines s

instance Parsiable Submarine.Program where
   readFile file = do -- IO
      s <- System.IO.readFile file
      return . map ( read . uppercase ) $ lines s

instance Parsiable Submarine.Data.Diagnostics where
   readFile file = do -- IO
      s <- System.IO.readFile file
      return . map read $ lines s