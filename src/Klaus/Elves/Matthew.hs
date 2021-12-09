module Klaus.Elves.Matthew where

import Data.List

count :: (Enum b, Foldable t) => (a -> Bool) -> t a -> b
count p = foldr (succIf p) (toEnum 0)

succIf :: Enum b => (a -> Bool) -> a -> b -> b
succIf p x n = if p x then succ n else n

transpose :: [[a]] -> [[a]]
transpose = Data.List.transpose
