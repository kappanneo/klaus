module Klaus.Submarine.Data where

import Text.ParserCombinators.ReadP ( many, readP_to_S, readS_to_P )

-- | A bit.
data Bit = Bit0 | Bit1 deriving (Eq,Ord,Enum,Bounded)

-- | A string of bits.
type Bin = [Bit]

-- | A diagnostic report in the form of a list of binary strings.
type Diagnostics = [Bin]

-- | Show intance for the *Bit* data type. It matches the default (derived)
-- implementation of Show Bit for signle bits while *showList* is defined
-- so that a list of bits (binary) is shown in its literal form.
--
-- >>> show Bit0
-- "Bit0"
--
-- >>> show Bit1
-- "Bit1"
--
-- >>> show [Bit1,Bit0,Bit1]
-- "101"
--
instance Show Bit where
   show Bit0 = "Bit0"
   show Bit1 = "Bit1"

   showList = (++) . concatMap showBit :: [Bit] -> ShowS
    where
      showBit :: Bit -> String
      showBit Bit1 = "1"
      showBit Bit0 = "0"

-- | Read instance for the *Bit* data type. It mirrors the custom *Show Bit*
-- implementation.
--
-- >>> read "Bit0" :: Bit
-- Bit0
--
-- >>> read "Bit1" :: Bit
-- Bit1
--
-- >>> read "010100101" :: [Bit]
-- 010100101
--
-- >>> show (read "101" :: [Bit]) == "101"
-- True  
--
instance Read Bit where
   readsPrec _ ('B':'i':'t':'0':s) = [(Bit0, s)]
   readsPrec _ ('B':'i':'t':'1':s) = [(Bit1, s)]
   readsPrec _ _ = []

   readList = readP_to_S (many $ readS_to_P readsBit) :: ReadS [Bit]
    where 
      readsBit :: ReadS Bit
      readsBit ('0':s) = [(Bit0, s)]
      readsBit ('1':s) = [(Bit1, s)]
      readsBit _ = []
