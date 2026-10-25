

{-
  EXPLICACIÓN DEL EJERCICIO 18 (Sucesores):
  El objetivo es retornar una lista donde cada elemento de la lista original se incremente en una unidad.
  - ¿Por qué esta solución funciona?: Utiliza la función de alto orden 'map' combinada con aplicación parcial 
    del operador de suma `(+1)`. 'map' recorre toda la estructura aplicando la función unaria a cada elemento 
    de forma independiente y devuelve una nueva lista del mismo tamaño y orden, exactamente como lo pide la cátedra.
  - Estilo Point-Free: Al escribir `listSuc = map (+1)`, se omite el argumento explícito 'xs' en ambos lados, 
    aprovechando que 'map (+1' ya es una función de tipo `[Int] -> [Int]`.

  SOLUCIÓN ALTERNATIVA (Usando expresiones lambda explícitas):
  También se puede implementar nombrando explícitamente el parámetro de la lista e invocando una función anónima:
      listSucAlt :: [Int] -> [Int]
      listSucAlt xs = map (\x -> x + 1) xs
-}

-- Versión principal en estilo point-free
listSuc :: [Int] -> [Int]
listSuc = map (+1)

-- Versión alternativa con parámetro explícito y lambda
listSucAlt :: [Int] -> [Int]
listSucAlt xs = map (\x -> x + 1) xs


-- MAIN PARA TESTEAR EL EJERCICIO 18 (Incluyendo casos límite)
main18 :: IO ()
main18 = do
    let entrada1 = [2, 4, 6, 9]
    let esperado1 = [3, 5, 7, 10]

    -- Caso límite 1: Lista vacía
    let entradaVacia = [] :: [Int]
    let esperadoVacia = [] :: [Int]

    -- Caso límite 2: Lista con números negativos y cero
    let entradaNegativos = [-5, -1, 0]
    let esperadoNegativos = [-4, 0, 1]

    putStrLn "=== TEST EJERCICIO 18: listSuc (Sucesores) ==="
    
    putStrLn "\n--- Test 1 (Ejemplo clásico de la práctica) ---"
    putStrLn $ "Entrada:              " ++ show entrada1
    putStrLn $ "Resultado esperado:   " ++ show esperado1
    putStrLn $ "Obtenido (PointFree): " ++ show (listSuc entrada1)
    putStrLn $ "Obtenido (Alternativa):" ++ show (listSucAlt entrada1)

    putStrLn "\n--- Test 2 (Caso límite: Lista vacía) ---"
    putStrLn $ "Entrada:              " ++ show entradaVacia
    putStrLn $ "Resultado esperado:   " ++ show esperadoVacia
    putStrLn $ "Obtenido:             " ++ show (listSuc entradaVacia)

    putStrLn "\n--- Test 3 (Caso límite: Negativos y cero) ---"
    putStrLn $ "Entrada:              " ++ show entradaNegativos
    putStrLn $ "Resultado esperado:   " ++ show esperadoNegativos
    putStrLn $ "Obtenido:             " ++ show (listSuc entradaNegativos)

