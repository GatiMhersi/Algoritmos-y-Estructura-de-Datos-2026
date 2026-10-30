{-
  EJERCICIO 30 - PRODUCTO CARTESIANO DE DOS LISTAS
  
  Contexto: El producto cartesiano es la base de la combinación de conjuntos.
  En Haskell, las listas por comprensión con múltiples generadores están 
  diseñadas específicamente para emular esta notación matemática. 
  Aunque la solución original es la óptima, evaluar alternativas nos ayuda 
  a comprender cómo el lenguaje itera y procesa (hace "desugaring") 
  estas expresiones por debajo.
-}

module Ejercicio30 where

-- =====================================================================
-- 1. Solución Canónica (La tuya)
-- =====================================================================
{-
  Es la traducción directa de la matemática al código.
  - Bucle externo: `x <- xs` (toma el primer elemento de xs).
  - Bucle interno: `y <- ys` (itera sobre todos los de ys).
  Retorna la tupla `(x,y)`.
-}
prodcart :: [Int] -> [Int] -> [(Int, Int)]
prodcart xs ys = [(x,y) | x <- xs, y <- ys]


-- =====================================================================
-- 2. Inversión de Generadores (Cambio de pivote)
-- =====================================================================
{-
  Acá cambiamos el orden de evaluación.
  Al poner `y <- ys` primero, este se convierte en el bucle externo.
  El resultado matemático es un producto cartesiano válido (tiene los mismos 
  elementos), pero el orden de salida cambia radicalmente. En vez de 
  agrupar por los elementos de `xs`, agrupa por los elementos de `ys`.
-}
prodcart_invertido :: [Int] -> [Int] -> [(Int, Int)]
prodcart_invertido xs ys = [(x,y) | y <- ys, x <- xs]


-- =====================================================================
-- 3. Comprensión Anidada (Exponiendo la arquitectura subyacente)
-- =====================================================================
{-
  Cuando Haskell ve `x <- xs, y <- ys`, por debajo hace un anidamiento.
  Acá lo hacemos a mano:
  1. `[ [(x,y) | y <- ys] | x <- xs ]` genera una lista donde cada 
     elemento es, a su vez, una lista con las combinaciones de un `x` 
     con todos los `y`. (Ej: [[(2,4),(2,5)], [(3,4),(3,5)]]).
  2. `concat` aplana esa estructura de listas de listas en una sola 
     lista unidimensional plana.
-}
prodcart_anidado :: [Int] -> [Int] -> [(Int, Int)]
prodcart_anidado xs ys = concat [ [(x, y) | y <- ys] | x <- xs ]


-- =====================================================================
-- ZONA DE PRUEBAS (main30)
-- =====================================================================

test :: String -> ([Int] -> [Int] -> [(Int, Int)]) -> [Int] -> [Int] -> [(Int, Int)] -> IO ()
test nombre funcion xs ys esperado = do
    putStrLn $ "--- Ejecutando: " ++ nombre ++ " ---"
    putStrLn $ "Input xs:        " ++ show xs
    putStrLn $ "Input ys:        " ++ show ys
    putStrLn $ "Output Esperado: " ++ show esperado
    putStrLn $ "Output Real:     " ++ show (funcion xs ys)
    putStrLn ""

main30 :: IO ()
main30 = do
    let xs = [2, 3]
    let ys = [4, 5, 6]
    
    -- El resultado del PDF para la solución canónica
    let resultadoEsperado = [(2,4),(2,5),(2,6), (3,4),(3,5),(3,6)]
    
    -- El resultado esperado para la versión invertida (fijate que pivotea sobre ys)
    let resultadoInvertido = [(2,4),(3,4), (2,5),(3,5), (2,6),(3,6)]
    
    putStrLn "========================================================="
    putStrLn "       TESTING: EJERCICIO 30 (Producto Cartesiano)       "
    putStrLn "=========================================================\n"
    
    test "Solucion Canonica (Coma y generadores)" prodcart xs ys resultadoEsperado
    test "Solucion Invertida (Cambio de orden interno)" prodcart_invertido xs ys resultadoInvertido
    test "Solucion Anidada (Con concat)" prodcart_anidado xs ys resultadoEsperado