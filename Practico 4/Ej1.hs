-- Tus definiciones
hd :: [a] -> a
hd (x:xs) = x

tl :: [a] -> [a]
tl (x:xs) = xs

lst :: [a] -> a
lst (x:[]) = x
lst (x:xs) = lst(xs)

initials :: [a] -> [a]
initials (x:[]) = []
initials (x:xs) = x:initials(xs)

-- Función principal para probar los casos
main :: IO ()
main = do
    let numeros = [10, 20, 30, 40, 50]
    let palabra = "haskell"
    let unitaria = [99]

    putStrLn "=== 1. Pruebas con lista de numeros [10, 20, 30, 40, 50] ==="
    putStrLn $ "hd (esperado 10): " ++ show (hd numeros)
    putStrLn $ "tl (esperado [20,30,40,50]): " ++ show (tl numeros)
    putStrLn $ "lst (esperado 50): " ++ show (lst numeros)
    putStrLn $ "initials (esperado [10,20,30,40]): " ++ show (initials numeros)

    putStrLn "\n=== 2. Pruebas con String \"haskell\" ==="
    putStrLn $ "hd (esperado 'h'): " ++ show (hd palabra)
    putStrLn $ "tl (esperado \"askell\"): " ++ show (tl palabra)
    putStrLn $ "lst (esperado 'l'): " ++ show (lst palabra)
    putStrLn $ "initials (esperado \"haskel\"): " ++ show (initials palabra)

    putStrLn "\n=== 3. Pruebas con lista de un elemento [99] ==="
    putStrLn $ "hd (esperado 99): " ++ show (hd unitaria)
    putStrLn $ "tl (esperado []): " ++ show (tl unitaria)
    putStrLn $ "lst (esperado 99): " ++ show (lst unitaria)
    putStrLn $ "initials (esperado []): " ++ show (initials unitaria)
