module Ej13 where

import Data.Time.Clock (getCurrentTime, diffUTCTime)

--------------------------------------------------------------------------------
-- 1. CONSIGNA DEL EJERCICIO 13
--------------------------------------------------------------------------------
-- Enunciado: Especificar e implementar una función que, dada una lista, 
-- determine si sus elementos están ordenados de forma creciente.


--------------------------------------------------------------------------------
-- 2. ESPECIFICACIONES FORMALES (Teórico)
--------------------------------------------------------------------------------
-- Alternativa 1 (Contiguos adyacentes):
-- creciente.xs ≡ <∀ i : 0 ≤ i < #xs - 1 : xs.i ≤ xs.(i + 1)>

-- Alternativa 2 (Todos los pares ordenados i < j):
-- creciente.xs ≡ <∀ i, j : 0 ≤ i < j < #xs : xs.i ≤ xs.j>

-- Alternativa 3 (Mediante partición de subsegmentos):
-- creciente.xs ≡ <∀ as, bs, x, y : xs = as ++ [x, y] ++ bs : x ≤ y>


--------------------------------------------------------------------------------
-- 3. DESCRIPCIONES DE CÓMO TRATA CADA ESPECIFICACIÓN
--------------------------------------------------------------------------------
-- * Método 1: Evalúa la propiedad de manera local paso a paso entre elementos 
--   vecinos contiguos. Por la transitividad del orden, asegura que toda la 
--   lista sea creciente de forma muy eficiente en tiempo O(n).
-- * Método 2: Compara de forma global todos los pares posibles de posiciones 
--   (i, j) donde la primera precede a la segunda (i < j), verificando que 
--   se respete siempre la desigualdad.
-- * Método 3: Emplea la descomposición estructural en subsegmentos, analizando 
--   cualquier partición donde aparezca un bloque de dos elementos adyacentes 
--   [x, y] para comprobar que se cumpla la relación x ≤ y.


--------------------------------------------------------------------------------
-- 4. IMPLEMENTACIONES EN HASKELL EXPLICADAS
--------------------------------------------------------------------------------

-- Funciones auxiliares de partición requeridas por el Método 3:
split2 :: [a] -> [([a], [a])]
split2 xs = [(take i xs, drop i xs) | i <- [0.. length xs]]

split3 :: [a] -> [([a], [a], [a])]
split3 xs = [(as, bs, cs) | (as, ys) <- split2 xs, (bs, cs) <- split2 ys]

-- Método 1: Traduce el cuantificador usando índices adyacentes y 'and'.
-- Explicación: Genera el rango de índices válidos hasta 'length xs - 2' 
-- para evitar desbordamientos, y comprueba elemento a elemento.
creciente :: Ord a => [a] -> Bool
creciente xs = and [xs !! i <= xs !! (i + 1) | i <- [0 .. length xs - 2]]

-- Método 2: Traduce el cuantificador de todos los pares ordenados i < j.
-- Explicación: Cruza los generadores de índices y compara cada par de 
-- posiciones utilizando doble comprensión de listas.
creciente2 :: Ord a => [a] -> Bool
creciente2 xs = and [xs !! i <= xs !! j | j <- [0 .. length xs - 1], i <- [0 .. j - 1]]

-- Método 3: Implementación estructural mediante particiones (split3).
-- Explicación: Extrae todas las ternas de la lista, filtra los bloques 
-- de longitud exacta 2 y comprueba el orden entre el primero y el último elemento.
creciente3 :: Ord a => [a] -> Bool
creciente3 xs = and [x <= y | (as, bs, cs) <- split3 xs, length bs == 2, let x = head bs, let y = last bs]


--------------------------------------------------------------------------------
-- 5. FUNCIÓN PRINCIPAL (MAIN13) CON PRUEBAS Y MÉTRICAS DE TIEMPO
--------------------------------------------------------------------------------

-- Estructura auxiliar para ejecutar una prueba individual y medir su tiempo
probarMetodo :: (Show a, Ord a) => String -> ([a] -> Bool) -> [a] -> Bool -> IO ()
probarMetodo nombreFn f xs esperado = do
    inicio <- getCurrentTime
    -- Forzamos la evaluación estricta del resultado booleano
    let resultado = f xs
    fin <- getCurrentTime
    let tiempo = diffUTCTime fin inicio
    
    putStrLn $ "  -> Método: " ++ nombreFn
    putStrLn $ "     Entrada      : " ++ show xs
    putStrLn $ "     Salida obtenida: " ++ show resultado
    putStrLn $ "     Valor esperado : " ++ show esperado
    putStrLn $ "     Verificación   : " ++ (if resultado == esperado then "CORRECTO" else "FALLÓ")
    putStrLn $ "     Tiempo de ejec.: " ++ show tiempo
    putStrLn $ "------------------------------------------------------------"

main13 :: IO ()
main13 = do
    putStrLn "============================================================"
    putStrLn " EJERCICIO 13: PRUEBAS Y RENDIMIENTO DE LAS 3 IMPLEMENTACIONES"
    putStrLn "============================================================"
    
    -- Casos de prueba representativos
    let lista1 = [1, 2, 3, 4, 5]     -- Creciente corta
    let lista2 = [1, 3, 2, 4, 5]     -- No creciente (descenso al medio)
    let lista3 = [7]                 -- Unitaria (creciente por definición)
    let lista4 = ([] :: [Int])       -- Vacía (creciente por definición)
    let listaGrande = [1..50]        -- Lista más extensa para apreciar diferencias de tiempo
    
    putStrLn "\n[Prueba 1] Lista creciente corta: [1, 2, 3, 4, 5]"
    probarMetodo "Creciente 1 (Adyacentes)" creciente lista1 True
    probarMetodo "Creciente 2 (Pares i < j)" creciente2 lista1 True
    probarMetodo "Creciente 3 (Split3)"     creciente3 lista1 True

    putStrLn "\n[Prueba 2] Lista no creciente: [1, 3, 2, 4, 5]"
    probarMetodo "Creciente 1 (Adyacentes)" creciente lista2 False
    probarMetodo "Creciente 2 (Pares i < j)" creciente2 lista2 False
    probarMetodo "Creciente 3 (Split3)"     creciente3 lista2 False

    putStrLn "\n[Prueba 3] Lista unitaria: [7]"
    probarMetodo "Creciente 1 (Adyacentes)" creciente lista3 True
    probarMetodo "Creciente 2 (Pares i < j)" creciente2 lista3 True
    probarMetodo "Creciente 3 (Split3)"     creciente3 lista3 True

    putStrLn "\n[Prueba 4] Lista vacía: []"
    probarMetodo "Creciente 1 (Adyacentes)" creciente lista4 True
    probarMetodo "Creciente 2 (Pares i < j)" creciente2 lista4 True
    probarMetodo "Creciente 3 (Split3)"     creciente3 lista4 True

    putStrLn "\n[Prueba 5] Lista grande creciente: [1..50]"
    probarMetodo "Creciente 1 (Adyacentes)" creciente listaGrande True
    probarMetodo "Creciente 2 (Pares i < j)" creciente2 listaGrande True
    probarMetodo "Creciente 3 (Split3)"     creciente3 listaGrande True

    putStrLn "============================================================"
    putStrLn " FIN DE LA EJECUCIÓN DE PRUEBAS"
    putStrLn "============================================================"