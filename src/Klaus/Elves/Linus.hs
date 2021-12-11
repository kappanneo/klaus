{-# LANGUAGE FlexibleInstances #-}

module Klaus.Elves.Linus where

import Klaus.Submarine.Data ( Bin, Bit(..), Diagnostics )

import Data.Maybe ( fromMaybe, fromJust )
import Data.List ( transpose )

import Klaus.WordBook ( Number )

-- | Class of complementable types.
class Compl a where
   compl :: a -> a

-- | Complement of bits.
--
-- >>> compl Bit0
-- Bit1
--
-- >>> compl (compl Bit0)
-- Bit0
--
instance Compl Bit where
   compl Bit0 = Bit1
   compl Bit1 = Bit0

-- | Complement of binaries.
--
-- >>> compl (read "001010") :: Bin
-- 110101
--
instance Compl Bin where
   compl = map compl

-- | Base 2 conversion to decimal value as numeric enum type.
-- 
-- >>> fromBin (read "00001")
-- 1
-- 
-- >>> fromBin (read "0101")
-- 5
-- 
-- >>> fromBin [Bit0] :: Float
-- 0.0
-- 
fromBin :: (Enum a, Num a) => Bin -> a
fromBin = foldl (\n bit -> n * 2 + fromBit bit) 0

-- | Converts from a Bit to any 'Enum' type like 'Bool'.
-- It may fail if the target enum type does not have constructors
-- corrisponding to the 'Int' values 0 and 1, but I cannot think 
-- of an example of such a type.
--
-- >>> fromBit Bit0 :: Bool
-- False
-- 
-- >>> fromBit Bit1 :: Int
-- 1
--
fromBit :: Enum a => Bit -> a
fromBit = toEnum . fromEnum

-- | Converts any 'Enum' type to 'Bit'. Only really works with Bool.
--
-- >>> toBit True
-- Bit1
--
-- >>> toBit False
-- Bit0
--
toBit :: Bool -> Bit
toBit True  = Bit1
toBit False = Bit0

-- | Most common bit in a binary string.
-- Returns 'Nothing' if there are as many ones as zeros.
--
-- >>> mostCommBit (read "01100")
-- Just Bit0
--
-- >>> mostCommBit (read "01")
-- Nothing
--
-- >>> mostCommBit (read "1")
-- Just Bit1
--
mostCommBit :: Bin -> Maybe Bit
mostCommBit bin = do -- Maybe
   bit <- leastCommBit bin
   return (compl bit)

-- | Lest common bit in a binary string.
-- Returns 'Nothing' if there are as many ones as zeros.
--
-- >>> leastCommBit (read "001")
-- Just Bit1
-- 
leastCommBit :: Bin -> Maybe Bit
leastCommBit bits | x > h = Just Bit0
                  | x < h = Just Bit1
                  | otherwise = Nothing
 where   
   x = sum (map fromBit bits) :: Double
   h = fromIntegral n / 2     :: Double
   n = length bits            :: Int

-- | Policy that applied to a binary string returns a bit.
type Policy = (Bin -> Bit)

apply :: Policy -> Diagnostics -> Bin
apply = map

applyByColumn :: Policy -> Diagnostics -> Bin
applyByColumn p = apply p . transpose

decodeEpsilonGamma :: Diagnostics -> (Number, Number)
decodeEpsilonGamma diagn = (fromBin epsilon, fromBin $ compl epsilon) 
 where epsilon = applyByColumn (fromJust . leastCommBit) diagn

-- | Decode the submarine diagnostics file.
-- Returns 'Nothing' if the file is empty, 'Just' a binary string 
-- representing the value of the target rating, otherwise.
-- 
decodeWith :: Policy -> Diagnostics -> Maybe Bin
decodeWith p = d 0
 where
   d :: Int -> [Bin] -> Maybe Bin
   d _ [] = Nothing
   d _ [x] = Just x
   d i xs = d (i + 1) (filter (\x -> x !! i == p (transpose xs !! i)) xs)

decodeOxygen :: Diagnostics -> Number
decodeOxygen = fromBin . fromJust . decodeWith (fromMaybe Bit1 . mostCommBit)

decodeCO2Scrub :: Diagnostics -> Number
decodeCO2Scrub = fromBin . fromJust . decodeWith (fromMaybe Bit0 . leastCommBit)