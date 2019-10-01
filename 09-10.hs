module Main where

list = [1, 2, 3, 4]

main :: IO ()
main = do
  print $ foldl l [] list
  print $ foldr r [] list
  where
    l = flip (:)
    r a b = b ++ [a]
