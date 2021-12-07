module Klaus.Submarine.Sonar where

import Klaus.Submarine.Data

newtype SweepData = SweepData [DepthValue] deriving (Read,Show)
