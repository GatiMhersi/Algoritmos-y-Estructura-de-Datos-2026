module Ej16 where

import Ej13 (split3)
import Data.Time.Clock (getCurrentTime, diffUTCTime)

--------------------------------------------------------------------------------
-- 1. CONSIGNA DEL EJERCICIO 16 (e implementación 17.c)
--------------------------------------------------------------------------------
-- Enunciado: Usando subsegmentos, especificar e implementar una función que, 
-- dada una lista de enteros, devuelva la longitud del subsegmento más largo 
-- cuyos elementos son todos ceros.


--------------------------------------------------------------------------------
-- 2. ESPECIFICACIONES FORMALES (Teórico)
--------------------------------------------------------------------------------
-- Alternativa 1 (Partición tripartita y cuantificador universal indexado):
-- maxCeros.xs = <Max as, bs, cs : xs = as ++ bs ++ cs ∧ <∀ i : 0 ≤ i < #bs : bs.i = 0> : #bs>

-- Alternativa 2 (Partición con predicado modular todosCeros):
-- maxCeros.xs = <Max bs : <∃ as, cs : xs = as ++ bs ++ cs> ∧ todosCeros.bs : #bs>
--   donde todosCeros.bs ≡ <∀ x : x ∈ bs : x = 0>

-- Alternativa 3 (Subsegmentos indexados por intervalos semicerrados [i..j)):
-- maxCeros.xs = <Max i, j : 0 ≤ i ≤ j ≤ #xs ∧ <∀ k : i ≤ k < j : xs.k = 0> : j - i>


