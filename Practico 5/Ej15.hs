module Ej15 where

import Ej13 (split3)
import Data.Time.Clock (getCurrentTime, diffUTCTime)

--------------------------------------------------------------------------------
-- 1. CONSIGNA DEL EJERCICIO 15 (e implementación 17.b)
--------------------------------------------------------------------------------
-- Enunciado: Especificar e implementar una función que, dada una lista, 
-- determine si existe un elemento en ella que sea igual a la suma del resto 
-- de los elementos de la lista.


--------------------------------------------------------------------------------
-- 2. ESPECIFICACIONES FORMALES (Teórico)
--------------------------------------------------------------------------------
-- Alternativa 1 (Exclusión de índice en la sumatoria):
-- P.xs ≡ <∃ i : 0 ≤ i < #xs : xs.i = <∑ j : 0 ≤ j < #xs ∧ j /= i : xs.j>>

-- Alternativa 2 (Caracterización mediante la suma total doblada):
-- P.xs ≡ <∃ i : 0 ≤ i < #xs : 2 · xs.i = <∑ j : 0 ≤ j < #xs : xs.j>>

-- Alternativa 3 (Mediante partición de lista en prefijo, elemento y sufijo):
-- P.xs ≡ <∃ as, bs, x : xs = as ++ [x] ++ bs : x = sum.as + sum.bs>


--------------------------------------------------------------------------------
-- 3. DESCRIPCIONES DE CÓMO TRATA CADA ESPECIFICACIÓN
--------------------------------------------------------------------------------
-- * Método 1: Traduce literalmente el enunciado recorriendo cada posición 'i' 
--   y sumando todos los elementos en posiciones 'j' distintas de 'i' (j /= i) 
--   para comparar ambos valores.
-- * Método 2: Aprovecha la propiedad algebraica de partición de rango: si un 
--   elemento es igual a la suma del resto, entonces la suma total de la lista 
--   es exactamente el doble de ese elemento (2 * xs.i = sum.xs).
-- * Método 3: Descompone estructuralmente la lista en tres subsegmentos 
--   contiguos (prefijo 'as', subsegmento unitario '[x]' y sufijo 'bs'), 
--   verificando si el elemento central iguala la suma de ambos extremos.


--------------------------------------------------------------------------------
-- 4. IMPLEMENTACIONES EN HASKELL EXPLICADAS
--------------------------------------------------------------------------------

-- Método 1: Traduce el cuantificador existencial con 'or' y exclusión j /= i.
-- Explicación: Para cada índice 'i', construye por comprensión la lista de 
-- todos los demás elementos (j /= i), calcula su suma y la compara con xs !! i.
existeSum :: (Num a, Eq a) => [a] -> Bool
existeSum xs = or [xs !! i == sum [xs !! j | j <- [0 .. length xs - 1], j /= i] | i <- [0 .. length xs - 1]]

-- Método 2: Traduce la igualdad algebraica contra la sumatoria total (2 * xs.i).
-- Explicación: Verifica para cada índice 'i' si el doble del elemento en esa 
-- posición coincide con la sumatoria completa de los elementos de la lista.
existeSum2 :: (Num a, Eq a) => [a] -> Bool
existeSum2 xs = or [2 * (xs !! i) == sum [xs !! j | j <- [0 .. length xs - 1]] | i <- [0 .. length xs - 1]]

-- Método 3: Implementación estructural mediante particiones (split3 y length).
-- Explicación: Genera todas las ternas (as, x, bs) con split3, filtra aquellas 
-- donde el segmento central 'x' tiene longitud 1 y extrae su valor con 'head'.
existeSum3 :: (Num a, Eq a) => [a] -> Bool
existeSum3 xs = or [head x == sum as + sum bs | (as, x, bs) <- split3 xs, length x == 1]

-- Método 3' (Variante idiomática): Pattern matching directo en el generador.
-- Explicación: Filtra y desestructura en un solo paso los segmentos centrales 
-- de un único elemento mediante el patrón [x], evitando invocar 'length' y 'head'.
existeSum3' :: (Num a, Eq a) => [a] -> Bool
existeSum3' xs = or [x == sum as + sum bs | (as, [x], bs) <- split3 xs]


--------------------------------------------------------------------------------
-- 5. FUNCIÓN PRINCIPAL (MAIN15) CON PRUEBAS Y MÉTRICAS DE TIEMPO
--------------------------------------------------------------------------------

-- Estructura auxiliar para ejecutar una prueba individual y medir su tiempo
probarMetodo :: (Show a, Num a, Eq a) => String -> ([a] -> Bool) -> [a] -> Bool -> IO ()
probarMetodo nombreFn f xs esperado = do
    inicio <- getCurrentTime
    -- Forzamos la evaluación estricta del resultado booleano antes de tomar el tiempo final
    resultado <- return $! f xs
    fin <- getCurrentTime
    let tiempo = diffUTCTime fin inicio
    
    putStrLn $ "  -> Método: " ++ nombreFn
    putStrLn $ "     Entrada        : " ++ show xs
    putStrLn $ "     Salida obtenida: " ++ show resultado
    putStrLn $ "     Valor esperado : " ++ show esperado
    putStrLn $ "     Verificación   : " ++ (if resultado == esperado then "CORRECTO" else "FALLÓ")
    putStrLn $ "     Tiempo de ejec.: " ++ show tiempo
    putStrLn $ "------------------------------------------------------------"

