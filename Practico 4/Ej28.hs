{-
  EJERCICIO 28 - NÚMEROS PRIMOS ENTRE 2 Y N (Listas por Comprensión)
  
  Contexto: Aunque este problema se puede resolver utilizando funciones 
  de alto orden (como `filter`) o mediante algoritmos optimizados 
  (como la Criba de Eratóstenes con recursión explícita), este ejercicio 
  pertenece a la sección de "Listas por comprensión". Por lo tanto, todas 
  las implementaciones a continuación respetan este paradigma, mostrando 
  distintas formas de pensar el problema de manera declarativa.
-}

import Ej5 (esPrimo1)
import Ej26 (divisores_v1)

-- Asumimos que tenés definida esPrimo1 del Ejercicio 5.
-- La incluyo acá de forma básica para que el archivo compile de forma independiente.


-- =====================================================================
-- 1. Solución Original (Usando función auxiliar)
-- =====================================================================
{-
  Esta es la forma más limpia y modular. Genera los números del 2 al n
  y utiliza la función `esPrimo1` como predicado o filtro.
  - Generador: `x <- [2..n]` toma cada número del rango.
  - Condición: `esPrimo1 x` evalúa si se incluye o no en la lista final.
-}
primosEntre2yN :: Int -> [Int]
primosEntre2yN n = [x | x <- [2..n] , esPrimo1 x]


-- =====================================================================
-- 2. Comprensión Anidada (Inline)
-- =====================================================================
{-
  En lugar de llamar a `esPrimo1`, definimos la lógica de primalidad 
  directamente en la condición de la lista. 
  Para cada `x`, construimos una sub-lista `[d | d <- [2..x-1], x `mod` d == 0]`.
  Esta sub-lista contiene los divisores de `x` (sin contar 1 y x). 
  Si esa sub-lista está vacía (`== []`), significa que `x` es primo.
-}
primosEntre2yN_inline :: Int -> [Int]
primosEntre2yN_inline n = [x | x <- [2..n], [d | d <- [2..x-1], x `mod` d == 0] == []]


-- =====================================================================
-- 3. Reutilizando el Ejercicio 26 (Divisores)
-- =====================================================================
{-
  El ejercicio 26 te pide retornar los divisores de un número. Si 
  reutilizamos esa lógica, el código es más semántico. Un número es 
  primo si y sólo si su lista exacta de divisores es `[1, el mismo número]`.
-}

primosEntre2yN_ej26 :: Int -> [Int]
primosEntre2yN_ej26 n = [x | x <- [2..n], divisores_v1 x == [1, x]]


-- =====================================================================
-- 4. Descarte de Compuestos (Generación múltiple)
-- =====================================================================
{-
  Esta es la aproximación más matemática usando puramente el concepto 
  de conjuntos. En vez de evaluar la división exacta de cada número, 
  construimos un conjunto de lo que NO queremos (los compuestos) y lo filtramos.
  
  Paso a paso:
  1. `compuestos`: Genera una lista multiplicando TODAS las combinaciones 
     posibles de números (`y * z`) desde 2 hasta `n`. Si el resultado de la 
     multiplicación es menor o igual a `n`, se agrega a la lista. 
     (Ej: 2*2=4, 2*3=6, etc. Estos son los números compuestos).
  2. `[x | ...]`: Genera la lista final tomando los números del 2 al `n`, 
     pero la condición es `not (x `elem` compuestos)`. Es decir, si el número 
     `x` se encuentra en la bolsa de "compuestos", lo descarta. Si no está, es primo.
-}
primosEntre2yN_descarte :: Int -> [Int]
primosEntre2yN_descarte n = 
    let compuestos = [y * z | y <- [2..n], z <- [2..n], y * z <= n]
    in [x | x <- [2..n], not (x `elem` compuestos)]


-- =====================================================================
-- ZONA DE PRUEBAS (main28)
-- =====================================================================

-- Función auxiliar para imprimir las pruebas con formato
test :: String -> (Int -> [Int]) -> Int -> [Int] -> IO ()
test nombre funcion input esperado = do
    putStrLn $ "--- Ejecutando: " ++ nombre ++ " ---"
    putStrLn $ "Input:           " ++ show input
    putStrLn $ "Output Esperado: " ++ show esperado
    putStrLn $ "Output Real:     " ++ show (funcion input)
    putStrLn ""

main28 :: IO ()
main28 = do
    let n = 20
    let resultadoEsperado = [2, 3, 5, 7, 11, 13, 17, 19]
    
    putStrLn "========================================================="
    putStrLn "          TESTING: EJERCICIO 28 (Listas por Comprension)   "
    putStrLn "=========================================================\n"
    
    test "Solucion Original (con esPrimo1)" primosEntre2yN n resultadoEsperado
    test "Solucion Anidada (Inline)" primosEntre2yN_inline n resultadoEsperado
    test "Solucion Reutilizando Ej26" primosEntre2yN_ej26 n resultadoEsperado
    test "Solucion por Descarte de Compuestos" primosEntre2yN_descarte n resultadoEsperado