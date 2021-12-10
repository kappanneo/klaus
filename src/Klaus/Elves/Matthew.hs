module Klaus.Elves.Matthew where

import Data.List ( transpose )

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
-- >>> count (const True) [1..10] :: Bool
-- *** Exception: Prelude.Enum.Bool.succ: bad argument
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
-- >>> succIf (<3) 2.99 (-1)
-- 0
--
-- >>> succIf null "" True
-- *** Exception: Prelude.Enum.Bool.succ: bad argument
--
succIf :: Enum b => (a -> Bool) -> a -> b -> b
succIf p x n = if p x then succ n else n
