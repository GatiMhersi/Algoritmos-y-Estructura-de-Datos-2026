-- ============================================================================
-- EJERCICIO 33: Todas las formas de partir una lista en dos (split2)
-- ============================================================================

{- 
1. POLIMORFISMO PARAMÉTRICO (¿Por qué NO lleva 'Eq a =>'?):
   A diferencia del ejercicio 32, la firma es 'split2 :: [a] -> [([a], [a])]' sin 
   ninguna restricción de clase. Esto pasa porque en ningún momento comparamos ni 
   inspeccionamos los elementos de la lista; solo cortamos la estructura según 
   la cantidad de elementos. Por lo tanto, funciona para listas de cualquier tipo 'a'.

2. PUNTOS CLAVE Y EL CASO LÍMITE (0 hasta length xs):
   Si una lista tiene 'n' elementos, existen 'n + 1' formas de partirla en dos:
   - Corte en i = 0         -> ([] , xs)  -- 0 elementos a la izq, todos a la der.
   - Cortes intermedios...
   - Corte en i = length xs -> (xs , [])  -- Todos a la izq, 0 elementos a la der.

   ERROR COMÚN: Usar el rango [0 .. length xs - 1].
   - En [1,2,3] (longitud 3), [0 .. 2] solo genera i = 0, 1, 2, omitiendo ([1,2,3], []).
   - En la lista vacía [] (longitud 0), el rango queda [0 .. -1], lo cual evalúa a []
     en lugar de devolver `[([], [])]`, que es la única partición válida de la lista vacía.

3. FUNCIONES DEL PRELUDIO UTILIZADAS:
   - take i xs   : Devuelve una sublista con los primeros 'i' elementos de 'xs'.
   - drop i xs   : Devuelve lo que queda de 'xs' tras eliminar los primeros 'i' elementos.
   - splitAt i xs: Función estándar que devuelve directamente la tupla (take i xs, drop i xs).
-}

-- ----------------------------------------------------------------------------
-- VERSIÓN 1: Construcción explícita de la tupla con take y drop
-- ----------------------------------------------------------------------------
-- Funcionamiento:
-- 1. Generador: 'i <- [0 .. length xs]' produce todos los puntos de corte posibles,
--    desde 0 (ningún elemento tomado) hasta la longitud total de la lista.
-- 2. Expresión: '(take i xs, drop i xs)' arma un par ordenado (tupla de 2 listas)
--    para cada valor de 'i', poniendo el prefijo de longitud 'i' a la izquierda
--    y el sufijo restante a la derecha.
split2V1 :: [a] -> [([a], [a])]
split2V1 xs = [(take i xs, drop i xs) | i <- [0 .. length xs]]


-- ----------------------------------------------------------------------------
-- VERSIÓN 2: Utilizando la función preludio splitAt
-- ----------------------------------------------------------------------------
-- Funcionamiento:
-- 1. Generador: 'i <- [0 .. length xs]' recorre exactamente los mismos puntos de corte.
-- 2. Expresión: 'splitAt i xs' hace el corte en la posición 'i' y ya retorna 
--    la tupla ([a], [a]) armada en un solo paso, dejando el código más compacto.
split2V2 :: [a] -> [([a], [a])]
split2V2 xs = [splitAt i xs | i <- [0 .. length xs]]


-- ============================================================================
-- EJECUCIÓN Y CASOS DE PRUEBA EN CONSOLA
-- ============================================================================

-- Función auxiliar para imprimir cada caso de prueba de forma clara
ejecutarPrueba33 :: Show a => String -> [a] -> [([a], [a])] -> IO ()
ejecutarPrueba33 descripcion lista esperado = do
    putStrLn $ "--- " ++ descripcion ++ " ---"
    putStrLn $ "Caso a evaluar : Lista = " ++ show lista
    putStrLn $ "Valor esperado : " ++ show esperado
    putStrLn $ "Resultado V1 (take y drop) : " ++ show (split2V1 lista)
    putStrLn $ "Resultado V2 (splitAt)     : " ++ show (split2V2 lista)
    putStrLn ""

-- Función principal para correr todas las pruebas escribiendo 'main33' en GHCi
main33 :: IO ()
main33 = do
    putStrLn "============================================================"
    putStrLn "          PRUEBAS EJERCICIO 33 - FUNCIÓN SPLIT2             "
    putStrLn "============================================================\n"
    
    ejecutarPrueba33 "Prueba 1: Ejemplo de la guía (3 elementos)" 
        [1, 2, 3] 
        [([], [1, 2, 3]), ([1], [2, 3]), ([1, 2], [3]), ([1, 2, 3], [])]

    ejecutarPrueba33 "Prueba 2: Caso borde - Lista vacía" 
        ([] :: [Int]) 
        [([], [])]

    ejecutarPrueba33 "Prueba 3: Lista de un solo elemento" 
        [42] 
        [([], [42]), ([42], [])]

    ejecutarPrueba33 "Prueba 4: Cadena de texto (String / [Char])" 
        "sol" 
        [("", "sol"), ("s", "ol"), ("so", "l"), ("sol", "")]
    
    putStrLn "============================================================"