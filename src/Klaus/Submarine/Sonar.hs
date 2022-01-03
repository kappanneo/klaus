module Klaus.Submarine.Sonar where

import Klaus.WordBook ( Measurement )

-- | A sonar sweep consists of a series of depth measurements.
newtype Sweep = Sweep [Measurement] deriving (Eq,Read,Show)

-- | A sona scan allows to detect passages and opening between underwater
-- caves. The 'Scan' data type stores the resulting graph in the form 
-- of a list of edges (passages).
type Scan = [Passage]

data Passage = CaveID `LeadsTo` CaveID deriving ( Read, Show )

-- | This is an undirected graph, so edges equality is such that
-- two edges are considered equal if the have the same start- and
-- end-points, no matter the order.
--
-- >>> ("a" `LeadsTo` "b") == ("a" `LeadsTo` "b")
-- True
--
-- >>> ("a" `LeadsTo` "b") == ("b" `LeadsTo` "c")
-- False
--
-- >>> ("a" `LeadsTo` "b") == ("b" `LeadsTo` "a")
-- True
--
instance Eq Passage where
   (x `LeadsTo` y) == (z `LeadsTo` w) = (x == z && y == w) || (x == w) && (y == z)

type CaveID = String

