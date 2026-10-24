cortar :: Int -> Int -> [Char] -> [Char]
cortar i j s = take (j - i + 1) (drop (i - 1) s)

testear8 :: String -> Int -> Int -> String -> String -> IO ()
testear8 desc i j texto esperado = do
  let obtenido = cortar i j texto
  let estado   = if obtenido == esperado then "[OK]" else "[FALLO]"
  putStrLn $ "------------------------------------------------------------"
  putStrLn $ estado ++ " " ++ desc ++ ": cortar " ++ show i ++ " " ++ show j ++ " " ++ show texto
  putStrLn $ "  -> Deberia dar : " ++ show esperado
  putStrLn $ "  -> Resultado   : " ++ show obtenido

mainEj8 :: IO ()
mainEj8 = do
  putStrLn "=== TESTS PARA EJERCICIO 8: cortar ==="
  testear8 "Ejemplo 1 de la guia" 4 9  "hipopotamos" "opotam"
  testear8 "Ejemplo 2 de la guia" 6 10 "hola mundo!" "mundo"
  testear8 "Un solo caracter"     1 1  "haskell"     "h"
  testear8 "Indices invertidos"   9 4  "hipopotamos" ""
  putStrLn "------------------------------------------------------------"