module Klaus.Submarine.Sonar where

import Klaus.WordBook ( Measurement )

-- | A sonar sweep consists of a series of depth measurements.
type Sweep = [Measurement]
