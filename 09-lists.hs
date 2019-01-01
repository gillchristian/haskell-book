module Lists where

-- Exercise: EnumFromTo page 307 (339)
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

-- Exercises: Thy Fearful Symmetry page 311 (343)
-- 1) takeWhile & dropWhile
words' :: String -> [String]
words' = go []
  where
    go acc [] = reverse acc
    go acc xs =
      go (takeWhile (/= ' ') xs : acc) . tail' . dropWhile (/= ' ') $ xs

tail' :: [a] -> [a]
tail' []     = []
tail' (_:xs) = xs
