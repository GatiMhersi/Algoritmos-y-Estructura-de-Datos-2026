import Data.List (foldl')

{-
  EXPLICACIÓN DEL EJERCICIO 17 (Suma de cuadrados):
  El objetivo es tomar una lista de naturales, elevar cada elemento al cuadrado usando 'map'
  y luego sumar todos esos cuadrados utilizando un acumulador con funciones de reducción ('fold').

  DIFERENCIAS EN LOS FOLDS CON LA LISTA [2, 3, 1] y sus cuadrados [4, 9, 1]:

  1. foldr (+) 0 [4, 9, 1]
     - Asocia a la derecha: 4 + (9 + (1 + 0))
     - Pasos de evaluación:
       * (1 + 0) = 1
       * (9 + 1) = 10
       * (4 + 10) = 14
     - Perezoso: Permite trabajar con listas infinitas si el operador lo permite.
     - Riesgo: Acumula *thunks* en memoria si la lista es enorme, pudiendo causar Stack Overflow.

  2. foldl (+) 0 [4, 9, 1]
     - Asocia a la izquierda construyendo thunks: ((0 + 4) + 9) + 1
     - Pasos de evaluación (retarda la suma hasta el final):
       * ((0 + 4) + 9) + 1  ->  (4 + 9) + 1  ->  13 + 1  ->  14
     - No apto para listas infinitas (intenta recorrer toda la estructura antes de operar).
     - Riesgo: Alto peligro de Stack Overflow con listas grandes debido al crecimiento de la pila.

  3. foldl' (+) 0 [4, 9, 1]
     - Versión estricta de foldl (importada de Data.List).
     - Pasos de evaluación (fuerza el cálculo en cada paso intermedio):
       * Paso 1: acc = 0 + 4 = 4
       * Paso 2: acc = 4 + 9 = 13
       * Paso 3: acc = 13 + 1 = 14
     - No apto para listas infinitas (bucle infinito).
     - Ventaja: Memoria constante O(1), ideal y seguro para procesar listas masivas de números.
-}

-- 1. Versión con foldr
sumaCuadFoldr :: [Int] -> Int
sumaCuadFoldr xs = foldr (+) 0 (map (\x -> x ^ 2) xs)

-- 2. Versión con foldl
sumaCuadFoldl :: [Int] -> Int
sumaCuadFoldl xs = foldl (+) 0 (map (\x -> x ^ 2) xs)

-- 3. Versión con foldl' (Estricto)
sumaCuadFoldlStrict :: [Int] -> Int
sumaCuadFoldlStrict xs = foldl' (+) 0 (map (\x -> x ^ 2) xs)


-- MAIN PARA TESTEAR EL EJERCICIO 17
main17 :: IO ()
main17 = do
    let entrada = [2, 3, 1]
    let esperado = 14  -- (2^2 + 3^2 + 1^2 = 4 + 9 + 1 = 14)

    let entradaGrande = [1..100000]
    let esperadoGrande = 333338333350000  -- Suma de cuadrados de 1 a 100000

    putStrLn "=== TEST EJERCICIO 17: sumaCuad con los 3 tipos de fold ==="
    
    putStrLn "\n--- Test 1 (Lista corta [2, 3, 1]) ---"
    putStrLn $ "Entrada:              " ++ show entrada
    putStrLn $ "Resultado esperado:   " ++ show esperado
    putStrLn $ "Obtenido (foldr):     " ++ show (sumaCuadFoldr entrada)
    putStrLn $ "Obtenido (foldl):     " ++ show (sumaCuadFoldl entrada)
    putStrLn $ "Obtenido (foldl'):    " ++ show (sumaCuadFoldlStrict entrada)

    putStrLn "\n--- Test 2 (Lista grande [1..100000]) ---"
    putStrLn $ "Resultado esperado:   " ++ show esperadoGrande
    putStrLn $ "Obtenido (foldr):     " ++ show (sumaCuadFoldr entradaGrande)
    putStrLn $ "Obtenido (foldl):     " ++ show (sumaCuadFoldl entradaGrande)
    putStrLn $ "Obtenido (foldl'):    " ++ show (sumaCuadFoldlStrict entradaGrande)
    putStrLn   "  -> Nota: foldl y foldr con esta lista grande acumulan thunks y pueden provocar Stack Overflow."

