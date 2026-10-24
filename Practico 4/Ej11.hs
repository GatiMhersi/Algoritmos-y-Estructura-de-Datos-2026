module Ej11 where

listaNaturales :: Int -> [Int]
listaNaturales n
  | n < 0     = 0 : listaNaturales 1     -- (o directamente: listaNaturales 0)
  | otherwise = n : listaNaturales (n + 1)

testear11 :: String -> Int -> [Int] -> IO ()
testear11 desc n esperado = do
  let obtenido = take 10 (listaNaturales n)
  let estado   = if obtenido == esperado then "[OK]" else "[FALLO]"
  putStrLn $ "------------------------------------------------------------"
  putStrLn $ estado ++ " " ++ desc ++ ": take 10 (listaNaturales (" ++ show n ++ "))"
  putStrLn $ "  -> Deberia dar : " ++ show esperado
  putStrLn $ "  -> Resultado   : " ++ show obtenido

mainEj11 :: IO ()
mainEj11 = do
  putStrLn "=== TESTS PARA EJERCICIO 11: listaNaturales ==="
  testear11 "Desde un natural positivo (5)" 5    [5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  testear11 "Desde el cero (0)"             0    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  testear11 "Desde un negativo (-4)"        (-4) [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  putStrLn "------------------------------------------------------------"