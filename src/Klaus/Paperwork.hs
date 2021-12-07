module Klaus.Paperwork where

import Data.Char

uppercase :: String -> String
uppercase (c:cs) = toUpper c : cs