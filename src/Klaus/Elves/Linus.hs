{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeSynonymInstances #-}

module Klaus.Elves.Linus where

import Klaus.Submarine.Data

class Compl a where
   compl :: a -> a

instance Compl Bit where
   compl Bit0 = Bit1
   compl Bit1 = Bit0

instance Compl Bin where
   compl = map compl

fromBin :: (Enum a, Num a) => Bin -> a
fromBin = foldr (\bit n -> n * 2 + fromBit bit) 0

fromBit :: Enum a => Bit -> a
fromBit = toEnum . fromEnum

toBit :: Enum a => a -> Bit
toBit = toEnum . fromEnum

mostFreqBit :: Bin -> Maybe Bit
mostFreqBit bin = do -- Maybe
   bit <- leastFreqBit bin
   return (compl bit)

leastFreqBit :: Bin -> Maybe Bit
leastFreqBit bits | x > h = Just Bit0
                  | x < h = Just Bit1
                  | otherwise = Nothing
 where   
   x = sum (map fromBit bits)
   h = n `div` 2
   n = length bits
 