--------------------------------------------------------------------------------
-- 3. DESCRIPCIONES DE CÓMO TRATA CADA ESPECIFICACIÓN
--------------------------------------------------------------------------------
-- * Método 1: Descompone la lista en todas las ternas contiguas posibles 
--   (as, bs, cs) tales que xs = as ++ bs ++ cs, verifica por índice que cada 
--   elemento de 'bs' sea 0, y calcula el máximo de sus longitudes (#bs).
-- * Método 2: Modulariza la propiedad de homogeneidad delegando el chequeo 
--   de ceros a un predicado auxiliar ('todosCeros' o 'all (== 0)'), 
--   separando la generación de subsegmentos de la condición de filtrado.
-- * Método 3: Modela cada subsegmento mediante sus índices de corte (inicio 'i' 
--   y fin 'j' con 0 ≤ i ≤ j ≤ #xs), comprobando que todos los elementos en el 
--   rango intermedio [i .. j-1] sean ceros y maximizando la diferencia (j - i).


--------------------------------------------------------------------------------
-- 4. IMPLEMENTACIONES EN HASKELL EXPLICADAS
--------------------------------------------------------------------------------

-- Método 1: Traducción literal de la Alternativa 1 (split3 + índices con !!).
-- Explicación: Extrae los subsegmentos 'bs' con split3, comprueba con 'and' 
-- que en todas sus posiciones 'i' valga 0, y toma la longitud máxima.
-- (Nota: nunca falla en listas sin ceros porque split3 siempre incluye bs = []).
maxCeros :: [Int] -> Int
maxCeros xs = maximum [length bs | (as, bs, cs) <- split3 xs, and [bs !! i == 0 | i <- [0 .. length bs - 1]]]

-- Método 2: Traducción de la Alternativa 2 (split3 + predicado modular all).
-- Explicación: Usa la función de orden superior 'all (== 0) bs' como predicado 
-- todosCeros y antepone 0 a la lista de longitudes como resguardo explícito.
maxCeros2 :: [Int] -> Int
maxCeros2 xs = maximum (0 : [length bs | (as, bs, cs) <- split3 xs, all (== 0) bs])

-- Método 3: Traducción de la Alternativa 3 (Intervalos de índices i <= j).
-- Explicación: Recorre todos los pares de índices (i, j) con 0 <= i <= j <= #xs, 
-- verifica que xs !! k == 0 en [i .. j-1] y maximiza el largo (j - i).
maxCeros3 :: [Int] -> Int
maxCeros3 xs = maximum [j - i | i <- [0 .. length xs], j <- [i .. length xs], and [xs !! k == 0 | k <- [i .. j - 1]]]

-- Método 3' (Variante con take y drop del 17.c):
-- Explicación: Recorta el subsegmento entre 'i' y 'j' usando take y drop en 
-- lugar de indexar con !!, y verifica que todos sus elementos sean 0.
maxCeros3' :: [Int] -> Int
maxCeros3' xs = maximum (0 : [j - i | i <- [0 .. length xs], j <- [i .. length xs], all (== 0) (take (j - i) (drop i xs))])


--------------------------------------------------------------------------------
-- 5. FUNCIÓN PRINCIPAL (MAIN16) CON PRUEBAS Y MÉTRICAS DE TIEMPO
--------------------------------------------------------------------------------

-- Estructura auxiliar para ejecutar una prueba individual y medir su tiempo
probarMetodo :: String -> ([Int] -> Int) -> [Int] -> Int -> IO ()
probarMetodo nombreFn f xs esperado = do
    inicio <- getCurrentTime
    -- Forzamos la evaluación estricta del entero resultante antes de medir el tiempo final
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

main16 :: IO ()
main16 = do
    putStrLn "============================================================"
    putStrLn " EJERCICIO 16: PRUEBAS Y RENDIMIENTO DE LAS IMPLEMENTACIONES"
    putStrLn "============================================================"
    
    -- Casos de prueba representativos y casos borde
    let lista1 = [1, 0, 0, 0, 2, 0, 0] -- Caso típico con dos rachas (máxima = 3)
    let lista2 = [1, 2, 3, 4, 5]       -- Sin ceros (debe devolver 0 por bs = [])
    let lista3 = [0, 0, 0, 0]          -- Todos ceros (máxima = longitud total = 4)
    let lista4 = [0]                   -- Unitaria con cero (máxima = 1)
    let lista5 = [7]                   -- Unitaria sin cero (máxima = 0)
    let lista6 = ([] :: [Int])         -- Lista vacía (máxima = 0)
    let listaGrande = [1..20] ++ replicate 25 0 ++ [1..20] -- 65 elementos (racha central de 25 ceros)
    
    putStrLn "\n[Prueba 1] Lista con varias rachas de ceros: [1, 0, 0, 0, 2, 0, 0]"
    probarMetodo "MaxCeros 1 (Split3 + !!)"       maxCeros   lista1 3
    probarMetodo "MaxCeros 2 (Split3 + all)"      maxCeros2  lista1 3
    probarMetodo "MaxCeros 3 (Intervalos i..j)"   maxCeros3  lista1 3
    probarMetodo "MaxCeros 3' (take y drop)"      maxCeros3' lista1 3

    putStrLn "\n[Prueba 2] Lista sin ceros: [1, 2, 3, 4, 5]"
    probarMetodo "MaxCeros 1 (Split3 + !!)"       maxCeros   lista2 0
    probarMetodo "MaxCeros 2 (Split3 + all)"      maxCeros2  lista2 0
    probarMetodo "MaxCeros 3 (Intervalos i..j)"   maxCeros3  lista2 0
    probarMetodo "MaxCeros 3' (take y drop)"      maxCeros3' lista2 0

    putStrLn "\n[Prueba 3] Lista con todos ceros: [0, 0, 0, 0]"
    probarMetodo "MaxCeros 1 (Split3 + !!)"       maxCeros   lista3 4
    probarMetodo "MaxCeros 2 (Split3 + all)"      maxCeros2  lista3 4
    probarMetodo "MaxCeros 3 (Intervalos i..j)"   maxCeros3  lista3 4
    probarMetodo "MaxCeros 3' (take y drop)"      maxCeros3' lista3 4

    putStrLn "\n[Prueba 4] Lista unitaria con cero: [0]"
    probarMetodo "MaxCeros 1 (Split3 + !!)"       maxCeros   lista4 1
    probarMetodo "MaxCeros 2 (Split3 + all)"      maxCeros2  lista4 1
    probarMetodo "MaxCeros 3 (Intervalos i..j)"   maxCeros3  lista4 1
    probarMetodo "MaxCeros 3' (take y drop)"      maxCeros3' lista4 1

    putStrLn "\n[Prueba 5] Lista unitaria sin cero: [7]"
    probarMetodo "MaxCeros 1 (Split3 + !!)"       maxCeros   lista5 0
    probarMetodo "MaxCeros 2 (Split3 + all)"      maxCeros2  lista5 0
    probarMetodo "MaxCeros 3 (Intervalos i..j)"   maxCeros3  lista5 0
    probarMetodo "MaxCeros 3' (take y drop)"      maxCeros3' lista5 0

    putStrLn "\n[Prueba 6] Lista vacía: []"
    probarMetodo "MaxCeros 1 (Split3 + !!)"       maxCeros   lista6 0
    probarMetodo "MaxCeros 2 (Split3 + all)"      maxCeros2  lista6 0
    probarMetodo "MaxCeros 3 (Intervalos i..j)"   maxCeros3  lista6 0
    probarMetodo "MaxCeros 3' (take y drop)"      maxCeros3' lista6 0

    putStrLn "\n[Prueba 7] Lista grande (65 elementos, 25 ceros al medio)"
    probarMetodo "MaxCeros 1 (Split3 + !!)"       maxCeros   listaGrande 25
    probarMetodo "MaxCeros 2 (Split3 + all)"      maxCeros2  listaGrande 25
    probarMetodo "MaxCeros 3 (Intervalos i..j)"   maxCeros3  listaGrande 25
    probarMetodo "MaxCeros 3' (take y drop)"      maxCeros3' listaGrande 25

    putStrLn "============================================================"
    putStrLn " FIN DE LA EJECUCIÓN DE PRUEBAS"
    putStrLn "============================================================"