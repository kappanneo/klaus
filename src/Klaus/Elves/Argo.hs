module Klaus.Elves.Argo where

import System.Environment ( getArgs )
import Klaus.WordBook ( Day, Year )

-- | Returns the file path for the input file computed from 
-- the day and year numbers given to the function as parameters (default). 
-- If only one argument is passed to the executable it is interpreted as
-- a complete path for a custom input file and the latter is returned instead.
--
-- >>> findFile 2020 20
-- "inputs/y20d20.txt"
--
findFile:: Year -> Day -> IO FilePath
findFile y d = do -- IO
   args <- getArgs
   case args of
      [] -> return (inputFilePath y d)
      (a:_) -> return a

-- | Returns the path to the input txt file mathcing the given day and year.
--
-- >>> inputFilePath 2015 25
-- "inputs/y15d25.txt"
-- 
-- >>> inputFilePath 2021 01
-- "inputs/y21d01.txt"
--
inputFilePath :: Year -> Day -> FilePath
inputFilePath y d = "inputs/" ++ yearTag y ++ dayTag d ++ ".txt"

-- | Returns two-char representation of the given year number, prefixed
-- by the char \'y\'. Only allows years from 2015 to 2100.
--
-- >>> yearTag 2015
-- "y15"
--
-- >>> yearTag 2083
-- "y83"
--
-- >>> yearTag 3000
-- "*** Exception: invalid year, I'll probably be dead by then
-- CallStack (from HasCallStack):
--   error, called at src/Klaus/Elves/Argo.hs:53:25 in main:Klaus.Elves.Argo
--
-- >>> yearTag 2000
-- "*** Exception: invalid year, advent of code started in 2015
-- CallStack (from HasCallStack):
--   error, called at src/Klaus/Elves/Argo.hs:52:24 in main:Klaus.Elves.Argo
--
yearTag :: Year -> String
yearTag y | y < 2015 = error "invalid year, advent of code started in 2015"
          | y >= 2100 = error "invalid year, I'll probably be dead by then"
          | otherwise = 'y' : show (y `mod` 2000)

-- | Returns two-char representation of the given day number, prefixed
-- by the char \'d\'. Only allows advent-calendar days (from 1 to 25).
--
-- >>> dayTag 1
-- "d01"
--
-- >>> dayTag 13
-- "d13"
--
-- >>> dayTag 32
-- "*** Exception: invalid day, should be in range (1,25)
-- CallStack (from HasCallStack):
--   error, called at src/Klaus/Elves/Argo.hs:71:20 in main:Klaus.Elves.Argo
--
dayTag :: Day -> String
dayTag d | d < 1 = error "invalid day, should be in range (1,25)"
         | d < 10 = 'd' : '0' : show d
         | d < 26 = 'd' : show d
         | otherwise = dayTag 0
