module Klaus.Submarine.Data where

import Text.ParserCombinators.ReadP

data Bit = B0 | B1 deriving (Eq,Ord)
type Bin = [Bit]
type Diagnostics = [Bin]

instance Show Bit where
   show B0 = "0"
   show B1 = "1"

   showList bits = (++) (concat $ map show bits) :: ShowS

instance Read Bit where
   readsPrec _ ('0':s) = [(B0,s)]
   readsPrec _ ('1':s) = [(B1,s)]
   readsPrec _ _ = []

   readList = readP_to_S (many $ readS_to_P reads) :: ReadS [Bit]
