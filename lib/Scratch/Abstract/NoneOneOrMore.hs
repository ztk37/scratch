module Scratch.Abstract.NoneOneOrMore where

data NoneOneOrMore a
  = None
  | One a
  | More [a]
  deriving (Eq, Show)