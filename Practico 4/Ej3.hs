module Ej3(iguales) where

iguales :: (Eq a) => [a] -> [a] -> Bool
iguales [] [] = True
iguales _ [] = False
iguales [] _ = False
iguales (x:xs) (y:ys) = x == y && iguales (xs) (ys)

mainEj3 :: IO ()
mainEj3 = do
  putStrLn "--- Pruebas para el Ejercicio 3 (Listas iguales) ---"
  
  -- Caso 1: Listas vacías
  putStr "Listas vacías ([] y []): "
  print (iguales [] ([] :: [Int]))
  
  -- Caso 2: Listas idénticas de enteros
  putStr "Listas idénticas ([1, 2, 3] y [1, 2, 3]): "
  print (iguales [1, 2, 3] [1, 2, 3])
  
  -- Caso 3: Listas con elementos diferentes pero misma longitud
  putStr "Listas con elementos diferentes ([1, 2, 3] y [1, 2, 4]): "
  print (iguales [1, 2, 3] [1, 2, 4])
  
  -- Caso 4: Listas de distinta longitud
  putStr "Listas de distinta longitud ([1, 2, 3] y [1, 2]): "
  print (iguales [1, 2, 3] [1, 2])
  
  -- Caso 5: Listas de caracteres (strings) iguales
  putStr "Strings iguales (\"hola\" y \"hola\"): "
  print (iguales "hola" "hola")
  
  -- Caso 6: Listas de caracteres distintas
  putStr "Strings distintos (\"hola\" y \"mundo\"): "
  print (iguales "hola" "mundo")
 
 