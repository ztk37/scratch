{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Scratch.Phantom.Tagged where

import Scratch.Phantom.Proxy
import Data.Bifunctor

newtype Tagged tag a = Tagged
    { unTagged :: a
    } deriving (Eq, Show)

untag :: Tagged tag a -> a
untag = unTagged

retag :: Proxy tag' -> Tagged tag a -> Tagged tag' a
retag _ (Tagged a) = Tagged a

getTag :: Tagged tag a -> Proxy tag
getTag _ = Proxy

instance Functor (Tagged tag) where
  fmap f = Tagged . f . unTagged

instance Bifunctor Tagged where
  bimap _ g = Tagged . g . unTagged
