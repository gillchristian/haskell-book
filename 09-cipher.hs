module Cipher where

import           Data.Char

type Offset = Int

caesar :: Offset -> String -> String
caesar = map . whenLeter . shift

uncaesar :: Offset -> String -> String
uncaesar = map . whenLeter . unshift

whenLeter :: (Char -> Char) -> Char -> Char
whenLeter f c
  | isLower c = f c
  | isUpper c = toUpper $ f $ toLower c
  | otherwise = c

a = ord 'a'

z = ord 'z'

range = z - a + 1

shift :: Offset -> Char -> Char
shift o c
  | m > z = chr $ (m `mod` z) + a
  | otherwise = chr m
  where
    m = ord c + o `mod` range

unshift :: Offset -> Char -> Char
unshift o c
  | m < a = chr $ z - (a `mod` m)
  | otherwise = chr m
  where
    m = ord c - o `mod` range

-- tests
tests :: IO ()
tests = do
  print $ caesar 1 "a" == "b"
  print $ caesar 25 "a" == "z"
