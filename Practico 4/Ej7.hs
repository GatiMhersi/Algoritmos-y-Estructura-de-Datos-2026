module Ej7 where

import Ej5 (esPrimo1)

filtrarPrimos :: [Int] -> [Int]
filtrarPrimos [] = []                         -- Caso base (pattern matching)
filtrarPrimos (x:xs)                          -- Caso recursivo
  | esPrimo1 x = x : filtrarPrimos xs
  | otherwise  = filtrarPrimos xs

testear7 :: String -> [Int] -> [Int] -> IO ()
testear7 descripcion entrada esperado = do
  let obtenido = filtrarPrimos entrada
  let estado   = if obtenido == esperado then "[OK]" else "[FALLO]"
  putStrLn $ "------------------------------------------------------------"
  putStrLn $ estado ++ " Evaluando: " ++ descripcion
  putStrLn $ "  -> Entrada     : " ++ show entrada
  putStrLn $ "  -> Deberia dar : " ++ show esperado
  putStrLn $ "  -> Resultado   : " ++ show obtenido

mainEj7 :: IO ()
mainEj7 = do
  putStrLn "=== TESTS PARA EJERCICIO 7: filtrarPrimos ==="

  testear7 "Lista vacia (caso base)"        []                      []
  testear7 "Sin ningun primo"               [-5, 0, 1, 4, 6, 8, 9]  []
  testear7 "Todos primos"                   [2, 3, 5, 7, 11, 13]    [2, 3, 5, 7, 11, 13]
  testear7 "Mezclados con negativos y 0/1"  [-3, 0, 1, 2, 4, 5, 9]  [2, 5]
  testear7 "Con primos repetidos y desorden" [10, 7, 2, 8, 7, 3, 1] [7, 2, 7, 3]

  putStrLn "------------------------------------------------------------"