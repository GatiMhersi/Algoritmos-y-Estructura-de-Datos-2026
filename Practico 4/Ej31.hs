-- ==========================================
-- SOLUCIÓN 1: Condiciones explícitas (Guardas)
-- ==========================================
-- Iteramos 'x' del 1 al 5000.
-- Separamos cada condición con una coma, lo que en una lista por 
-- comprensión funciona como un "Y" lógico (AND). 'x' solo se añade 
-- a la lista resultado si cumple TODAS las condiciones a la vez.
cumpleCondicionExplicita :: [Int]
cumpleCondicionExplicita = 
  [x | x <- [1..5000], 
       x `mod` 1 == 0, 
       x `mod` 2 == 1, 
       x `mod` 3 == 2, 
       x `mod` 4 == 3, 
       x `mod` 5 == 4, 
       x `mod` 6 == 5, 
       x `mod` 7 == 6, 
       x `mod` 8 == 7, 
       x `mod` 9 == 8, 
       x `mod` 10 == 9]

-- ==========================================
-- SOLUCIÓN 2: Comparación de listas
-- ==========================================
-- Iteramos 'x' del 1 al 5000.
-- Para cada 'x', generamos una lista con los restos de dividirlo por 'y' (del 1 al 10).
-- Luego, generamos una segunda lista con los resultados esperados (y - 1).
-- Comparamos ambas listas con '=='. Si todos los elementos coinciden en orden, da True.
cumpleCondicionListas :: [Int]
cumpleCondicionListas = 
  [x | x <- [1..5000], [x `mod` y | y <- [1..10]] == [y - 1 | y <- [1..10]]]

-- ==========================================
-- SOLUCIÓN 3: Usando la función de orden superior 'all'
-- ==========================================
-- Explicación de 'all':
-- 'all' toma dos parámetros: una condición (una función que devuelve True/False) y una lista.
-- Evalúa la condición para cada elemento de la lista. Devuelve True SOLO si 
-- TODOS los elementos cumplen esa condición. Si encuentra uno solo que no, devuelve False.
-- Aquí, la condición es la función anónima (\y -> x `mod` y == y - 1), que se aplica
-- a cada elemento de la lista [1..10].
cumpleCondicionAll :: [Int]
cumpleCondicionAll = 
  [x | x <- [1..5000], all (\y -> x `mod` y == y - 1) [1..10]]


-- ==========================================
-- FUNCIÓN PRINCIPAL (MAIN)
-- ==========================================
-- Ejecuta las tres funciones y muestra los detalles requeridos por pantalla.
main31 :: IO ()
main31 = do
  putStrLn "--------------------------------------------------"
  putStrLn "       Ejecucion del Ejercicio 31"
  putStrLn "--------------------------------------------------\n"
  
  putStrLn "-> Funcion: cumpleCondicionExplicita"
  putStrLn "   Entrada: Rango [1..5000]"
  putStrLn "   Salida esperada: [2519]"
  putStrLn $ "   Salida real:     " ++ show cumpleCondicionExplicita
  putStrLn "\n--------------------------------------------------\n"
  
  putStrLn "-> Funcion: cumpleCondicionListas"
  putStrLn "   Entrada: Rango [1..5000]"
  putStrLn "   Salida esperada: [2519]"
  putStrLn $ "   Salida real:     " ++ show cumpleCondicionListas
  putStrLn "\n--------------------------------------------------\n"
  
  putStrLn "-> Funcion: cumpleCondicionAll"
  putStrLn "   Entrada: Rango [1..5000]"
  putStrLn "   Salida esperada: [2519]"
  putStrLn $ "   Salida real:     " ++ show cumpleCondicionAll
  putStrLn "\n--------------------------------------------------"