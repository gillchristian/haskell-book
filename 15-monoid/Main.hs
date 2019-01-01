module MonoidT where

import           Data.Monoid

data Optional a
  = Nada
  | Only a
  deriving (Eq, Show)

instance Monoid a => Monoid (Optional a) where
  mempty = Nada
  mappend (Only a) (Only b) = Only (mappend a b)
  mappend Nada (Only b)     = Only b
  mappend (Only a) Nada     = Only a

------------------------------------------------
newtype Combine a b = Combine
  { unCombine :: a -> b
  }

instance (Semigroup a, Semigroup b) => Semigroup (Combine a b) where
  (Combine f) <> (Combine g) = Combine (\a -> f a <> g a)
