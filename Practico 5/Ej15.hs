module Ej15 where

existeSum :: (Num a, Eq a) => [a] -> Bool
existeSum xs = or [xs!!i == sum [xs!!j | j <- [0.. length xs -1], j/=i] | i <- [0.. length xs - 1]]