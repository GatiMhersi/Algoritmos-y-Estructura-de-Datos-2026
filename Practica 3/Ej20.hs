-- =====================================================================
-- EJERCICIO 20: Función length' y Análisis de Tipos/Clases
-- =====================================================================
-- 
-- REPASO: DIFERENCIA ENTRE TIPOS Y CLASES DE TIPOS EN HASKELL:
-- 1. TIPOS (Conjuntos de valores concretos):
--    - 'Int': Entero de tamaño fijo (eficiente, pero tiene un límite máximo/mínimo).
--    - 'Integer': Entero de precisión arbitraria (sin límite de tamaño, crece según necesidad).
--    - 'Float' / 'Double': Números de punto flotante (con decimales).
--
-- 2. CLASES DE TIPOS (Familias de comportamientos o interfaces):
--    - 'Num': Clase general para todos los tipos numéricos (enteros y decimales). Exige operaciones como (+), (-), (*).
--    - 'Integral': Subclase de 'Num' que agrupa exclusivamente a los números enteros (como Int e Integer).
--
-- PERFIL DE LA FUNCIÓN length':
-- length' :: [a] -> Int
-- Recibe una lista de cualquier tipo 'a' y devuelve un 'Int' con la cantidad de elementos.
-- =====================================================================

length' :: [a] -> Int
length' [] = 0
length' (_:xs) = 1 + length' xs

-- =====================================================================
-- ÁRBOLES DE EJECUCIÓN (Ejemplos del Ejercicio 20):
-- 
-- Caso (a): length' [2, 5, 7]
-- length' [2, 5, 7] 
--   = 1 + length' [5, 7]
--   = 1 + (1 + length' [7])
--   = 1 + (1 + (1 + length' []))
--   = 1 + (1 + (1 + 0))
--   = 3
--
-- Caso (b): length' ['a', 'z']
-- length' ['a', 'z']
--   = 1 + length' ['z']
--   = 1 + (1 + length' [])
--   = 1 + (1 + 0)
--   = 2
--
-- Caso (c): length' [[3, 4], []] (Lista de listas)
-- length' [[3, 4], []]
--   = 1 + length' [[]]
--   = 1 + (1 + length' [])
--   = 1 + (1 + 0)
--   = 2
-- =====================================================================

main :: IO ()
main = do
    putStrLn "=== EJECUTANDO PRUEBAS Y ARBOLES DE EJECUCION (EJERCICIO 20) ==="
    putStrLn ""

    -- Caso (a)
    putStrLn "--- CASO A: length' [2, 5, 7] ---"
    putStrLn "Arbol de ejecucion conceptual:"
    putStrLn "  length' [2, 5, 7] -> 1 + length' [5, 7]"
    putStrLn "                     -> 1 + (1 + length' [7])"
    putStrLn "                     -> 1 + (1 + (1 + length' []))"
    putStrLn "                     -> 1 + (1 + (1 + 0)) = 3"
    putStrLn $ "Resultado por consola: " ++ show (length' [2, 5, 7])
    putStrLn "------------------------------------------------------------"

    -- Caso (b)
    putStrLn "--- CASO B: length' ['a', 'z'] ---"
    putStrLn "Arbol de ejecucion conceptual:"
    putStrLn "  length' ['a', 'z'] -> 1 + length' ['z']"
    putStrLn "                      -> 1 + (1 + length' [])"
    putStrLn "                      -> 1 + (1 + 0) = 2"
    putStrLn $ "Resultado por consola: " ++ show (length' ['a', 'z'])
    putStrLn "------------------------------------------------------------"

    -- Caso (c)
    putStrLn "--- CASO C: length' [[3, 4], []] ---"
    putStrLn "Arbol de ejecucion conceptual:"
    putStrLn "  length' [[3, 4], []] -> 1 + length' [[]]"
    putStrLn "                       -> 1 + (1 + length' [])"
    putStrLn "                       -> 1 + (1 + 0) = 2"
    putStrLn $ "Resultado por consola: " ++ show (length' [[3, 4], []])
    putStrLn "------------------------------------------------------------"

    putStrLn "=== FIN DE LAS PRUEBAS ==="
