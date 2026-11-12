module Ej16 where

import Ej13 (split3)

maxCeros :: [Int] -> Int
maxCeros xs = maximum [length bs | (as, bs, cs) <- split3 xs, and [bs!!i | i] ] 
