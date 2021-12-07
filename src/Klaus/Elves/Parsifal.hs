module Klaus.Elves.Parsifal where

import Klaus.Paperwork
import qualified Klaus.Submarine.Sonar as Sonar

readSonarSweepPrintout :: Printout -> Sonar.Sweep
readSonarSweepPrintout = map read . lines