main15 :: IO ()
main15 = do
    putStrLn "============================================================"
    putStrLn " EJERCICIO 15: PRUEBAS Y RENDIMIENTO DE LAS IMPLEMENTACIONES"
    putStrLn "============================================================"
    
    -- Casos de prueba representativos y casos borde
    let lista1 = [1, 2, 6, 3]          -- Cumple (6 == 1 + 2 + 3)
    let lista2 = [1, 2, 4]             -- No cumple (suma impar = 7)
    let lista3 = [-3, 3, 0]            -- Cumple con negativos y cero (0 == -3 + 3)
    let lista4 = [0]                   -- Unitaria que cumple (0 == sum [])
    let lista5 = [5]                   -- Unitaria que no cumple (5 /= 0)
    let lista6 = ([] :: [Int])         -- Vacía (False por rango vacío en ∃)
    let listaGrande = [1..50] ++ [1275] -- Cumple al final (1275 == sum [1..50])
    
    putStrLn "\n[Prueba 1] Lista con elemento válido: [1, 2, 6, 3]"
    probarMetodo "ExisteSum 1 (Exclusión j/=i)" existeSum   lista1 True
    probarMetodo "ExisteSum 2 (Doble 2*xs!!i)"  existeSum2  lista1 True
    probarMetodo "ExisteSum 3 (Split3 + head)"  existeSum3  lista1 True
    probarMetodo "ExisteSum 3' (Split3 [x])"    existeSum3' lista1 True

    putStrLn "\n[Prueba 2] Lista sin elemento válido: [1, 2, 4]"
    probarMetodo "ExisteSum 1 (Exclusión j/=i)" existeSum   lista2 False
    probarMetodo "ExisteSum 2 (Doble 2*xs!!i)"  existeSum2  lista2 False
    probarMetodo "ExisteSum 3 (Split3 + head)"  existeSum3  lista2 False
    probarMetodo "ExisteSum 3' (Split3 [x])"    existeSum3' lista2 False

    putStrLn "\n[Prueba 3] Lista con negativos y cero: [-3, 3, 0]"
    probarMetodo "ExisteSum 1 (Exclusión j/=i)" existeSum   lista3 True
    probarMetodo "ExisteSum 2 (Doble 2*xs!!i)"  existeSum2  lista3 True
    probarMetodo "ExisteSum 3 (Split3 + head)"  existeSum3  lista3 True
    probarMetodo "ExisteSum 3' (Split3 [x])"    existeSum3' lista3 True

    putStrLn "\n[Prueba 4] Lista unitaria cero: [0]"
    probarMetodo "ExisteSum 1 (Exclusión j/=i)" existeSum   lista4 True
    probarMetodo "ExisteSum 2 (Doble 2*xs!!i)"  existeSum2  lista4 True
    probarMetodo "ExisteSum 3 (Split3 + head)"  existeSum3  lista4 True
    probarMetodo "ExisteSum 3' (Split3 [x])"    existeSum3' lista4 True

    putStrLn "\n[Prueba 5] Lista unitaria distinta de cero: [5]"
    probarMetodo "ExisteSum 1 (Exclusión j/=i)" existeSum   lista5 False
    probarMetodo "ExisteSum 2 (Doble 2*xs!!i)"  existeSum2  lista5 False
    probarMetodo "ExisteSum 3 (Split3 + head)"  existeSum3  lista5 False
    probarMetodo "ExisteSum 3' (Split3 [x])"    existeSum3' lista5 False

    putStrLn "\n[Prueba 6] Lista vacía: []"
    probarMetodo "ExisteSum 1 (Exclusión j/=i)" existeSum   lista6 False
    probarMetodo "ExisteSum 2 (Doble 2*xs!!i)"  existeSum2  lista6 False
    probarMetodo "ExisteSum 3 (Split3 + head)"  existeSum3  lista6 False
    probarMetodo "ExisteSum 3' (Split3 [x])"    existeSum3' lista6 False

    putStrLn "\n[Prueba 7] Lista grande (51 elementos): [1..50] ++ [1275]"
    probarMetodo "ExisteSum 1 (Exclusión j/=i)" existeSum   listaGrande True
    probarMetodo "ExisteSum 2 (Doble 2*xs!!i)"  existeSum2  listaGrande True
    probarMetodo "ExisteSum 3 (Split3 + head)"  existeSum3  listaGrande True
    probarMetodo "ExisteSum 3' (Split3 [x])"    existeSum3' listaGrande True

    putStrLn "============================================================"
    putStrLn " FIN DE LA EJECUCIÓN DE PRUEBAS"
    putStrLn "============================================================"