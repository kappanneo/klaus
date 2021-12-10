module Klaus.Elves.Justin where

import Data.Maybe ( fromJust )

-- | Standard function to retrieve the content of a Maybe monad.
-- it fails on *Nothing* values.
--
-- >>> Data.Maybe.fromJust (Just Nothing)
-- Nothing
-- 
-- >>> Data.Maybe.fromJust (Nothing) 
-- *** Exception: Maybe.fromJust: Nothing
-- CallStack (from HasCallStack):
--   error, called at libraries/base/Data/Maybe.hs:148:21 in base:Data.Maybe
--   fromJust, called at <interactive>:25:1 in interactive:Ghci5
fromJust :: Maybe a -> a
fromJust = Data.Maybe.fromJust