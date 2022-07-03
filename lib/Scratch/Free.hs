module Scratch.Free where

data Free f a
  = Pure a
  | Free (f (Free f a))

instance Functor f => Functor (Free f) where
  fmap f (Pure x) = Pure (f x)
  fmap f (Free g) = Free (fmap f <$> g)

instance Functor f => Applicative (Free f) where
  pure = Pure
  (Pure f) <*> (Pure x) = Pure $ f x
  (Pure f) <*> (Free fx) = Free ((f <$>) <$> fx)
  (Free fx) <*> ax = Free ((<*> ax) <$> fx)

instance Functor f => Monad (Free f) where
  return = pure
  {-# INLINE return #-}
  Pure x >>= f = f x
  Free g >>= f = Free ((>>= f) <$> g)

foldFree :: Monad m => (forall x . f x -> m x) -> Free f a -> m a
foldFree _ (Pure a)  = return a
foldFree f (Free as) = f as >>= foldFree f

liftF :: Functor f => f a -> Free f a
liftF f = Free (Pure <$> f)
