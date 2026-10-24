module Ej6 where

import Ej5 (esPrimo1)

listaPrimosMenores :: Int -> [Int]
listaPrimosMenores n
  | n <= 2         = []
  | esPrimo1 (n-1) = (n-1) : listaPrimosMenores (n-1)
  | otherwise      = listaPrimosMenores (n-1)

-- =========================================================================
-- HERRAMIENTA DE TESTEO Y MAIN
-- =========================================================================

testear :: String -> Int -> [Int] -> IO ()
testear descripcion n esperado = do
  let obtenido = listaPrimosMenores n
  let estado   = if obtenido == esperado then "[OK]" else "[FALLO]"
  putStrLn $ "------------------------------------------------------------"
  putStrLn $ estado ++ " Evaluando: " ++ descripcion ++ " (n = " ++ show n ++ ")"
  putStrLn $ "  -> Deberia dar : " ++ show esperado
  putStrLn $ "  -> Resultado   : " ++ show obtenido

mainEj6 :: IO ()
mainEj6 = do
  putStrLn "=== TESTS PARA EJERCICIO 6: listaPrimosMenores ==="

  -- 1. Casos base y bordes inferiores (deben dar todos lista vacía)
  testear "Numero negativo (fuera de los naturales)" (-4) []
  testear "Caso borde cero"                          0    []
  testear "Caso borde uno"                           1    []
  testear "Caso limite (no hay primos menores a 2)"  2    []

  -- 2. Primer caso que devuelve elementos
  testear "Minimo con resultado (menor estricto a 3)" 3   [2]

  -- 3. Diferencia entre n primo y n compuesto
  testear "n = 7 (es primo, NO debe incluir al 7)"    7   [5, 3, 2]
  testear "n = 8 (compuesto, si incluye al 7)"        8   [7, 5, 3, 2]

  -- 4. Casos generales más grandes
  testear "Primos menores que 10"                     10  [7, 5, 3, 2]
  testear "Primos menores que 20"                     20  [19, 17, 13, 11, 7, 5, 3, 2]
  testear "Primos menores que 30"                     30  [29, 23, 19, 17, 13, 11, 7, 5, 3, 2]

  putStrLn "------------------------------------------------------------"