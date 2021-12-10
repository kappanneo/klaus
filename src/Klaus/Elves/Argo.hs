{-# LANGUAGE BlockArguments #-}

module Klaus.Elves.Argo where

import System.Environment ( getArgs )
import Klaus.WordBook ( Day, Year )
import Data.List ( isPrefixOf )

-- | Sets the default arguments
-- -the day and year in numbers- that are replaced by the eventual
-- arguments the program is executed with and used to construct and return 
-- the file path of the input file.
-- If only one argument is passed to the executable, it is interpreted as
-- a complete path for a custom input file and the latter is returned instead.
--
-- >>> inputFileFromArgs 2020 20
-- "inputs/y20d20.txt"
--
inputFileFromArgs :: Year -> Day -> IO FilePath
inputFileFromArgs y d = do -- IO
   args <- getArgs
   return case filter (not . isPrefixOf "-") args of
      []      -> inputFile y d
      (y:d:_) -> inputFile (read y) (read d)
      (a:_)   -> a

-- | Returns the path to the input txt file matching the given day and year.
--
-- >>> inputFile 2015 25
-- "inputs/y15d25.txt"
-- 
-- >>> inputFile 2021 01
-- "inputs/y21d01.txt"
--
inputFile :: Year -> Day -> FilePath
inputFile y d = "inputs/" ++ yearTag y ++ dayTag d ++ ".txt"

-- | Returns two-char representation of the given year number, prefixed
-- by the char \'y\'. Only allows years from 2015 to 2100.
--
-- >>> yearTag 2015
-- "y15"
--
-- >>> yearTag 2083
-- "y83"
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
dayTag :: Day -> String
dayTag d | d < 1 = error "invalid day, should be in range (1,25)"
         | d < 10 = 'd' : '0' : show d
         | d < 26 = 'd' : show d
         | otherwise = dayTag 0
