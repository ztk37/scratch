module Scratch.Abstract.Option where

data Option a = None | Some a
  deriving (Eq, Show)