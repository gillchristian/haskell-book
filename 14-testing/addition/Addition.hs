module Addition where

import           Test.Hspec
import           Test.QuickCheck

sayHello :: IO ()
sayHello = putStrLn "Hello!"

main :: IO ()
main =
  hspec $ do
    describe "Addition" $ do
      it "1 + 1 is greater than 1" $ do (1 + 1) > 1 `shouldBe` True
      it "2 + 2 is equal to 2" $ do 2 + 2 `shouldBe` 4
      it "x + 1 is always greater than x" $ do property $ \x -> x + 1 > (x :: Int)
    describe "dividedBy" $ do
      it "15 devided by 3 is 5" $ dividedBy 15 3 `shouldBe` (5, 0)
      it "22 devided by 5 is 4 reminder 2" $ dividedBy 22 5 `shouldBe` (4, 2)

------------------------

prop_additionGreater :: Int -> Bool
prop_additionGreater x = x + 1 > x

prop_additionGreater_fail :: Int -> Bool
prop_additionGreater_fail x = x + 0 > x

runQc :: IO ()
runQc = do
  quickCheck prop_additionGreater
  quickCheck prop_additionGreater_fail

------------------------

-- λ> sample (genEither :: Gen (Either Int Double))
-- λ> sample (genEither :: Gen (Either Int String))
genEither :: (Arbitrary a, Arbitrary b)
          => Gen (Either a b)
genEither = do
  a <- arbitrary
  b <- arbitrary
  elements [Left a, Right b]

------------------------

dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
  where
    go n d count
      | n < d = (count, n)
      | otherwise = go (n - d) d (count + 1)
