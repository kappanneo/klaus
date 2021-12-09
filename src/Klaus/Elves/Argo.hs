module Klaus.Elves.Argo where

import System.Environment
import Klaus.WordBook

findFile:: Year -> Day -> IO FilePath
findFile y d = do -- IO
   args <- getArgs
   case args of
      [] -> return $ "inputs/" ++ yearTag y ++ dayTag d ++ ".txt"
      (x:_) -> return x

yearTag :: Year -> String
yearTag y | y < 2015 = error "invalid year, advent of code started in 2015"
          | y >= 2100 = error "invalid year, I'll probably be dead by then"
          | otherwise = 'y' : show (y `mod` 2000)

dayTag :: Day -> String
dayTag d | d < 1 = error "invalid day, should be in range (1,25)"
         | d < 10 = 'd' : '0' : show d
         | d < 26 = 'd' : show d
         | otherwise = dayTag 0


