module Scatch.Class.Functor where

import Prelude hiding (Functor, fmap, (<$>))

class Functor f where
  fmap :: (a -> b) -> f a -> f b

instance Functor ((,) a) where
   fmap f (a, b) = (a, f b)

instance Functor ((,,) a b) where
   fmap f (a, b, c) = (a, b, f c)
   
(<$>) :: Functor f => (a -> b) -> f a -> f b
(<$>) = fmap
{-# INLINE (<$>) #-}
