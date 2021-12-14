module Klaus.Elves.Matthew where

import Klaus.Submarine.ITICS.Manual
    ( Fold(..), Coord(Y, X), Dot(..), Page1, liftDot2 )
import Klaus.WordBook ( Number )
import Data.List ( nub, sort, transpose )

-- | Returns the number elements for which the given 
-- predicate is true.
--
-- >>> count (=='a') "alpaca" :: Int
-- 3
-- 
-- >>> count (<3) [3..10] :: Bool
-- False
--
-- >>> count (const True) [1..10] :: Int
-- 10
--
count :: (Enum b, Foldable t) => (a -> Bool) -> t a -> b
count p = foldr (succIf p) (toEnum 0)

-- | Given a predicate, an element of matching type and an enum value
-- returns the successive enum value if the element satisfies the predicate,
-- the unchanged enum value otherwise. Can fail if the enum exits its domain.
-- 
-- >>> succIf (>5) 6 False
-- True
--
-- >>> succIf (=="ciao") "ciao" 'x'
-- 'y'
--
-- >>> succIf (<3) 2.99 (-1.0)
-- 0.0
--
succIf :: Enum b => (a -> Bool) -> a -> b -> b
succIf p x n = if p x then succ n else n

foldAll :: Page1 -> [Dot]
foldAll (dots,folds) = foldl fold dots folds

fold :: [Dot] -> Fold -> [Dot]
fold dots (FoldAlong c n) = case c of
   X -> nub $ map (fX n) dots
   Y -> nub $ map (fY n) dots
 where
   fX :: Number -> Dot -> Dot
   fX n (Dot (x,y))
    | x > n = Dot (2*n - x, y)
    | otherwise = Dot (x,y)

   fY :: Number -> Dot -> Dot
   fY n (Dot (x,y))
    | y > n = Dot (x, 2*n -y)
    | otherwise = Dot (x,y)

len :: [Dot] -> Number
len = toEnum . length

dotX :: Dot -> Number 
dotX (Dot (x,_)) = x 

doty :: Dot -> Number 
doty (Dot (_,y)) = y 

maximumDot :: [Dot] -> Dot
maximumDot = foldl (liftDot2 max) (Dot (0,0))

printGrid :: [Dot] -> String
printGrid dots = unlines $ transpose $ map (printLine dots) [0..maxX]
 where 
   (Dot (maxX,maxY)) = maximumDot dots
   printLine dots n
    = [ if Dot (n,i) `elem` dots then '#' else '.' | i <- [0..maxY] ] 
