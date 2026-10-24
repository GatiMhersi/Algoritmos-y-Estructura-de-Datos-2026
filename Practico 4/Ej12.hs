listaPrimerosNaturales :: Int -> [Int]
listaPrimerosNaturales n
  | n <= 0    = []
  | otherwise = listaPrimerosNaturales (n - 1) ++ [n]

listaPrimerosNaturalesDesde0 :: Int -> [Int]
listaPrimerosNaturalesDesde0 n
  | n <= 0    = []
  | otherwise = listaPrimerosNaturalesDesde0 (n - 1) ++ [n - 1]

testear12 :: String -> Int -> [Int] -> IO ()
testear12 desc n esperado = do
  let obtenido = listaPrimerosNaturales n
  let estado   = if obtenido == esperado then "[OK]" else "[FALLO]"
  putStrLn $ "------------------------------------------------------------"
  putStrLn $ estado ++ " " ++ desc ++ ": listaPrimerosNaturales (" ++ show n ++ ")"
  putStrLn $ "  -> Deberia dar : " ++ show esperado
  putStrLn $ "  -> Resultado   : " ++ show obtenido

mainEj12 :: IO ()
mainEj12 = do
  putStrLn "=== TESTS PARA EJERCICIO 12: listaPrimerosNaturales ==="
  testear12 "Caso negativo (-3)"    (-3) []
  testear12 "Cero elementos (0)"    0    []
  testear12 "Primer natural (1)"    1    [1]
  testear12 "Primeros 5 naturales"  5    [1, 2, 3, 4, 5]
  putStrLn "------------------------------------------------------------"