module Klaus.Elves.Matthew where

count :: Enum b => (a -> Bool) -> [a] -> b
count p = foldr (succIf p) (toEnum 0)

succIf :: Enum b => (a -> Bool) -> a -> b -> b
succIf p x n = if p x then succ n else n