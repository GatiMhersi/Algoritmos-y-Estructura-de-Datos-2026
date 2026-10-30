{- ============================================================================
   EXPLICACIÓN: RANGOS Y CONSIDERACIONES DE DOMINIO
   ============================================================================
   - Rangos [1..n]: Esta sintaxis es "azúcar sintáctica" (syntax sugar) que 
     provee Haskell gracias a la clase de tipos 'Enum' (tipos enumerables). 
     Genera automáticamente la lista de números desde el 1 hasta 'n'.
     
   - Condición (n `mod` d == 0): Exactamente como vimos, verifica si 'd' 
     divide a 'n' sin dejar resto.
     
   - Detalle de Dominio: Tu función es perfecta para números positivos. 
     ¿Qué pasa si mandamos un número negativo, como -5? En Haskell, el rango 
     [1..-5] evalúa a una lista vacía []. Por lo tanto, la función retornará 
     [] para números negativos. Para el alcance de Álgebra/Algoritmos 1, 
     esto es el comportamiento esperado estándar.
============================================================================ -}

module Ej26 (divisores_v1) where
-- | SOLUCIÓN 1: Tu propuesta original.
-- Usa 'Integral', lo que le da flexibilidad (acepta Int o Integer).
-- Es limpia, declarativa y muy idiomática en Haskell.
divisores_v1 :: Integral a => a -> [a]
divisores_v1 n = [d | d <- [1..n], n `mod` d == 0]


-- | SOLUCIÓN 2: Versión con optimización matemática.
-- Un número nunca va a tener un divisor (entero) mayor a su mitad exacta, 
-- exceptuando al número mismo. Acá achicamos el rango de búsqueda a [1 .. n/2]
-- y al final simplemente le concatenamos (++) el número original.
-- Esto reduce las iteraciones a la mitad, útil si 'n' es gigantesco.
divisores_v2 :: Int -> [Int]
divisores_v2 n = [d | d <- [1 .. (n `div` 2)], n `mod` d == 0] ++ [n]


-- ============================================================================
-- ZONA DE PRUEBAS (main26)
-- ============================================================================

-- | Función auxiliar para ejecutar e imprimir cada test.
ejecutarPrueba26 :: (Eq a, Show a) => String -> String -> a -> [a] -> [a] -> IO ()
ejecutarPrueba26 nombreFuncion descripcion input esperado resultadoReal = do
    putStrLn $ "Función en uso:     " ++ nombreFuncion
    putStrLn $ "Caso de prueba:     " ++ descripcion
    putStrLn $ "Input:              " ++ show input
    putStrLn $ "Resultado esperado: " ++ show esperado
    putStrLn $ "Resultado real:     " ++ show resultadoReal
    putStrLn $ "Estado de prueba:   " ++ if resultadoReal == esperado 
                                           then "ÉXITO\n" 
                                           else "FALLO\n"

-- | Función principal para correr todas las validaciones.
main26 :: IO ()
main26 = do
    putStrLn "--- INICIANDO PRUEBAS EJERCICIO 26 ---\n"
    
    -- Prueba 1: Número primo (solo divisible por 1 y por sí mismo)
    ejecutarPrueba26 
        "divisores_v1" 
        "Divisores de un número primo" 
        7 
        [1, 7] 
        (divisores_v1 7)
        
    -- Prueba 2: Número compuesto (múltiples divisores)
    ejecutarPrueba26 
        "divisores_v1" 
        "Divisores de un número compuesto" 
        12 
        [1, 2, 3, 4, 6, 12] 
        (divisores_v1 12)
        
    -- Prueba 3: Validando la versión optimizada matemáticamente
    ejecutarPrueba26 
        "divisores_v2" 
        "Divisores con versión optimizada (mitad de rango)" 
        28 
        [1, 2, 4, 7, 14, 28] 
        (divisores_v2 28)