module Klaus.Elves.Parsifal where

import qualified Klaus.Paperwork as Paperwork
import qualified Klaus.Submarine.Sonar as Sonar

class ParsifalCanReadIt a where
   read :: Paperwork.Printout -> a

instance ParsifalCanReadIt Sonar.SweepData where
   read = Sonar.SweepData . map Prelude.read . lines