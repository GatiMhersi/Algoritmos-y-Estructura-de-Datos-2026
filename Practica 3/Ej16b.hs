-- =========================================================================
-- EJERCICIO 16 (Parte B): Función "zeroes" con Pattern Matching
-- =========================================================================
-- 
-- EXPLICACIÓN DEL CÓDIGO:
-- A diferencia de la versión anterior (que recibía un número 'n' de elementos), 
-- esta versión recorre la lista completa de forma recursiva dividiéndola en:
-- 1. Caso base ([]): Si la lista está vacía, retorna True.
-- 2. Caso recursivo ((a:as)): Descompone la cabeza (el primer elemento 'a') 
--    y la cola (el resto de la lista 'as'). Evalúa si la cabeza es igual a 0 
--    y mediante && combina con la llamada recursiva sobre el resto (zeroes as).
-- =========================================================================

zeroes :: [Int] -> Bool
zeroes []     = True
zeroes (a:as) = zeroes as && (a == 0)


-- =========================================================================
-- ÁRBOLES DE EJECUCIÓN (Ejemplos equivalentes):
-- =========================================================================
--
-- (a) zeroes [0,2,0]  ---> Retorna: False
-- -------------------------------------------------------------------------
-- zeroes [0,2,0]
--  ├── Llamada recursiva: zeroes [2,0]
--  │    ├── Llamada recursiva: zeroes [0]
--  │    │    ├── Llamada recursiva: zeroes []  --> Retorna True (Caso Base)
--  │    │    └── Evaluación: (0 == 0)  --> True
--  │    └── Resultado parcial: True && True  --> True
--  │    └── Evaluación: (2 == 0)  --> False
--  └── Resultado parcial: True && False  --> False
--
--
-- (b) zeroes [0,0,3]  ---> Retorna: False
-- -------------------------------------------------------------------------
-- zeroes [0,0,3]
--  ├── Llamada recursiva: zeroes [0,3]
--  │    ├── Llamada recursiva: zeroes [3]
--  │    │    ├── Llamada recursiva: zeroes []  --> Retorna True (Caso Base)
--  │    │    └── Evaluación: (3 == 0)  --> False
--  │    └── Resultado parcial: True && False  --> False
--  └── Evaluación: (0 == 0)  --> True
--      └── Resultado final: False && True  --> False
--
--
-- (c) zeroes [0,0,0,0] ---> Retorna: True
-- -------------------------------------------------------------------------
-- zeroes [0,0,0,0]
--  ├── Llamada recursiva: zeroes [0,0,0]
--  │    ├── Llamada recursiva: zeroes [0,0]
--  │    │    ├── Llamada recursiva: zeroes [0]
--  │    │    │    ├── Llamada recursiva: zeroes []  --> Retorna True
--  │    │    │    └── Evaluación: (0 == 0)  --> True
--  │    │    └── Resultado parcial: True && True  --> True
--  │    │    └── Evaluación: (0 == 0)  --> True
--  │    └── Resultado parcial: True && True  --> True
--  │    └── Evaluación: (0 == 0)  --> True
--  └── Resultado parcial: True && True  --> True
--  └── Evaluación: (0 == 0)  --> True
--      └── Resultado final: True && True  --> True
-- =========================================================================


-- =========================================================================
-- FUNCIÓN PRINCIPAL PARA MOSTRAR RESULTADOS Y ÁRBOLES EN PANTALLA
-- =========================================================================

main :: IO ()
main = do
    putStrLn "=========================================================="
    putStrLn "    EJERCICIO 16 (Parte B): FUNCION ZEROES CON PATTERNS   "
    putStrLn "=========================================================="
    
    -- CASO (A)
    putStrLn "\n--- CASO (a): zeroes [0,2,0] ---"
    putStrLn "Arbol de ejecucion:"
    putStrLn "  zeroes [0,2,0]"
    putStrLn "   |-- Llamada: zeroes [2,0]"
    putStrLn "   |    |-- Llamada: zeroes [0]"
    putStrLn "   |    |    |-- Llamada: zeroes []  --> True (Caso Base)"
    putStrLn "   |    |    |-- Evaluacion: (0 == 0)  --> True"
    putStrLn "   |    |-- Resultado parcial: True && True  --> True"
    putStrLn "   |    |-- Evaluacion: (2 == 0)  --> False"
    putStrLn "   |-- Resultado parcial: True && False  --> False"
    putStr "Resultado final por consola: "
    print (zeroes [0,2,0])
    
    -- CASO (B)
    putStrLn "\n--- CASO (b): zeroes [0,0,3] ---"
    putStrLn "Arbol de ejecucion:"
    putStrLn "  zeroes [0,0,3]"
    putStrLn "   |-- Llamada: zeroes [0,3]"
    putStrLn "   |    |-- Llamada: zeroes [3]"
    putStrLn "   |    |    |-- Llamada: zeroes []  --> True (Caso Base)"
    putStrLn "   |    |    |-- Evaluacion: (3 == 0)  --> False"
    putStrLn "   |    |-- Resultado parcial: True && False  --> False"
    putStrLn "   |-- Evaluacion: (0 == 0)  --> True"
    putStrLn "   |-- Resultado final: False && True  --> False"
    putStr "Resultado final por consola: "
    print (zeroes [0,0,3])
    
    -- CASO (C)
    putStrLn "\n--- CASO (c): zeroes [0,0,0,0] ---"
    putStrLn "Arbol de ejecucion:"
    putStrLn "  zeroes [0,0,0,0]"
    putStrLn "   |-- Llamada: zeroes [0,0,0]"
    putStrLn "   |    |-- Llamada: zeroes [0,0]"
    putStrLn "   |    |    |-- Llamada: zeroes [0]"
    putStrLn "   |    |    |    |-- Llamada: zeroes []  --> True"
    putStrLn "   |    |    |    |-- Evaluacion: (0 == 0)  --> True"
    putStrLn "   |    |    |-- Resultado parcial: True && True  --> True"
    putStrLn "   |    |    |-- Evaluacion: (0 == 0)  --> True"
    putStrLn "   |    |-- Resultado parcial: True && True  --> True"
    putStrLn "   |    |-- Evaluacion: (0 == 0)  --> True"
    putStrLn "   |-- Resultado parcial: True && True  --> True"
    putStrLn "   |-- Evaluacion: (0 == 0)  --> True"
    putStrLn "   |-- Resultado final: True && True  --> True"
    putStr "Resultado final por consola: "
    print (zeroes [0,0,0,0])
    
    putStrLn "=========================================================="