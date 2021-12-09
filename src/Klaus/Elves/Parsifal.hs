{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeSynonymInstances #-}

module Klaus.Elves.Parsifal where

import qualified Klaus.Submarine as Submarine
import qualified Klaus.Submarine.Data as Submarine.Data
import qualified Klaus.Submarine.Sonar as Sonar

import System.IO (readFile)
import Data.Char

uppercase :: String -> String
uppercase "" = ""
uppercase (c:cs) = toUpper c : cs

class Parsiable a where
   readFile :: FilePath -> IO a

instance Parsiable Sonar.Sweep where
   readFile file = do -- IO
      s <- System.IO.readFile file
      return . map read $ lines s

instance Parsiable Submarine.Program where
   readFile file = do -- IO
      s <- System.IO.readFile file
      return . map (read . uppercase) $ lines s

instance Parsiable Submarine.Data.Diagnostics where
   readFile file = do -- IO
      s <- System.IO.readFile file
      return . map read $ lines s