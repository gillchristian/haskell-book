module Datatypes where

data Mood = Blah | Woot deriving Show

changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood    _ = Blah -- matches the rest, equivalent: changeMood Woot = Blah

greetIfCool :: String -> IO ()
greetIfCool coolness =
  if cool
    then putStrLn "eyyyyy. What's shakin'?"
  else
    putStrLn "pshhhh."
  where cool =
          coolness == "downright frosty yo"

greetIfCooler :: String -> IO ()
greetIfCooler coolness =
  if cool coolness
    then putStrLn "eyyyyy. What's shakin'?"
  else
    putStrLn "pshhhh."
  where cool v =
          v == "downright frosty yo"

-- TUPLES

first :: (a, b) -> a
first (a, _) = a

scond :: (a, b) -> b
scond (_, b) = b

swap :: (a, b) -> (b, a) -- Data.Tuple -> swap
swap (a, b) = (b, a)

tupFunc :: (Int, [a]) -> (Int, [a]) -> (Int, [a])
tupFunc (a, b) (c, d) =
  ((a + c), (b ++ d))

-- EXCERCISES

awesome = ["Papuchon", "curry", ":)"]
also = ["Quake", "The Simons"]
allAwesome = [awesome, also]

-- 1

l :: [a] -> Int -- Foldable t => t a -> Int
l = length

-- 2
-- length [1, 2, 3, 4, 5]          -- 5
-- length [(1, 2), (2, 3), (3, 4)] -- 3
-- length allAwesome               -- 2
-- length (concat allAwesome)      -- 5

-- 3
-- 6 / 3
-- 6 / length [1, 2, 3] -- errors, length returns Int

-- 4
-- use `quot` or `div`

-- 5
-- 2 + 3 == 5 -- True

-- 6
-- let x = 5
-- x + 3 == 5 -- False

-- 7
--
-- length allAwesome == 2             -- True
-- length [1, 'a', 3, 'b']            -- throws, different types in the list
-- length allAwesome + length awesome -- 5
-- (8 == 8) && ('b' < 'a')            -- False
-- (8 == 8) && 9                      -- throws, (&&) :: Bool -> Bool -> Bool

-- 8
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome xs = xs == reverse xs 

-- 9
myAbs :: Integer -> Integer
myAbs x = if x >= 0
          then x
          else x * (-1)

-- 10
f :: (a, b) -> (c, d) -> ((b, d), (a, c))
-- f (a, b) (c, d) = ((b, d), (a, c))
f a b = ((snd a, snd b), (fst a, fst b))

-- CORRECTING SYNTAX

-- 1
x = (+)

f2 xs = w `x` 1
  where w = length xs

-- 2
-- \x -> x

-- 3
f3 (a,b) = a


-- MATCH THE FUNCTION NAMES TO THEIR TYPES
-- 1 -> c
-- 2 -> b
-- 3 -> a
-- 4 -> d
