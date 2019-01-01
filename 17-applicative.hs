module Chapter17 where
-- fmap length $ (++) <$> getLine <*> getLine

import Data.Monoid

import Control.Applicative (liftA3)

-- IDENTITY

newtype Identity a = Identity a
  deriving (Eq, Ord, Show)

instance Functor Identity where
  fmap f (Identity a) = Identity $ f a 

instance Applicative Identity where
  pure a = Identity a
  Identity f <*> Identity a = Identity $ f a

-- CONSTANT

newtype Constant a b =
  Constant { getConstant :: a }
  deriving (Eq, Ord, Show)

instance Functor (Constant a) where
  fmap f (Constant a) = Constant a

instance Monoid a => Applicative (Constant a) where
  pure a = Constant mempty 
  (Constant a) <*> (Constant a') = Constant (a <> a')


xs = [1, 2, 3]

ys = [4, 5, 6]

x :: Maybe Integer
x = lookup 3 $ zip xs ys

y :: Maybe Integer
y = lookup 2 $ zip xs ys

summed :: Maybe Integer
summed = sum <$> ((,) x) <$> y

---

stops :: String
stops = "pbtdkg"

vowels :: String
vowels = "aeiou"

combos :: [a] -> [b] -> [c] -> [(a, b, c)]
combos = liftA3 (,,)


-- module Chapter17 where
-- -- fmap length $ (++) <$> getLine <*> getLine

-- -- IDENTITY

-- newtype Identity a = Identity a
--   deriving (Eq, Ord, Show)

-- instance Functor Identity where
--   fmap f (Identity a) = Identity $ f a 

-- instance Applicative Identity where
--   pure a = Identity a
--   Identity f <*> Identity a = Identity $ f a

-- -- CONSTANT

-- -- newtype Constant a b =
-- --   Constant { getConstant :: a }
-- --   deriving (Eq, Ord, Show)

-- -- instance Functor (Constant a) where
-- --   fmap f c = c

-- -- instance Monoid a => Applicative (Constant a) where
-- --   pure a = Constant memptpy a 
-- --   _ <*> c' = c'


-- xs = [1, 2, 3]

-- ys = [4, 5, 6]

-- x :: Maybe Integer
-- x = lookup 3 $ zip xs ys

-- y :: Maybe Integer
-- y = lookup 2 $ zip xs ys

-- summed :: Maybe Integer
-- summed = sum <$> ((,) x) <$> y
