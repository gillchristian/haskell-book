module Cipher where

import           Data.Char

type Offset = Int

caesar :: Offset -> String -> String
caesar = map . whenLeter . shift

unCaesar :: Offset -> String -> String
unCaesar = map . whenLeter . unshift

whenLeter :: (Char -> Char) -> Char -> Char
whenLeter f c
  | isLetter c = f c
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
