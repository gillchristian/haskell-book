module Print where

-- print2
main2 :: IO ()
main2 = do
  putStrLn "Count to four for me:"
  putStr "one, two"
  putStr ", three, and"
  putStrLn " four!"

-- print3
myGreeting :: String
myGreeting = "Hello" ++ " world!"

hello :: String
hello = "Hello"

world :: [Char] -- [Char] == String
world = "world!"

main3 :: IO ()
main3 = do
  putStrLn myGreeting
  putStrLn secondGreeting
  where
    secondGreeting = concat [hello, " ", world]

-- top-or-local.hs
topLevelFunction :: Integer -> Integer
topLevelFunction x = x + woot + topLevelValue
  where
    woot :: Integer
    woot = 10

topLevelValue :: Integer
topLevelValue = 5

-- print3flipped.hs
myGreeting2 :: String
myGreeting2 = (++) "Hello" " world!"

main3f :: IO ()
main3f = do
  putStrLn myGreeting2
  putStrLn secondGreeting
  where
    secondGreeting = (++) hello ((++) " " world)

-- print3broken.hs
greeting = "Yarrrrr"

printSecond :: IO ()
printSecond = do
  putStrLn greeting

main :: IO ()
main = do
  putStrLn greeting
  printSecond
  -- where greeting = "Yarrrrr"

-- Building functions
drop1 :: [a] -> [a]
drop1 = drop 1

-- "Curry is awesome" -> "Curry is awesome!"
exclamate :: String -> String
exclamate = (++ "!")

-- "Curry is awesome!" -> "y"
forth :: [a] -> [a]
forth x = (x !! 3) : [] -- take 1 (drop 4 x)

-- "Curry is awesome!" -> "awesome!"
drop9 :: [a] -> [a]
drop9 = drop 9

-- "Curry is awesome!" -> 'r'
thirdLetter :: String -> Char
thirdLetter = (!! 2)

-- "Curry is awesome!" 4 -> 'y'
charAt :: Int -> String -> Char
charAt i = (!! (i - 1)) -- x i = x !! (i - 1)

-- "Curry is awesome" -> "awesome is Curry"
rvrs :: String -> String
rvrs x = c ++ " " ++ b ++ " " ++ a
  where
    a = take 5 x
    b = take 2 $ drop 6 x -- same as: b = take 2 (drop 6 x)
    c = take 7 $ drop 9 x -- same as: c = take 7 (drop 9 x)
