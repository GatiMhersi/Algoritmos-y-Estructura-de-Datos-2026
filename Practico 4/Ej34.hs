-- ============================================================================
-- EJERCICIO 34: Suma de la suma de todos los segmentos iniciales (sumaSeg)
-- ============================================================================

{- 
1. ¿QUÉ ES UN SEGMENTO INICIAL (PREFIJO)?
   Dada una lista como [1, 2, 3], sus segmentos iniciales son todas las sublistas
   que comienzan desde el principio (incluyendo la lista vacía):
   - i = 0 -> []        (suma = 0)
   - i = 1 -> [1]       (suma = 1)
   - i = 2 -> [1, 2]    (suma = 3)
   - i = 3 -> [1, 2, 3] (suma = 6)
   La suma total de las sumas de cada segmento es: 0 + 1 + 3 + 6 = 10.

2. COSAS IMPORTANTES A TENER EN CUENTA EN LISTAS POR COMPRENSIÓN:
   
   a) Orden de evaluación y alcance (Scope) de izquierda a derecha:
      Los generadores y definiciones locales se evalúan estrictamente de izquierda 
      a derecha. Una variable definida en un generador (ej. 'i <- [0 .. length xs]') 
      SOLO puede usarse en los generadores, guardas o expresiones que estén a su 
      DERECHA (o en la expresión principal a la izquierda de '|').
      - INCORRECTO: [sum as | (as, bs) <- ..., i <- [0 .. length xs]] ('i' no existe aún).
      - CORRECTO  : [sum as | i <- [0 .. length xs], let (as, bs) = ...] ('i' ya existe).

   b) Diferencia entre generador (<-) y definición local (let):
      - El operador '<-' extrae elementos de una LISTA (tipo [t]). No puede usarse 
        directamente con 'splitAt i xs' porque 'splitAt' devuelve una única tupla 
        ([a], [a]), no una lista de tuplas [([a], [a])].
      - Para capturar o desestructurar un valor único dentro de la comprensión 
        sin recorrer una lista, se utiliza 'let patron = expresion' (sin 'in').

   c) Uso del comodín (_) en Pattern Matching:
      Cuando desestructuramos la tupla (as, bs) pero solo necesitamos el segmento 
      inicial 'as', escribimos '(as, _)'. El guion bajo evita advertencias de 
      variables no utilizadas y deja claro que el sufijo se descarta.
-}

-- Nota: Si tenés el Ejercicio 33 en el mismo archivo, podés borrar esta línea auxiliar.
-- Se incluye acá para que la Versión 1 funcione de forma autónoma si lo probás aparte.
split2Aux :: [a] -> [([a], [a])]
split2Aux xs = [splitAt i xs | i <- [0 .. length xs]]


-- ----------------------------------------------------------------------------
-- VERSIÓN 1: Reutilizando split2 y Pattern Matching en el generador
-- ----------------------------------------------------------------------------
-- Funcionamiento:
-- 1. Generador: '(as, _) <- split2Aux xs' toma una por una cada tupla generada por 
--    split2. Mediante pattern matching, liga el prefijo a 'as' e ignora el sufijo.
-- 2. Expresión: 'sum as' calcula la suma de ese segmento inicial en particular.
-- 3. 'sum' externo: Suma todos los resultados parciales obtenidos en la lista.
sumaSegV1 :: [Int] -> Int
sumaSegV1 xs = sum [sum as | (as, _) <- split2Aux xs]


-- ----------------------------------------------------------------------------
-- VERSIÓN 2: Independiente usando take e índices
-- ----------------------------------------------------------------------------
-- Funcionamiento:
-- 1. Generador: 'i <- [0 .. length xs]' genera todas las longitudes posibles de 
--    prefijos, desde 0 elementos (lista vacía) hasta la lista completa.
-- 2. Expresión: 'sum (take i xs)' toma los primeros 'i' elementos y los suma.
-- 3. 'sum' externo: Totaliza las sumas de cada prefijo sin crear tuplas intermedias.
sumaSegV2 :: [Int] -> Int
sumaSegV2 xs = sum [sum (take i xs) | i <- [0 .. length xs]]


-- ----------------------------------------------------------------------------
-- VERSIÓN 3: Con splitAt y ligadura local 'let' (Tu idea original corregida)
-- ----------------------------------------------------------------------------
-- Funcionamiento:
-- 1. Generador: Primero 'i <- [0 .. length xs]' define el índice de corte 'i'.
-- 2. Ligadura local: 'let (as, _) = splitAt i xs' ejecuta 'splitAt' con el 'i' ya 
--    definido y desestructura la tupla resultante quedándose con 'as'.
-- 3. Expresión y suma externa: Calcula 'sum as' para cada corte y suma el total.
sumaSegV3 :: [Int] -> Int
sumaSegV3 xs = sum [sum as | i <- [0 .. length xs], let (as, _) = splitAt i xs]


-- ============================================================================
-- EJECUCIÓN Y CASOS DE PRUEBA EN CONSOLA
-- ============================================================================

-- Función auxiliar para imprimir cada caso de prueba de forma clara
ejecutarPrueba34 :: String -> [Int] -> Int -> IO ()
ejecutarPrueba34 descripcion lista esperado = do
    putStrLn $ "--- " ++ descripcion ++ " ---"
    putStrLn $ "Caso a evaluar : Lista = " ++ show lista
    putStrLn $ "Valor esperado : " ++ show esperado
    putStrLn $ "Resultado V1 (Con split2)      : " ++ show (sumaSegV1 lista)
    putStrLn $ "Resultado V2 (Con take)        : " ++ show (sumaSegV2 lista)
    putStrLn $ "Resultado V3 (Con let splitAt) : " ++ show (sumaSegV3 lista)
    putStrLn ""

-- Función principal para correr todas las pruebas escribiendo 'main34' en GHCi
main34 :: IO ()
main34 = do
    putStrLn "============================================================"
    putStrLn "          PRUEBAS EJERCICIO 34 - FUNCIÓN SUMASEG            "
    putStrLn "============================================================\n"
    
    -- Segmentos: [] (0) + [1] (1) + [1,2] (3) + [1,2,3] (6) = 10
    ejecutarPrueba34 "Prueba 1: Ejemplo de la guía [1, 2, 3]" [1, 2, 3] 10
    
    -- Segmentos: [] (0) = 0
    ejecutarPrueba34 "Prueba 2: Caso borde - Lista vacía" [] 0
    
    -- Segmentos: [] (0) + [5] (5) = 5
    ejecutarPrueba34 "Prueba 3: Un solo elemento [5]" [5] 5
    
    -- Segmentos: [] (0) + [10] (10) + [10,-5] (5) + [10,-5,2] (7) = 22
    ejecutarPrueba34 "Prueba 4: Con números negativos [10, -5, 2]" [10, -5, 2] 22
    
    -- Segmentos: [] (0) + [1] (1) + [1,1] (2) + [1,1,1] (3) + [1,1,1,1] (4) = 10
    ejecutarPrueba34 "Prueba 5: Elementos repetidos [1, 1, 1, 1]" [1, 1, 1, 1] 10
    
    putStrLn "============================================================"