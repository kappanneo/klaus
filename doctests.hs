{-# LANGUAGE BlockArguments #-}

import Data.Foldable ( for_ )
import Data.List ( reverse, sort, isPrefixOf )
import System.Directory ( listDirectory, Permissions (executable) )
import System.Directory.Extra ( listDirectory, listFilesRecursive )
import System.FilePath ( (</>), takeBaseName, takeExtension )
import System.IO ( stderr, hPutStrLn )
import Test.DocTest ( doctest )

main :: IO ()
main = do -- IO
   files <- onlyExecutables
   for_ files \file -> do -- IO
      hPutStrLn stderr ("\nTesting " ++ file)
      doctest [file]

allSourceFiles :: IO [FilePath]
allSourceFiles = filter (\x -> takeExtension x == ".hs") . sort 
   <$> listFilesRecursive "src"

onlyExecutables :: IO [FilePath]
onlyExecutables = reverse .  filter (isPrefixOf "src/y") <$> allSourceFiles
