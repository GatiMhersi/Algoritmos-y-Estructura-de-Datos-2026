import Data.List (foldl')

{-
  EXPLICACIÓN TEÓRICA Y FUNCIONAMIENTO DE LOS FOLDS (EJERCICIO 20):
  El factorial de un número natural 'n' (representado como n!) se define como el producto 
  de todos los números enteros positivos desde 1 hasta n. Para resolverlo utilizando funciones 
  de alto orden, generamos la lista `[1..n]` y la reducimos empleando un acumulador.

  DIFERENCIAS Y FUNCIONAMIENTO DE CADA TIPO DE FOLD:
  
  1. foldr (Fold a la Derecha):
     - Funcionamiento: Asocia los paréntesis hacia la derecha (`f x (f y z)`). Comienza a procesar 
       los elementos desde el final de la lista hacia el principio.
     - Perezoso (*Lazy*): Retarda la evaluación de las operaciones construyendo una estructura gigante 
       de llamadas pendientes (*thunks*) en la pila de memoria antes de devolver un resultado.
     - Comportamiento con el factorial: Funciona correctamente con números pequeños, pero con valores 
       grandes puede saturar la pila de ejecución.

  2. foldl (Fold a la Izquierda Perezoso):
     - Funcionamiento: Asocia los paréntesis hacia la izquierda (`f (f z x) y`). Agrupa los elementos 
       comenzando desde el valor inicial y el primer elemento de la lista.
     - Comportamiento: Al igual que `foldr`, es perezoso y acumula expresiones pendientes sin resolver 
       en cada paso, lo que lo hace ineficiente y propenso a desbordamientos de pila (*Stack Overflow*).

  3. foldl' (Fold a la Izquierda Estricto):
     - Funcionamiento: Versión estricta de `foldl` provista por el módulo `Data.List`. 
     - Comportamiento: Fuerza la evaluación aritmética del acumulador en cada paso intermedio. 
       Garantiza un consumo de memoria constante O(1), siendo la opción óptima y recomendada 
       para cálculos numéricos intensivos como el factorial.

  INTRODUCCIÓN A FOLDR' (Fold a la Derecha Estricto):
  - ¿Qué es?: Es la contraparte estricta de `foldr`, provista también por el módulo `Data.List`.
  - Funcionamiento: Mientras que el `foldr` tradicional acumula *thunks* perezosos a lo largo de toda 
    la estructura antes de empezar a operar, `foldr'` fuerza la evaluación del acumulador y de los 
    pasos intermedios de derecha a izquierda a medida que avanza.
  - ¿Para qué sirve?: Evita el colapso de memoria (*Stack Overflow*) en listas grandes o infinitas donde 
    aún se requiere la asociatividad hacia la derecha propia de `foldr`. Sin embargo, al igual que los 
    demás folds estrictos, exige evaluar la estructura completa si se aplica sobre rangos cerrados como `[1..n]`.
-}

-- 1. Versión con foldr (Perezoso, asocia a la derecha)
factorialFoldr :: Int -> Int
factorialFoldr n = foldr (*) 1 [1..n]

-- 2. Versión con foldl (Perezoso, asocia a la izquierda)
factorialFoldl :: Int -> Int
factorialFoldl n = foldl (*) 1 [1..n]

-- 3. Versión con foldl' (Estricto, el recomendado para operaciones numéricas)
factorialFoldlStrict :: Int -> Int
factorialFoldlStrict n = foldl' (*) 1 [1..n]


-- MAIN PARA TESTEAR EL EJERCICIO 20
main20 :: IO ()
main20 = do
    let n1 = 5
    let esperado1 = 120  -- (1 * 2 * 3 * 4 * 5 = 120)

    let n2 = 0
    let esperado2 = 1    -- Por definición, 0! = 1

    let n3 = 6
    let esperado3 = 720  -- (1 * 2 * 3 * 4 * 5 * 6 = 720)

    putStrLn "=== TEST EJERCICIO 20: Factorial usando fold ==="
    
    putStrLn "\n--- Test 1 (Factorial de 5) ---"
    putStrLn $ "Entrada (n):          " ++ show n1
    putStrLn $ "Resultado esperado:   " ++ show esperado1
    putStrLn $ "Obtenido (foldr):     " ++ show (factorialFoldr n1)
    putStrLn $ "Obtenido (foldl):     " ++ show (factorialFoldl n1)
    putStrLn $ "Obtenido (foldl'):    " ++ show (factorialFoldlStrict n1)

    putStrLn "\n--- Test 2 (Caso límite: Factorial de 0) ---"
    putStrLn $ "Entrada (n):          " ++ show n2
    putStrLn $ "Resultado esperado:   " ++ show esperado2
    putStrLn $ "Obtenido (foldl'):    " ++ show (factorialFoldlStrict n2)

    putStrLn "\n--- Test 3 (Factorial de 6) ---"
    putStrLn $ "Entrada (n):          " ++ show n3
    putStrLn $ "Resultado esperado:   " ++ show esperado3
    putStrLn $ "Obtenido (foldl'):    " ++ show (factorialFoldlStrict n3)
