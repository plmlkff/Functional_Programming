module Lib
    ( someFunc
    ) where

import Prob29
import Prob2


someFunc :: IO ()
someFunc = print (countDistinctPowersTailRecursive 100 100)
