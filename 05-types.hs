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

-------------------------------------------------
-- CHAPTER EXERCISES ----------------------------
-------------------------------------------------

-- Determine the type ---------------------------

-- 1

-- a : Num a => a
-- b : Num a => (a, [Char])
-- c : (Integer, [Char])
-- d : Bool
-- e : Int
-- f : Bool

-- 2 : Num a => a

-- 3 : z :: Num a => a -> a

-- 4 : Fractional a => a

-- 5 : [Char]

-- Does it compile? -----------------------------

-- 1 : No

-- bigNum = (^) 5 $ 10
-- wahoo = bigNum $ 10

-- bigNum = (^) 5
-- wahoo = bigNum $ 10

-- 2 : No

-- x = print
-- y = print "woohoo!"
-- z = x "hello world"

-- x = print
-- print "woohoo!"
-- x "hello world"

-- 3 : No

-- a = (+)
-- b = 5
-- c = b 10
-- d = c 200

-- a = (+)
-- b = 5
-- c = a b 10
-- d = a c 200

-- 4 :

-- a = 12 + b
-- b = 10000 * c

-- a = 12 + b
-- b = 10000 * c
-- c = 1

-- Type variable or specific type constructor? --

-- 2

-- f :: zed -> Zed -> Blah
--       1      2      3
-- 1 fully
-- 2 concrete
-- 3 concrete

-- 3

-- f :: Enum b => a -> b -> C
--                1   2     3
-- 1 fully
-- 2 constreined
-- 3 concrete

-- 3

-- f :: f -> g -> C
--      1    2    3
-- 1 fully
-- 2 fully
-- 3 concrete

-- Given a type, write the function -------------

myFunc :: (x -> y)
  -> (y -> z)
  -> c
  -> (a, x)
  -> (a, z)
myFunc xToY yToZ _ (a, x) = (a, yToZ $ xToY x)

-- 1

i :: a -> a
i = id

-- 2

c :: a -> b -> a
c a b = a 

-- 3

c'' :: b -> a -> b
c'' = c

-- 4

c' :: a -> b -> b
c' a = id

-- 5

r :: [a] -> [a]
r = reverse

-- 6

co :: (b -> c) -> (a -> b) -> a -> c
co bToC aToB a = bToC $ aToB a

-- 7

a :: (a -> c) -> a -> a
a _ a = a

-- 8

a' :: (a -> b) -> a -> b
a' aToB = aToB

-- Type-Kwon-Do ---------------------------------

-- 3

data X
data Y
data Z

xz :: X -> Z
xz = undefined

yz :: Y -> Z
yz = undefined

xform :: (X, Y) -> (Z, Z)
xform (x, y) = (xz x, yz y) 
