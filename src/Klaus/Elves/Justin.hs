module Klaus.Elves.Justin where

import Data.Maybe ( fromJust )

-- | Standard function to retrieve the content of a Maybe monad.
-- it fails on *Nothing* values.
--
-- >>> Data.Maybe.fromJust (Just Nothing)
-- Nothing
-- 
-- >>> Data.Maybe.fromJust (Nothing) 
-- Maybe.fromJust: Nothing
--
fromJust :: Maybe a -> a
fromJust = Data.Maybe.fromJust
