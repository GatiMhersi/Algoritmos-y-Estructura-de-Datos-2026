esPrimo :: Int -> Bool
esPrimo x 
  | x <= 1    = False
  | otherwise = auxiliar x 2
  where
    auxiliar n i
      | i * i > n      = True          -- Si ya pasamos la raíz y no dividió, es primo
      | n `mod` i == 0 = False         -- Encontramos un divisor, no es primo
      | otherwise      = auxiliar n (i + 1) -- Probamos con el siguiente