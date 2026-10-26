-- =====================================================================
-- EXPLICACIÓN CONCEPTUAL: ¿POR QUÉ USAR LAMBDAS EN FOLDL Y FOLDR?
-- =====================================================================
-- Tu duda inicial era: ¿Cómo funciona el elemento y el acumulador en 
-- foldl y foldr si nos enseñaron que solo toman un operador y un neutro?
-- 
-- 1. El operador simple vs. Operaciones personalizadas:
--    - Cuando hacés `sum = foldr (+) 0`, la función (+) ya es binaria y 
--      suma números directamente. El "acumulador" y el "elemento" son ambos 
--      números, por lo que encajan perfectamente.
--    - Pero ¿qué pasa cuando queremos calcular el tamaño (`length`)? 
--      Los elementos de la lista pueden ser cualquier cosa (Strings, Bools, 
--      Ints), ¡y el resultado debe ser un Int!. No podés sumar directamente 
--      un elemento cualquiera con un número usando (+).
--
-- 2. El rol de la Expresión Lambda:
--    - Como fold exige una función binaria, utilizamos una **lambda** para 
--      crear un "operador a medida".
--    - El **acumulador** actúa como una mochila que viaja guardando el resultado 
--      parcial (en este caso, la cantidad acumulada).
--    - El **elemento** es el valor que sacamos de la lista en cada paso. Como 
--      para calcular el tamaño no nos importa qué contiene el elemento (solo 
--      nos importa que está ahí), lo ignoramos con un guion bajo `_`.
--
-- 3. Diferencia de orden entre foldl y foldr en la lambda:
--    - `foldl` pasa los argumentos como `\acumulador elemento -> ...` 
--      (viene sumando de izquierda a derecha: el acumulador va a la izquierda).
--    - `foldr` pasa los argumentos al revés: `\elemento acumulador -> ...` 
--      (opera desde la derecha hacia la izquierda).
-- =====================================================================

-- Implementación del tamaño usando foldl (izquierda a derecha)
-- El acumulador (`acc`) viene primero, el elemento (`_`) se ignora y se suma 1.
tamFoldl :: [a] -> Int
tamFoldl = foldl (\acc _ -> acc + 1) 0

-- Implementación del tamaño usando foldr (derecha a izquierda)
-- El elemento (`_`) viene primero y se ignora, el acumulador (`acc`) va después y se le suma 1.
tamFoldr :: [a] -> Int
tamFoldr = foldr (\_ acc -> acc + 1) 0

-- Función auxiliar para imprimir las pruebas de forma clara y estructurada
probarTest :: Show a => String -> [a] -> Int -> Int -> IO ()
probarTest nombreFuncion arreglo esperado real = do
    putStrLn $ "--- " ++ nombreFuncion ++ " ---"
    putStrLn $ "Arreglo de entrada   : " ++ show arreglo
    putStrLn $ "Resultado esperado   : " ++ show esperado
    putStrLn $ "Resultado real       : " ++ show real
    if esperado == real
        then putStrLn "[ESTADO] ÉXITO: El resultado es correcto.\n"
        else putStrLn "[ESTADO] FALLO: El resultado no coincide.\n"

-- Bloque main para testear ambas funciones con casos comunes y casos base
main22 :: IO ()
main22 = do
    putStrLn "=== EJECUTANDO TESTS PARA EL EJERCICIO 22 (TAMAÑO) ===\n"

    -- Caso Base: Lista vacía
    let listaVacia :: [Int]
        listaVacia = []
    probarTest "tamFoldl (Caso Base)" listaVacia 0 (tamFoldl listaVacia)
    probarTest "tamFoldr (Caso Base)" listaVacia 0 (tamFoldr listaVacia)

    -- Caso Común 1: Lista corta de Booleanos
    let listaBools = [True, False, True]
    probarTest "tamFoldl (Lista Bools)" listaBools 3 (tamFoldl listaBools)
    probarTest "tamFoldr (Lista Bools)" listaBools 3 (tamFoldr listaBools)

    -- Caso Común 2: Lista de Strings (demuestra que el tipo del elemento no importa)
    let listaStrings = ["Haskell", "Funcional", "Fold"]
    probarTest "tamFoldl (Lista Strings)" listaStrings 3 (tamFoldl listaStrings)
    probarTest "tamFoldr (Lista Strings)" listaStrings 3 (tamFoldr listaStrings)

    -- Caso Grande: Lista con muchos elementos para ver su correcto funcionamiento
    let listaGrande = [1..1000]
    probarTest "tamFoldl (Lista Grande 1000 elementos)" listaGrande 1000 (tamFoldl listaGrande)
    probarTest "tamFoldr (Lista Grande 1000 elementos)" listaGrande 1000 (tamFoldr listaGrande)

    putStrLn "=== FIN DE LAS PRUEBAS ==="