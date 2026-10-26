import Data.Time (getCurrentTime, diffUTCTime)

-- =====================================================================
-- CONCEPTOS TEÓRICOS CLAVE EN ESTE CÓDIGO
-- =====================================================================
-- 1. Pattern Matching (Patrones):
--    Permite desestructurar estructuras de datos directamente en los 
--    argumentos de las funciones. En 'andRec', evaluamos por un lado 
--    el caso base para la lista vacía ([]), y por otro el caso recursivo 
--    separando la cabeza (x) de la cola (xs).
--
-- 2. Aplicación Parcial:
--    Ocurre cuando una función recibe menos argumentos de los que espera, 
--    devolviendo una nueva función que espera los argumentos restantes. 
--    Por ejemplo, en 'foldr (&&) True', la función 'foldr' recibe sólo dos 
--    de sus tres argumentos, retornando una función de tipo '[Bool] -> Bool'.
--
-- 3. foldr (Fold por la Derecha):
--    Recorre la lista de derecha a izquierda asociando los elementos con 
--    un caso base mediante una función binaria. Gracias a la evaluación 
--    perezosa de Haskell, 'foldr' puede cortocircuitar (retornar 'False' 
--    inmediatamente si encuentra un 'False') aun con listas infinitas si 
--    el operador lo permite.
--
-- 4. foldl (Fold por la Izquierda):
--    Recorre la lista de izquierda a derecha acumulando el resultado. 
--    A diferencia de 'foldr', la versión estándar de 'foldl' acumula 
--    thunks (expresiones pendientes) en memoria antes de evaluar, lo que 
--    puede generar desbordamiento de pila (stack overflow) en listas muy grandes.
--
-- 5. filter:
--    Toma un predicado (una función que retorna Bool) y una lista, devolviendo 
--    únicamente los elementos que cumplen dicho predicado.
--
-- 6. all:
--    Función de orden superior optimizada que verifica si todos los elementos 
--    de una lista satisfacen un predicado dado (en este caso usamos 'id' como 
--    identidad ya que la lista ya es de booleanos).
-- =====================================================================

-- Implementación usando foldr
andFoldr :: [Bool] -> Bool
andFoldr = foldr (&&) True

-- Implementación usando foldl
andFoldl :: [Bool] -> Bool
andFoldl = foldl (&&) True

-- Implementación usando filter y null
andFilter :: [Bool] -> Bool
andFilter xs = null (filter not xs)

-- Implementación idiomática usando all
andAll :: [Bool] -> Bool
andAll = all id

-- Implementación mediante recursión explícita y pattern matching
andRec :: [Bool] -> Bool
andRec [] = True              -- Caso base
andRec (x:xs) = x && andRec xs -- Caso inductivo

-- Función auxiliar para medir el tiempo de ejecución de una función
medirTiempo :: String -> ([Bool] -> Bool) -> [Bool] -> IO ()
medirTiempo nombre f xs = do
    inicio <- getCurrentTime
    -- Evaluamos forzando el resultado con seq para asegurar que se ejecute
    let resultado = f xs
    resultado `seq` return ()
    fin <- getCurrentTime
    putStrLn $ nombre ++ " -> Resultado: " ++ show resultado ++ " | Tiempo: " ++ show (diffUTCTime fin inicio)

main21 :: IO ()
main21 = do
    putStrLn "=== 1. CASOS BASE Y COMUNES ==="
    let listaVacia = []
    let listaTrue = [True, True, True, True]
    let listaConFalse = [True, True, False, True]
    
    putStrLn $ "andFoldr vacia: " ++ show (andFoldr listaVacia)
    putStrLn $ "andFoldr todos true: " ++ show (andFoldr listaTrue)
    putStrLn $ "andFoldr con un false: " ++ show (andFoldr listaConFalse)
    putStrLn $ "andFilter con un false: " ++ show (andFilter listaConFalse)
    putStrLn $ "andAll todos true: " ++ show (andAll listaTrue)
    putStrLn $ "andRec con un false: " ++ show (andRec listaConFalse)

    putStrLn "\n=== 2. PRUEBA DE RENDIMIENTO CON LISTAS GRANDES ==="
    -- Generamos una lista grande de 5 millones de elementos verdaderos
    let n = 5000000
    putStrLn $ "Generando lista de " ++ show n ++ " booleanos..." 
    -- Nota: para evitar desbordes con foldl en listas gigantescas, usamos una lista pura grande
    let listaGrande = replicate n True
    
    putStrLn "\nEjecutando mediciones (esto puede tardar unos segundos)..."
    medirTiempo "andFoldr" andFoldr listaGrande
    medirTiempo "andAll" andAll listaGrande
    medirTiempo "andRec" andRec listaGrande
    medirTiempo "andFilter" andFilter listaGrande
    -- Advertencia: foldl en listas muy grandes puede consumir demasiada memoria por los thunks
    medirTiempo "andFoldl" andFoldl listaGrande
    
    putStrLn "\nFin de las pruebas."