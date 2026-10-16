-- =====================================================================
-- EJERCICIO 19: Función fibonacci
-- =====================================================================
-- Perfil de la función:
-- fibonacci :: Int -> Int
-- 
-- POSIBLE PROBLEMA / CASO LÍMITE:
-- Si se ingresa un número negativo (ej: fibonacci (-1)), la función 
-- entrará en un bucle recursivo infinito descendente porque nunca 
-- llegará al caso base 0 o 1.
-- =====================================================================

fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci x = fibonacci (x - 1) + fibonacci (x - 2)

-- =====================================================================
-- CASOS DE PRUEBA (Función Main)
-- =====================================================================

main :: IO ()
main = do
    putStrLn "=== EJECUTANDO PRUEBAS PARA FIBONACCI ==="
    
    -- Casos base de la consigna
    putStrLn "Probando fibonacci 0 (Esperado: 0):"
    putStrLn $ "Resultado: " ++ show (fibonacci 0)
    putStrLn "--------------------------------------------------"

    putStrLn "Probando fibonacci 1 (Esperado: 1):"
    putStrLn $ "Resultado: " ++ show (fibonacci 1)
    putStrLn "--------------------------------------------------"

    putStrLn "Probando fibonacci 2 (Esperado: 1):"
    putStrLn $ "Resultado: " ++ show (fibonacci 2)
    putStrLn "--------------------------------------------------"

    putStrLn "Probando fibonacci 3 (Esperado: 2):"
    putStrLn $ "Resultado: " ++ show (fibonacci 3)
    putStrLn "--------------------------------------------------"

    -- Caso más avanzado mencionado en la práctica (> fibonacci 11 = 89)
    putStrLn "Probando fibonacci 11 (Esperado: 89):"
    putStrLn $ "Resultado: " ++ show (fibonacci 11)
    putStrLn "--------------------------------------------------"

    -- Caso límite problemático (Comentado para que no rompa la ejecución, 
    -- pero podés probarlo bajo tu propio riesgo si querés ver el bucle infinito):
    -- putStrLn "Probando fibonacci con número negativo (-1):"
    -- putStrLn $ "Resultado: " ++ show (fibonacci (-1))

    putStrLn "=== FIN DE LAS PRUEBAS ==="

fibonacciOpt :: Int -> Integer
fibonacciOpt n = fibAux n 0 1
 where
  fibAux 0 a _ = a
  fibAux i a b = fibAux (i - 1) b (a + b)