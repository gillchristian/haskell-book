module Datatypes where

-- a) not
-- b) length
-- c) concat
-- d) head
-- e) (<)
--
-- a) d :: [a] -> a
-- b) c :: [[a]] -> [a] -- concat :: Foldable t => t [a] -> [a]
-- c) a :: Bool -> Bool
-- d) b :: [a] -> Int
-- e) e :: Ord a => a -> a -> Bool

--

-- data (->) a b

--

curry :: ((a, b) -> c) -> a -> b -> c
curry f a b = f (a, b)

uncurry :: (a -> b -> c) -> (a, b) -> c
uncurry f (a, b) = f a b

-- 
-- Exercises: Type Arguments

-- 1 -> a
-- 2 -> d
-- 3 -> d
-- 4 -> c
-- 5 -> a
-- 6 -> e
-- 7 -> e/a
-- 8 -> e
-- 9 -> c

-- Exercises: Parametricity

f :: a -> a
f a = a


g :: a -> a -> a 
g a b = a
-- g a b = b

h :: a -> b -> b
h a b = b
