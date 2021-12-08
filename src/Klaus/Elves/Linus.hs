{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeSynonymInstances #-}

module Klaus.Elves.Linus where

import Klaus.Submarine.Data

class Compl a where
   compl :: a -> a

instance Compl Bit where
   compl B0 = B1
   compl B1 = B0

instance Compl Bin where
   compl = map compl
