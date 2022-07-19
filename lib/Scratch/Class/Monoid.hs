module Scratch.Class.Monoid where

import Prelude hiding (Semigroup, (<>), Monoid, mempty, mappend, mconcat)

class Semigroup a where
  (<>) :: a -> a -> a

class Semigroup a => Monoid a where
  mempty :: a
  mappend :: a -> a -> a
  mconcat :: [a] -> a
