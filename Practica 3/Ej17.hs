-- =========================================================================
-- EJERCICIO 17: Función "factorial" y Árboles de Ejecución
-- =========================================================================
-- 
-- EXPLICACIÓN DEL CÓDIGO:
-- La función "factorial" calcula el factorial de un número entero de forma recursiva:
-- 1. Caso base (0 = 1): El factorial de 0 es 1.
-- 2. Caso recursivo (n): Multiplica n por el factorial de n - 1.
-- =========================================================================

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)


-- =========================================================================
-- ÁRBOLES DE EJECUCIÓN (Consigna del práctico):
-- =========================================================================
--
-- (a) factorial 1  ---> Retorna: 1
-- -------------------------------------------------------------------------
-- factorial 1
--  └── 1 * factorial 0
--       └── 1 (Caso Base)  --> Resultado: 1 * 1 = 1
--
--
-- (b) factorial 3  ---> Retorna: 6
-- -------------------------------------------------------------------------
-- factorial 3
--  └── 3 * factorial 2
--       └── 3 * (2 * factorial 1)
--            └── 3 * (2 * (1 * factorial 0))
--                 └── 3 * (2 * (1 * 1))  --> Resultado: 6
--
--
-- (c) factorial 5  ---> Retorna: 120
-- -------------------------------------------------------------------------
-- factorial 5
--  └── 5 * factorial 4
--       └── 5 * (4 * factorial 3)
--            └── 5 * (4 * (3 * factorial 2))
--                 └── 5 * (4 * (3 * (2 * factorial 1)))
--                      └── 5 * (4 * (3 * (2 * (1 * factorial 0))))
--                           └── 5 * (4 * (3 * (2 * (1 * 1)))) --> Resultado: 120
-- =========================================================================


-- =========================================================================
-- FUNCIÓN PRINCIPAL PARA MOSTRAR RESULTADOS Y ÁRBOLES EN PANTALLA
-- =========================================================================

main :: IO ()
main = do
    putStrLn "=========================================================="
    putStrLn "      EJERCICIO 17: FUNCION FACTORIAL Y ARBOLES           "
    putStrLn "=========================================================="
    
    -- CASO (A)
    putStrLn "\n--- CASO (a): factorial 1 ---"
    putStrLn "Arbol de ejecucion:"
    putStrLn "  factorial 1"
    putStrLn "   |-- 1 * factorial 0"
    putStrLn "   |    |-- 1 (Caso Base)"
    putStrLn "   |-- Resultado: 1 * 1 = 1"
    putStr "Resultado final por consola: "
    print (factorial 1)
    
    -- CASO (B)
    putStrLn "\n--- CASO (b): factorial 3 ---"
    putStrLn "Arbol de ejecucion:"
    putStrLn "  factorial 3"
    putStrLn "   |-- 3 * factorial 2"
    putStrLn "   |    |-- 3 * (2 * factorial 1)"
    putStrLn "   |    |    |-- 3 * (2 * (1 * factorial 0))"
    putStrLn "   |    |    |    |-- 3 * (2 * (1 * 1))"
    putStrLn "   |-- Resultado: 6"
    putStr "Resultado final por consola: "
    print (factorial 3)
    
    -- CASO (C)
    putStrLn "\n--- CASO (c): factorial 5 ---"
    putStrLn "Arbol de ejecucion:"
    putStrLn "  factorial 5"
    putStrLn "   |-- 5 * factorial 4"
    putStrLn "   |    |-- 5 * (4 * factorial 3)"
    putStrLn "   |    |    |-- 5 * (4 * (3 * factorial 2))"
    putStrLn "   |    |    |    |-- 5 * (4 * (3 * (2 * factorial 1)))"
    putStrLn "   |    |    |    |    |-- 5 * (4 * (3 * (2 * (1 * factorial 0))))"
    putStrLn "   |    |    |    |    |    |-- 5 * (4 * (3 * (2 * (1 * 1))))"
    putStrLn "   |-- Resultado: 120"
    putStr "Resultado final por consola: "
    print (factorial 5)
    
    putStrLn "=========================================================="