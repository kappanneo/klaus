module Klaus.Submarine.Polymerization where

type Process = (Template, [Rule])

type Sequence = String
type Template = Sequence 

data Rule = Sequence `Then` Sequence deriving ( Eq, Show, Read )
