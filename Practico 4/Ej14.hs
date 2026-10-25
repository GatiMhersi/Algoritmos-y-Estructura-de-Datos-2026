
{-
  MINI DESCRIPCIÓN DE MAP:
  'map' es una función de alto orden con firma:
      map :: (a -> b) -> [a] -> [b]
  Aplica una función unaria a cada elemento de una lista de izquierda a derecha,
  generando una nueva lista resultante con el mismo tamaño y orden.

  MINI DESCRIPCIÓN DE APLICACIÓN PARCIAL:
  En Haskell todas las funciones están "currificadas". Si una función espera dos
  argumentos y se le pasa uno solo (por ejemplo, (^ 2) o (* 2)), no falla:
  devuelve una NUEVA función que espera el argumento restante. En este ejercicio,
  (^ 2) es una sección de operador que representa una función de tipo (Int -> Int).

  FORMAS DE IMPLEMENTAR EL CUADRADO Y SUS TIPOS:
  1. (x ^ 2):
     Tipo: (Num a, Integral b) => a -> b -> a
     Admite tipos enteros como exponente (Int, Integer). Sirve para listas de enteros.
  2. (\x -> x * x):
     Tipo: Num a => a -> a
     Multiplica el valor por sí mismo. No requiere operadores de potencia y sirve para
     cualquier tipo numérico (Int, Integer, Float, Double).
  3. (x ** 2):
     Tipo: Floating a => a -> a -> a
     Exclusivo para números de punto flotante (Float, Double). No compila con Int.
  4. (x ^^ 2):
     Tipo: (Fractional a, Integral b) => a -> b -> a
     Admite exponentes enteros negativos sobre números fraccionarios (ej. Rational, Float).
-}

-- VERSIÓN 1: Con parámetro explícito (xs)
-- Recibe la lista 'xs' y se la pasa directamente a 'map'.
elevarAlCuadradoExplicit :: [Int] -> [Int]
elevarAlCuadradoExplicit xs = map (^ 2) xs

-- VERSIÓN 2: Estilo point-free (sin nombrar el argumento)
-- Aprovecha la aplicación parcial: 'map (^ 2)' ya es en sí una función de tipo ([Int] -> [Int]).
elevarAlCuadradoPointFree :: [Int] -> [Int]
elevarAlCuadradoPointFree = map (^ 2)

-- Alternativa multiplicativa válida para cualquier tipo numérico:
elevarAlCuadradoMult :: [Int] -> [Int]
elevarAlCuadradoMult = map (\x -> x * x)


-- MAIN PARA TESTEAR EL EJERCICIO 14
main14 :: IO ()
main14 = do
    let entrada1 = [1, 2, 3, 4, 5]
    let esperado1 = [1, 4, 9, 16, 25]

    let entrada2 = [-3, 0, 3]
    let esperado2 = [9, 0, 9]

    let entrada3 = [] :: [Int]
    let esperado3 = [] :: [Int]

    putStrLn "=== TEST EJERCICIO 14: elevarAlCuadrado ==="
    
    putStrLn "\n--- Test 1 (Positivos consecutivos) ---"
    putStrLn $ "Entrada:            " ++ show entrada1
    putStrLn $ "Resultado esperado: " ++ show esperado1
    putStrLn $ "Obtenido (Explicit): " ++ show (elevarAlCuadradoExplicit entrada1)
    putStrLn $ "Obtenido (PointFree):" ++ show (elevarAlCuadradoPointFree entrada1)
    putStrLn $ "Obtenido (Mult):     " ++ show (elevarAlCuadradoMult entrada1)

    putStrLn "\n--- Test 2 (Negativos y cero) ---"
    putStrLn $ "Entrada:            " ++ show entrada2
    putStrLn $ "Resultado esperado: " ++ show esperado2
    putStrLn $ "Obtenido (Explicit): " ++ show (elevarAlCuadradoExplicit entrada2)
    putStrLn $ "Obtenido (PointFree):" ++ show (elevarAlCuadradoPointFree entrada2)

    putStrLn "\n--- Test 3 (Lista vacía) ---"
    putStrLn $ "Entrada:            " ++ show entrada3
    putStrLn $ "Resultado esperado: " ++ show esperado3
    putStrLn $ "Obtenido (PointFree):" ++ show (elevarAlCuadradoPointFree entrada3)

main :: IO ()
main = main14