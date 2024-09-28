module Lib
    ( someFunc
    ) where

import Prob29
import Prob2


someFunc :: IO ()
someFunc = print (countEvenNumbers 1000000)
