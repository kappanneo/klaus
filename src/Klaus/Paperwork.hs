module Klaus.Paperwork where

import Data.Char

type Printout = String

uppercase :: String -> String
uppercase (c:cs) = toUpper c : cs