module Klaus.Submarine.Data where

import Text.ParserCombinators.ReadP

data Bit = Bit0 | Bit1 deriving (Eq,Ord,Enum,Bounded)
type Bin = [Bit]
type Diagnostics = [Bin]

instance Show Bit where
   show Bit0 = "0"
   show Bit1 = "1"

   showList bits = (++) (concat $ map show bits) :: ShowS

instance Read Bit where
   readsPrec _ ('0':s) = [(Bit0,s)]
   readsPrec _ ('1':s) = [(Bit1,s)]
   readsPrec _ _ = []

   readList = readP_to_S (many $ readS_to_P reads) :: ReadS [Bit]
