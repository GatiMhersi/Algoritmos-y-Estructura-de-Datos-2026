-- =========================================================================
-- EJERCICIO 16: Función "zeros" y Árboles de Ejecución
-- =========================================================================

zeros :: [Int] -> Int -> Bool
zeros a n
  | n == 0             = True
  | otherwise          = zeros a (n - 1) && (a !! (n - 1) == 0)


-- =========================================================================
-- FUNCIÓN PRINCIPAL PARA MOSTRAR RESULTADOS Y ÁRBOLES EN PANTALLA
-- =========================================================================

main :: IO ()
main = do
    putStrLn "=========================================================="
    putStrLn "      EJERCICIO 16: FUNCION ZEROS Y ARBOLES               "
    putStrLn "=========================================================="
    
    -- CASO (A)
    putStrLn "\n--- CASO (a): zeros [0,2,0] 3 ---"
    putStrLn "Arbol de ejecucion:"
    putStrLn "  zeros [0,2,0] 3"
    putStrLn "   |-- Llamada: zeros [0,2,0] 2"
    putStrLn "   |    |-- Llamada: zeros [0,2,0] 1"
    putStrLn "   |    |    |-- Llamada: zeros [0,2,0] 0  --> True (Caso Base)"
    putStrLn "   |    |    |-- Evaluacion: ([0,2,0] !! 0) == 0  --> True"
    putStrLn "   |    |-- Resultado parcial: True && True  --> True"
    putStrLn "   |    |-- Evaluacion: ([0,2,0] !! 1) == 0  --> (2 == 0)  --> False"
    putStrLn "   |-- Resultado parcial: True && False  --> False"
    putStr "Resultado final por consola: "
    print (zeros [0,2,0] 3)
    
    -- CASO (B)
    putStrLn "\n--- CASO (b): zeros [0,0,3] 2 ---"
    putStrLn "Arbol de ejecucion:"
    putStrLn "  zeros [0,0,3] 2"
    putStrLn "   |-- Llamada: zeros [0,0,3] 1"
    putStrLn "   |    |-- Llamada: zeros [0,0,3] 0  --> True (Caso Base)"
    putStrLn "   |    |-- Evaluacion: ([0,0,3] !! 0) == 0  --> True"
    putStrLn "   |    |-- Resultado parcial: True && True  --> True"
    putStrLn "   |-- Evaluacion: ([0,0,3] !! 1) == 0  --> True"
    putStrLn "   |-- Resultado final: True && True  --> True"
    putStr "Resultado final por consola: "
    print (zeros [0,0,3] 2)
    
    -- CASO (C)
    putStrLn "\n--- CASO (c): zeros [0,0,0,0] 4 ---"
    putStrLn "Arbol de ejecucion:"
    putStrLn "  zeros [0,0,0,0] 4"
    putStrLn "   |-- Llamada: zeros [0,0,0,0] 3"
    putStrLn "   |    |-- Llamada: zeros [0,0,0,0] 2"
    putStrLn "   |    |    |-- Llamada: zeros [0,0,0,0] 1"
    putStrLn "   |    |    |    |-- Llamada: zeros [0,0,0,0] 0  --> True"
    putStrLn "   |    |    |    |-- Evaluacion: ([0,0,0,0] !! 0) == 0  --> True"
    putStrLn "   |    |    |-- Resultado parcial: True && True  --> True"
    putStrLn "   |    |    |-- Evaluacion: ([0,0,0,0] !! 1) == 0  --> True"
    putStrLn "   |    |-- Resultado parcial: True && True  --> True"
    putStrLn "   |    |-- Evaluacion: ([0,0,0,0] !! 2) == 0  --> True"
    putStrLn "   |-- Resultado parcial: True && True  --> True"
    putStrLn "   |-- Evaluacion: ([0,0,0,0] !! 3) == 0  --> True"
    putStrLn "   |-- Resultado final: True && True  --> True"
    putStr "Resultado final por consola: "
    print (zeros [0,0,0,0] 4)
    
    putStrLn "=========================================================="