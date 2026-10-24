digitos :: Int -> [Int]
digitos n
  | n < 0     = digitos (-n)                      -- Si es negativo, lo pasamos a positivo
  | n < 10    = [n]                               -- Caso base: un solo dígito (incluye al 0)
  | otherwise = digitos (div n 10) ++ [mod n 10]  -- Caso recursivo


testear9 :: String -> Int -> [Int] -> IO ()
testear9 desc n esperado = do
  let obtenido = digitos n
  let estado   = if obtenido == esperado then "[OK]" else "[FALLO]"
  putStrLn $ "------------------------------------------------------------"
  putStrLn $ estado ++ " " ++ desc ++ ": digitos (" ++ show n ++ ")"
  putStrLn $ "  -> Deberia dar : " ++ show esperado
  putStrLn $ "  -> Resultado   : " ++ show obtenido

mainEj9 :: IO ()
mainEj9 = do
  putStrLn "=== TESTS PARA EJERCICIO 9: digitos ==="
  testear9 "Ejemplo 1 (positivo largo)" 12645   [1, 2, 6, 4, 5]
  testear9 "Ejemplo 2 (negativo largo)" (-1234) [1, 2, 3, 4]
  testear9 "Ejemplo 3 (caso borde 0)"   0       [0]
  testear9 "Ejemplo 4 (ceros izq 004)"  004     [4]
  testear9 "Ejemplo 5 (negativo 1 dig)" (-5)    [5]
  putStrLn "------------------------------------------------------------"