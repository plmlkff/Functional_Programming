module Prob2Spec
(
  prob2Spec
) where

import Test.Hspec
import Prob2

correctResult :: Int
correctResult = 10

testValue :: Int
testValue = 1000000

prob2Spec :: Spec
prob2Spec = do
  describe "Problem 2 tests" $ do
    it "Recursive implementation with basic syntax" $ do
       countEvenNumbers testValue `shouldBe` correctResult
    it "Tail recursive implementation with filtering, mapping and infinit lists" $ do
       countEvenNumbersTail testValue `shouldBe` correctResult
