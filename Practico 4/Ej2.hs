reversa :: [a] -> [a]
reversa (x:xs) = (reversa xs)++[x]
reversa [] = []

-- Función de prueba para el Ejercicio 2 (reversa)
mainEj2 :: IO ()
mainEj2 = do
    let numeros = [1, 2, 3, 4, 5]
    let palabra = "haskell"
    let unitaria = [42]
    let vacia = [] :: [Int] -- Tipado explícito para que 'show' sepa cómo imprimir la lista vacía

    putStrLn "=== Pruebas Ejercicio 2: reversa ==="
    putStrLn $ "1. Lista de numeros [1..5] (esperado [5,4,3,2,1]): " ++ show (reversa numeros)
    putStrLn $ "2. String \"haskell\" (esperado \"lleksah\"): " ++ show (reversa palabra)
    putStrLn $ "3. Lista de un elemento [42] (esperado [42]): " ++ show (reversa unitaria)
    putStrLn $ "4. Lista vacia [] (esperado []): " ++ show (reversa vacia)