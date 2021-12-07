{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeSynonymInstances #-}

module Klaus.Elves.Parsifal where

import Klaus.Paperwork

import qualified Klaus.Submarine as Submarine
import qualified Klaus.Submarine.Sonar as Sonar

class Parsiable a where
   read :: String -> a

instance Parsiable Sonar.Sweep where
   read = map Prelude.read . lines

instance Parsiable Submarine.Program where
   read = map (Prelude.read . uppercase) . lines