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

shift :: Offset -> Char -> Char
shift o c
  | m > z = chr $ (m `mod` z) + a - 1
  | otherwise = chr m
  where
    m = ord c + o

unshift :: Offset -> Char -> Char
unshift o c
  | m < a = chr $ z - (a `mod` m) + 1
  | otherwise = chr m
  where
    m = ord c - o
