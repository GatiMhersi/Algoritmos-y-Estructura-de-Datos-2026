-- ============================================================================
-- EJERCICIO 23: Dada una lista de enteros, retornar sus sucesores
--               utilizando listas por comprensión.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- NOTA SOBRE APLICACIÓN PARCIAL Y ESTILO POINT-FREE (eta-reducción):
-- Con listas por comprensión NO es posible omitir el parámetro 'xs'.
-- 
-- ¿Por qué no se puede?
-- En Haskell, las listas por comprensión son una construcción sintáctica 
-- especial (syntactic sugar que el compilador traduce internamente a 'map' 
-- y 'concatMap'), y no una función de orden superior común como 'map'. 
-- 
-- Mientras que con alto orden podemos escribir de forma parcial:
--   listaSucc = map (+1)
-- En una lista por comprensión, la sintaxis del generador (x <- xs) exige 
-- obligatoriamente tener una expresión de tipo lista explícita a la derecha 
-- de la flecha '<-'. Intentar dejar el generador abierto como:
--   listaSucc = [x + 1 | x <- ] 
-- produce un error de sintaxis (parse error), ya que '<-' no es un operador 
-- infijo que pueda seccionarse, sino parte de la gramática fija del lenguaje.
-- ----------------------------------------------------------------------------


-- Solución 1: Suma aritmética directa.
-- Funcionamiento: El generador (x <- xs) extrae cada elemento 'x' de la lista 
-- 'xs' en orden, le suma 1 mediante el operador (+), y construye la nueva lista.
listaSucc :: [Int] -> [Int]
listaSucc xs = [x + 1 | x <- xs]


-- Solución 2: Uso de la función 'succ' de la clase de tipos Enum.
-- Funcionamiento: Itera sobre cada elemento 'x' de 'xs' y le aplica 'succ', 
-- la cual retorna el sucesor de un tipo enumerable (para Int, equivale a x + 1).
listaSucc2 :: [Int] -> [Int]
listaSucc2 xs = [succ x | x <- xs]


-- Solución 3: Aplicación de sección de operador.
-- Funcionamiento: Utiliza la sección '(+1)', que es una función unaria que 
-- espera un número y le suma 1. Se aplica a cada 'x' extraído por el generador.
listaSucc3 :: [Int] -> [Int]
listaSucc3 xs = [(+1) x | x <- xs]


-- Solución 4: Indexación mediante el operador (!!).
-- Funcionamiento: Genera una lista de índices 'i' desde 0 hasta (length xs - 1).
-- Para cada índice 'i', accede al elemento en esa posición con (xs !! i) y le 
-- suma 1. 
-- Nota de eficiencia: Tiene complejidad O(n^2) porque (!!) recorre la lista 
-- desde el principio en cada acceso, a diferencia de las anteriores que son O(n).
listaSucc4 :: [Int] -> [Int]
listaSucc4 xs = [(xs !! i) + 1 | i <- [0 .. length xs - 1]]


-- ============================================================================
-- SUITE DE PRUEBAS (main23)
-- ============================================================================

-- Función auxiliar para formatear e imprimir cada caso de prueba
testFunc :: String -> ([Int] -> [Int]) -> [Int] -> [Int] -> IO ()
testFunc nombre f entrada esperado = do
    let real = f entrada
    let estado = if real == esperado then "OK" else "FALLO"
    putStrLn $ "Función:          " ++ nombre
    putStrLn $ "Valor de entrada: " ++ show entrada
    putStrLn $ "Retorno esperado: " ++ show esperado
    putStrLn $ "Retorno real:     " ++ show real ++ " [" ++ estado ++ "]"
    putStrLn "------------------------------------------------------------"

main23 :: IO ()
main23 = do
    putStrLn "============================================================"
    putStrLn "         TESTS EJERCICIO 23 - LISTAS POR COMPRENSIÓN        "
    putStrLn "============================================================"
    
    let entrada1  = [2, 4, 6, 9]
    let esperado1 = [3, 5, 7, 10]
    
    let entrada2  = [-3, -1, 0, 5]
    let esperado2 = [-2, 0, 1, 6]
    
    let entradaVacia  = []
    let esperadoVacio = []

    putStrLn "\n>>> Caso 1: Lista de naturales positivos"
    putStrLn "------------------------------------------------------------"
    testFunc "listaSucc"  listaSucc  entrada1 esperado1
    testFunc "listaSucc2" listaSucc2 entrada1 esperado1
    testFunc "listaSucc3" listaSucc3 entrada1 esperado1
    testFunc "listaSucc4" listaSucc4 entrada1 esperado1

    putStrLn "\n>>> Caso 2: Lista con negativos y cero"
    putStrLn "------------------------------------------------------------"
    testFunc "listaSucc"  listaSucc  entrada2 esperado2
    testFunc "listaSucc2" listaSucc2 entrada2 esperado2
    testFunc "listaSucc3" listaSucc3 entrada2 esperado2
    testFunc "listaSucc4" listaSucc4 entrada2 esperado2

    putStrLn "\n>>> Caso 3: Lista vacía (caso borde)"
    putStrLn "------------------------------------------------------------"
    testFunc "listaSucc"  listaSucc  entradaVacia esperadoVacio
    testFunc "listaSucc2" listaSucc2 entradaVacia esperadoVacio
    testFunc "listaSucc3" listaSucc3 entradaVacia esperadoVacio
    testFunc "listaSucc4" listaSucc4 entradaVacia esperadoVacio