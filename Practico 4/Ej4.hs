import Ej2 (reversa)
import Ej3 (iguales)

esPalindromo ::(Eq a) => [a] -> Bool
esPalindromo xs = iguales (xs) (reversa(xs))

mainEj4 :: IO ()
mainEj4 = do
  putStrLn "--- Pruebas para el Ejercicio 4 (Palíndromos) ---"
  
  -- Caso 1: Lista vacía (debe ser palíndromo)
  putStr "Lista vacía ([]): "
  print (esPalindromo ([] :: [Int]))
  
  -- Caso 2: Un solo elemento (debe ser palíndromo)
  putStr "Un solo elemento ([5]): "
  print (esPalindromo [5])
  
  -- Caso 3: Palabra palíndroma par ("neuquen" o similar, probemos con "neuquen")
  putStr "Palabra palíndroma (\"neuquen\"): "
  print (esPalindromo "neuquen")
  
  -- Caso 4: Palabra palíndroma impar ("reconocerk" no, probemos "reconocer")
  putStr "Palabra palíndroma (\"reconocer\"): "
  print (esPalindromo "reconocer")
  
  -- Caso 5: Palabra que no es palíndroma
  putStr "Palabra no palíndroma (\"haskell\"): "
  print (esPalindromo "haskell")
  
  -- Caso 6: Lista de enteros palíndroma
  putStr "Lista de enteros palíndroma ([1, 2, 3, 2, 1]): "
  print (esPalindromo [1, 2, 3, 2, 1])
  
  -- Caso 7: Lista de enteros no palíndroma
  putStr "Lista de enteros no palíndroma ([1, 2, 3, 4, 5]): "
  print (esPalindromo [1, 2, 3, 4, 5])
