module Klaus.Elves.Nemo where

import Klaus.Submarine

mk1 :: Stats -> Command -> Stats
mk1 (x, d, a) (Forward n) = (x+n, d, a)
mk1 (x, d, a) (Up n) = (x, max (d-n) 0, a)
mk1 (x, d, a) (Down n) =  (x, d+n, a)

mk2 :: Stats -> Command -> Stats
mk2 (x, d, a) (Forward n) = (x+n, max 0 (d+a*n), a)
mk2 (x, d, a) (Up n) = (x, d, a-n)
mk2 (x, d, a) (Down n) = (x, d, a+n)

runFromStart :: Version -> Program -> Stats
runFromStart Mk1 = foldl mk1 start
runFromStart Mk2 = foldl mk2 start
