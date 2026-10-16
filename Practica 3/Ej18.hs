-- =====================================================================
-- EJERCICIO 18: Función belongs
-- =====================================================================
-- Comentario sobre el error original:
-- El error "No instance for (Eq a)" ocurría porque Haskell necesita saber 
-- que el tipo genérico 'a' pertenece a la clase de tipos 'Eq' para poder 
-- usar el operador de igualdad (==). Al agregar "Eq a =>", le indicamos 
-- al compilador que la función solo acepta tipos cuyos elementos puedan 
-- ser comparados entre sí.
-- =====================================================================

belongs :: Eq a => a -> [a] -> Bool
belongs e [] = False
belongs e (a:as) = belongs e as || (a == e)

-- =====================================================================
-- CASOS DE PRUEBA (Función Main)
-- =====================================================================
-- Esta función main ejecuta diferentes pruebas indicando claramente 
-- qué es lo que valida cada caso.

main :: IO ()
main = do
    putStrLn "=== EJECUTANDO PRUEBAS PARA LA FUNCION 'belongs' ==="
    
    -- Test 1: Buscar un número que SÍ está en una lista de enteros
    putStrLn "Probando si 3 pertenece a [1, 2, 3, 4]:"
    putStrLn $ "Resultado obtenido: " ++ show (belongs 3 [1, 2, 3, 4]) -- Esperado: True
    putStrLn "--------------------------------------------------"

    -- Test 2: Buscar un carácter que SÍ está en una lista de caracteres (String)
    putStrLn "Probando si 'a' pertenece a ['h', 'o', 'l', 'a']:"
    putStrLn $ "Resultado obtenido: " ++ show (belongs 'a' ['h', 'o', 'l', 'a']) -- Esperado: True
    putStrLn "--------------------------------------------------"

    -- Test 3: Buscar un número que NO está en la lista
    putStrLn "Probando si 5 pertenece a [1, 2, 3, 4] (No está):"
    putStrLn $ "Resultado obtenido: " ++ show (belongs 5 [1, 2, 3, 4]) -- Esperado: False
    putStrLn "--------------------------------------------------"

    -- Test 4: Caso límite con lista vacía (debe retornar False siempre)
    putStrLn "Probando si 1 pertenece a una lista vacía []:"
    putStrLn $ "Resultado obtenido: " ++ show (belongs 1 []) -- Esperado: False
    putStrLn "--------------------------------------------------"

    -- Test 5: Elementos repetidos en la lista
    putStrLn "Probando si 2 pertenece a [2, 2, 2]:"
    putStrLn $ "Resultado obtenido: " ++ show (belongs 2 [2, 2, 2]) -- Esperado: True
    putStrLn "--------------------------------------------------"

    putStrLn "=== FIN DE LAS PRUEBAS ==="