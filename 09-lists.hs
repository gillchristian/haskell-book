module Lists where

-- Exercise: EnumFromTo. Page 307
eftBool :: Bool -> Bool -> [Bool]
eftBool = eftEnum

eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd = eftEnum

eftInt :: Int -> Int -> [Int]
eftInt = eftEnum

eftChar :: Char -> Char -> String
eftChar = eftEnum

eftEnum :: (Ord a, Enum a) => a -> a -> [a]
eftEnum = go []
  where
    go xs f t
      | f > t = []
      | f == t = f : xs
      | otherwise = go (t : xs) f (pred t)

-- Exercises: Thy Fearful Symmetry. Page 311
-- 1) words using: takeWhile & dropWhile
words' :: String -> [String]
words' = split ' '

-- 2) lines
lines' :: String -> [String]
lines' = split '\n'

-- 3) generalize words & lines
split :: Char -> String -> [String]
split _ [] = []
split c xs = takeWhile (/= c) xs : split c (tail' $ dropWhile (/= c) xs)

tail' :: [a] -> [a]
tail' []     = []
tail' (_:xs) = xs

-- Zipping exercises
-- 1) implement zip
zip' :: [a] -> [b] -> [(a, b)]
zip' _ []          = []
zip' [] _          = []
zip' (a:as) (b:bs) = (a, b) : zip' as bs

-- 2) implement zipWith
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ _ []          = []
zipWith' _ [] _          = []
zipWith' f (a:as) (b:bs) = f a b : zipWith' f as bs

-- 3) implement zip using zipWith
zip'' :: [a] -> [b] -> [(a, b)]
zip'' = zipWith' (,)

-- Writing your own standard functions. Page 342
-- 1)
or' :: [Bool] -> Bool
or' []     = False
or' (x:xs) = x || or' xs

-- 2)
any' :: (a -> Bool) -> [a] -> Bool
any' _ []     = False
any' f (x:xs) = f x || any' f xs

-- 3)
elem' :: Eq a => a -> [a] -> Bool
elem' a = any' (== a)

-- 4)
reverse' :: [a] -> [a]
reverse' []     = []
reverse' (x:xs) = reverse' xs ++ [x]

-- 5) Page 343
squish :: [[a]] -> [a]
squish = foldr (++) []

-- 6)
squishMap :: (a -> [b]) -> [a] -> [b]
-- squishMap f as = squish $ map f as
squishMap f = foldr ((++) . f) []

-- 7) squish using squish map
squish' :: [[a]] -> [a]
squish' = squishMap id

-- 8)
maximumBy' :: (a -> a -> Ordering) -> [a] -> a
maximumBy' _ [] = error "empty list"
maximumBy' _ [a] = a
maximumBy' f (a:b:xs) =
  case f a b of
    GT -> maximumBy' f (a : xs)
    _  -> maximumBy' f (b : xs)

-- 10) Page 344
maximum' :: Ord a => [a] -> a
maximum' = maximumBy' compare'

minimum' :: Ord a => [a] -> a
minimum' = maximumBy' $ flip compare'

compare' :: Ord a => a -> a -> Ordering
compare' a b
  | a == b = EQ
  | a > b = GT
  | a < b = LT
