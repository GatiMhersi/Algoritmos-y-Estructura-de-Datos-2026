import Data.List (foldl')

{-
  EXPLICACIÓN TEÓRICA DEL EJERCICIO 19 (Sumar elementos):
  El objetivo es sumar todos los elementos de una lista de enteros utilizando funciones de alto orden de reducción (*fold*).

  FUNCIONAMIENTO DETALLADO DE CADA FOLD:
  
  1. foldr (Fold a la Derecha):
     - Funcionamiento: Asocia los paréntesis hacia la derecha: `f x (f y z)`. Comienza a procesar 
       desde el último elemento de la lista hacia el primero combinándolo con el valor inicial.
     - Perezoso (*Lazy*): No evalúa inmediatamente las operaciones, sino que construye una estructura 
       de llamadas pendientes (*thunks*) en memoria. 
     - Riesgo: Si la lista es muy grande, acumula millones de *thunks* en la pila de ejecución, lo que 
       puede provocar un desbordamiento de memoria (*Stack Overflow*).

  2. foldl (Fold a la Izquierda Perezoso):
     - Funcionamiento: Asocia los paréntesis hacia la izquierda: `f (f z x) y`. Acumula las operaciones 
       empezando por el valor inicial y el primer elemento.
     - Comportamiento: Al igual que `foldr`, es perezoso y retarda el cálculo real construyendo una cadena 
       anidada de *thunks*, por lo que consume enormes cantidades de memoria con listas grandes.

  3. foldl' (Fold a la Izquierda Estricto):
     - Funcionamiento: Versión estricta de `foldl` (provista por el módulo `Data.List`). Fuerza la 
       evaluación aritmética del acumulador en cada paso intermedio.
     - Ventaja: Mantiene un consumo de memoria constante O(1), evitando por completo el desbordamiento de 
       pila y haciendo que el procesamiento de listas masivas sea completamente seguro y eficiente.

  ESTILO POINT-FREE:
  Al definir funciones como `sumarElemFoldl = foldl (+) 0`, se omite explícitamente el argumento 'xs' 
  en ambos lados de la igualdad, aprovechando la currificación de Haskell.
-}

-- 1. Versión con foldr (Perezoso, asocia a la derecha)
sumarElemFoldr :: [Int] -> Int
sumarElemFoldr = foldr (+) 0

-- 2. Versión con foldl (Perezoso, asocia a la izquierda - Peligrosa con listas grandes)
sumarElemFoldl :: [Int] -> Int
sumarElemFoldl = foldl (+) 0

-- 3. Versión con foldl' (Estricto, seguro y eficiente en memoria O(1))
sumarElemFoldlStrict :: [Int] -> Int
sumarElemFoldlStrict = foldl' (+) 0


-- MAIN PARA TESTEAR EL EJERCICIO 19
main19 :: IO ()
main19 = do
    let entrada1 = [5, 10, 15, 20]
    let esperado1 = 50

    -- Caso límite 1: Lista vacía
    let entradaVacia = [] :: [Int]
    let esperadoVacia = 0

    -- Caso límite 2: Lista con negativos
    let entradaNegativos = [-3, 8, -2, 5]
    let esperadoNegativos = 8

    -- Lista grande para verificar seguridad con foldl'
    let entradaGrande = [1..100000]
    let esperadoGrande = 5000050000  -- Suma de 1 a 100000

    putStrLn "=== TEST EJERCICIO 19: sumarElem con foldr, foldl y foldl' ==="
    
    putStrLn "\n--- Test 1 ([5, 10, 15, 20]) ---"
    putStrLn $ "Entrada:              " ++ show entrada1
    putStrLn $ "Resultado esperado:   " ++ show esperado1
    putStrLn $ "Obtenido (foldr):     " ++ show (sumarElemFoldr entrada1)
    putStrLn $ "Obtenido (foldl):     " ++ show (sumarElemFoldl entrada1)
    putStrLn $ "Obtenido (foldl'):    " ++ show (sumarElemFoldlStrict entrada1)

    putStrLn "\n--- Test 2 (Caso límite: Lista vacía) ---"
    putStrLn $ "Entrada:              " ++ show entradaVacia
    putStrLn $ "Resultado esperado:   " ++ show esperadoVacia
    putStrLn $ "Obtenido (foldl'):    " ++ show (sumarElemFoldlStrict entradaVacia)

    putStrLn "\n--- Test 3 (Caso límite: Negativos) ---"
    putStrLn $ "Entrada:              " ++ show entradaNegativos
    putStrLn $ "Resultado esperado:   " ++ show esperadoNegativos
    putStrLn $ "Obtenido (foldl'):    " ++ show (sumarElemFoldlStrict entradaNegativos)

    putStrLn "\n--- Test 4 (Lista grande [1..100000] - Versión Segura) ---"
    putStrLn $ "Resultado esperado:   " ++ show esperadoGrande
    putStrLn $ "Obtenido (foldl'):    " ++ show (sumarElemFoldlStrict entradaGrande)
