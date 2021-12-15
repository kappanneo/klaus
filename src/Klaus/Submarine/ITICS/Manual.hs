module Klaus.Submarine.ITICS.Manual where

import Klaus.WordBook ( Number )

type Page1 = ([Dot], [Fold])

newtype Dot = Dot (Number, Number) deriving ( Eq, Ord, Show, Read )

instance Num Dot where
   (+) = liftDot2 (+)
   (*) = liftDot2 (*)
   abs = liftDot abs
   signum = liftDot signum
   fromInteger n = Dot (fromInteger n, 0)
   (-) = liftDot2 (-)

liftDot :: (Number -> Number) -> Dot -> Dot
liftDot f (Dot (x,y)) = Dot (f x, f y)

liftDot2 :: (Number -> Number -> Number) -> Dot -> Dot -> Dot
liftDot2 f (Dot (x,y)) (Dot (z,w)) = Dot (f x z, f y w)

data Fold = FoldAlong Coord Number deriving ( Read, Show )

data Coord = X | Y deriving ( Eq, Read, Show )
