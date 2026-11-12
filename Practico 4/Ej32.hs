-- ============================================================================
-- EJERCICIO 32: Cantidad de ocurrencias de un elemento en una lista
-- ============================================================================

{- 
1. ¿POR QUÉ USAMOS 'Eq a =>'?
   En Haskell, un tipo polimórfico 'a' puede ser cualquier cosa (un Int, un Char, 
   una lista, o incluso una función). Sin embargo, NO todos los tipos se pueden 
   comparar por igualdad (por ejemplo, dos funciones no se pueden comparar con ==).
   
   La restricción de clase 'Eq a =>' le indica al compilador que el tipo 'a' 
   DEBE pertenecer a la clase de tipos 'Eq' (tipos comparables por igualdad == y /=).
   Como dentro de nuestras funciones hacemos la comparación (xs !! i == a) o (y == a),
   necesitamos garantizar que 'a' soporte el operador (==).

2. ESTRUCTURA Y FUNCIONAMIENTO DE LISTAS POR COMPRENSIÓN:
   Sintaxis general: [ expresión | generador1, generador2, ..., guarda1, guarda2, ... ]
   
   - Generador (ej. y <- xs): Extrae elementos uno por uno de una lista existente.
   - Guarda / Filtro (ej. y == a): Es una condición booleana. Si se evalúa como 
     True, el elemento actual pasa a la etapa final; si es False, se descarta.
   - Expresión (a la izquierda del '|'): Define qué valor se agrega a la nueva 
     lista resultante cada vez que un elemento supera todas las guardas.
-}

-- ----------------------------------------------------------------------------
-- VERSIÓN 1: Recorrido mediante índices (Tu solución original)
-- ----------------------------------------------------------------------------
-- Funcionamiento:
-- 1. Generador: 'i <- [0 .. length xs - 1]' genera todos los índices válidos de la lista.
-- 2. Guarda: 'xs !! i == a' accede al elemento en la posición 'i' y lo compara con 'a'.
-- 3. Expresión: Por cada índice donde coinciden, coloca un '1' en la lista resultante.
-- 4. Finalmente, 'sum' suma todos los unos generados.
-- Nota de eficiencia: Tiene costo O(n^2) porque el operador (!!) recorre la lista 
-- desde el inicio en cada acceso.
cantRepeticionesV1 :: Eq a => [a] -> a -> Int
cantRepeticionesV1 xs a = sum [1 | i <- [0 .. length xs - 1], xs !! i == a]


-- ----------------------------------------------------------------------------
-- VERSIÓN 2: Generador directo + sum (Recomendada / Idiomática)
-- ----------------------------------------------------------------------------
-- Funcionamiento:
-- 1. Generador: 'y <- xs' toma directamente cada elemento 'y' de la lista 'xs' 
--    sin necesidad de usar índices ni calcular la longitud previamente.
-- 2. Guarda: 'y == a' filtra dejando pasar solo los elementos iguales a 'a'.
-- 3. Expresión: Genera un '1' por cada coincidencia encontrada.
-- 4. 'sum' totaliza la cantidad de unos. Recorre la lista una sola vez: costo O(n).
cantRepeticionesV2 :: Eq a => [a] -> a -> Int
cantRepeticionesV2 xs a = sum [1 | y <- xs, y == a]


-- ----------------------------------------------------------------------------
-- VERSIÓN 3: Filtrado de elementos + length
-- ----------------------------------------------------------------------------
-- Funcionamiento:
-- 1. Generador: 'y <- xs' extrae cada elemento de 'xs'.
-- 2. Guarda: 'y == a' se queda únicamente con los elementos idénticos a 'a'.
-- 3. Expresión: 'y' conserva el elemento original, armando una sublista solo con 
--    las apariciones de 'a' (por ejemplo, si buscamos 2 en [1,2,3,2], arma [2,2]).
-- 4. 'length' cuenta cuántos elementos quedaron en esa lista filtrada. Costo O(n).
cantRepeticionesV3 :: Eq a => [a] -> a -> Int
cantRepeticionesV3 xs a = length [y | y <- xs, y == a]


-- ============================================================================
-- EJECUCIÓN Y CASOS DE PRUEBA EN CONSOLA
-- ============================================================================

-- Función auxiliar para imprimir un caso de prueba de forma prolija
ejecutarPrueba :: (Eq a, Show a) => String -> [a] -> a -> Int -> IO ()
ejecutarPrueba descripcion lista elemBuscado esperado = do
    putStrLn $ "--- " ++ descripcion ++ " ---"
    putStrLn $ "Caso a evaluar : Lista = " ++ show lista ++ " | Elemento = " ++ show elemBuscado
    putStrLn $ "Valor esperado : " ++ show esperado
    putStrLn $ "Resultado V1 (Índices + sum)   : " ++ show (cantRepeticionesV1 lista elemBuscado)
    putStrLn $ "Resultado V2 (Directo + sum)   : " ++ show (cantRepeticionesV2 lista elemBuscado)
    putStrLn $ "Resultado V3 (Filtro + length) : " ++ show (cantRepeticionesV3 lista elemBuscado)
    putStrLn ""

-- Función principal para correr todas las pruebas escribiendo 'main32' en GHCi
main32 :: IO ()
main32 = do
    putStrLn "============================================================"
    putStrLn "      PRUEBAS EJERCICIO 32 - CANTIDAD DE REPETICIONES       "
    putStrLn "============================================================\n"
    
    ejecutarPrueba "Prueba 1: Elemento repetido varias veces (Int)" [1, 5, 2, 5, 3, 5] 5 3
    ejecutarPrueba "Prueba 2: Elemento que no está en la lista (Int)" [10, 20, 30, 40] 99 0
    ejecutarPrueba "Prueba 3: Lista vacía" ([] :: [Int]) 1 0
    ejecutarPrueba "Prueba 4: Todos los elementos iguales (Int)" [7, 7, 7, 7] 7 4
    ejecutarPrueba "Prueba 5: Caracteres en un String (Char)" "algoritmos y estructuras" 'a' 2
    
    putStrLn "============================================================"