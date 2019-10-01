module Monad18 where

import           Control.Monad

-- fmap :: Functor f => (a -> b) -> f a -> f b
-- join :: Monad m => m (m a) -> m a
-- bind :: Monad m => (a -> m b) -> m a -> m b
-- bind f m = join $ fmap f m
data Sum a b
  = First a
  | Second b
  deriving (Eq, Show)

instance Functor (Sum a) where
  fmap = undefined

instance Applicative (Sum a) where
  pure = undefined
  (<*>) = undefined

instance Monad (Sum a) where
  return = pure
  (>>=) = undefined
