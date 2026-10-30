{- ============================================================================
   EXPLICACIÓN: OPERADORES INFIJOS Y REDUCCIÓN DE BOOLEANOS
   ============================================================================
   - Operadores Infijos (`elem`): Las funciones de dos parámetros normalmente 
     se escriben al principio: `elem x ys`. Al rodearlas con backticks 
     (acentos graves), podemos usarlas en el medio: `x \`elem\` ys`, lo que 
     hace el código mucho más legible.
     
   - Uso de 'not' vs '== False': Aunque `condicion == False` es válido, en 
     Haskell (y programación en general) se prefiere usar la función `not`.
============================================================================ -}

-- | SOLUCIÓN 1: Tu lógica corregida.
-- Filtramos todos los elementos de 'xs' que NO están en 'ys'. 
-- Si esa lista resultante está vacía (null), significa que todos estaban.
todosOcurrenEn_v1 :: Eq a => [a] -> [a] -> Bool
todosOcurrenEn_v1 xs ys = null [x | x <- xs, not (x `elem` ys)]


-- | SOLUCIÓN 2: Alternativa idiomática usando 'and'.
-- Por cada elemento 'x' en 'xs', generamos un Booleano verificando si está 
-- en 'ys' ([True, False, True...]). La función 'and' (del ejercicio 21) 
-- reduce esa lista a True solo si TODOS los elementos son True.
todosOcurrenEn_v2 :: Eq a => [a] -> [a] -> Bool
todosOcurrenEn_v2 xs ys = and [x `elem` ys | x <- xs]


-- ============================================================================
-- ZONA DE PRUEBAS (main27)
-- ============================================================================

-- | Función auxiliar para ejecutar e imprimir cada test.
ejecutarPrueba27 :: (Eq a, Show a) => String -> String -> [a] -> [a] -> Bool -> Bool -> IO ()
ejecutarPrueba27 nombreFuncion descripcion xs ys esperado resultadoReal = do
    putStrLn $ "Función en uso:     " ++ nombreFuncion
    putStrLn $ "Caso de prueba:     " ++ descripcion
    putStrLn $ "Lista 1 (xs):       " ++ show xs
    putStrLn $ "Lista 2 (ys):       " ++ show ys
    putStrLn $ "Resultado esperado: " ++ show esperado
    putStrLn $ "Resultado real:     " ++ show resultadoReal
    putStrLn $ "Estado de prueba:   " ++ if resultadoReal == esperado 
                                           then "ÉXITO\n" 
                                           else "FALLO\n"

-- | Función principal para correr todas las validaciones.
main27 :: IO ()
main27 = do
    putStrLn "--- INICIANDO PRUEBAS EJERCICIO 27 ---\n"
    
    -- Prueba 1: Ejemplo del PDF (Verdadero, orden diferente y repetidos)
    ejecutarPrueba27 
        "todosOcurrenEn_v1" 
        "Ejemplo 1 del práctico (Todos están)" 
        [1,5,2,5] 
        [5,1,2,4] 
        True 
        (todosOcurrenEn_v1 [1,5,2,5] [5,1,2,4])
        
    -- Prueba 2: Ejemplo del PDF (Falso, falta el 1)
    ejecutarPrueba27 
        "todosOcurrenEn_v1" 
        "Ejemplo 2 del práctico (Falta un elemento)" 
        [1,5,2,5] 
        [5,2,4] 
        False 
        (todosOcurrenEn_v1 [1,5,2,5] [5,2,4])

    -- Prueba 3: Lista vacía como origen (matemáticamente siempre es True)
    ejecutarPrueba27 
        "todosOcurrenEn_v2" 
        "Lista 'xs' vacía (Vacuamente verdadero)" 
        ([] :: [Int]) 
        [1,2,3] 
        True 
        (todosOcurrenEn_v2 [] [1,2,3])