import Ej5 (esPrimo)

{-
  EXPLICACIÓN DE LA FUNCIÓN DE ALTO ORDEN 'filter' EN ESTE CONTEXTO:
  'filter' recorre la lista 'xs' evaluando la función 'esPrimo' sobre cada elemento.
  Si el resultado es 'True', el elemento se mantiene en la lista resultante; si es 'False', se descarta.

  EXPLICACIÓN DE ESTILO POINT-FREE Y APLICACIÓN PARCIAL:
  Como 'filter' espera un predicado `(a -> Bool)` y una lista `[a]`, y 'esPrimo' tiene tipo `Int -> Bool`,
  puedes aplicar parcialmente la función 'filter' pasando únicamente 'esPrimo'. 
  Esto se conoce como estilo *point-free* (sin nombrar explícitamente el argumento 'xs'):
      filtrarPrimos = filter esPrimo
-}

-- Versión explícita recibiendo el argumento 'xs'
filtrarPrimosExplicit :: [Int] -> [Int]
filtrarPrimosExplicit xs = filter esPrimo xs

-- Versión elegante en estilo *point-free*
filtrarPrimos :: [Int] -> [Int]
filtrarPrimos = filter esPrimo


-- MAIN PARA TESTEAR EL EJERCICIO 16
main16 :: IO ()
main16 = do
    let entrada1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    let esperado1 = [2, 3, 5, 7, 11]

    let entrada2 = [4, 6, 8, 9, 12]
    let esperado2 = [] :: [Int]

    putStrLn "=== TEST EJERCICIO 16: filtrarPrimos ==="
    
    putStrLn "\n--- Test 1 (Mixtos entre primos y compuestos) ---"
    putStrLn $ "Entrada:            " ++ show entrada1
    putStrLn $ "Resultado esperado: " ++ show esperado1
    putStrLn $ "Obtenido:           " ++ show (filtrarPrimos entrada1)

    putStrLn "\n--- Test 2 (Solo compuestos) ---"
    putStrLn $ "Entrada:            " ++ show entrada2
    putStrLn $ "Resultado esperado: " ++ show esperado2
    putStrLn $ "Obtenido:           " ++ show (filtrarPrimos entrada2)

