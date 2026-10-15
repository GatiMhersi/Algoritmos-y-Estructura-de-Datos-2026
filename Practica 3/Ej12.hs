module Ej12 where

potenciaExpEntero :: (Num a, Integral b) => a -> b -> a
potenciaExpEntero x y = x^y

potenciaExpFloat :: Floating b => b -> b -> b
potenciaExpFloat x y = x ** y