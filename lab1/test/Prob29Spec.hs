module Prob29Spec
(
    prob29Spec
) where

import Test.Hspec
import Prob29

correctResult :: Int
correctResult = 6413

testLimitA :: Int
testLimitA = 100

testLimitB :: Int
testLimitB = 100

prob29Spec :: Spec
prob29Spec = do
  describe "Problem 29 tests" $ do
    it "Comprehension list implementation with basic syntax" $ do
       countDistinctPowers testLimitA testLimitB `shouldBe` correctResult
    it "Tail recursive implementation with foldl and mapping" $ do
       countDistinctPowersTailRecursive testLimitA testLimitB `shouldBe` correctResult