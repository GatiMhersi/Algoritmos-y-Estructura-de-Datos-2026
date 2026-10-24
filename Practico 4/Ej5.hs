module Ej5 (esPrimo1) where

import System.CPUTime (getCPUTime)
import Control.Exception (evaluate)
import Text.Printf (printf)

-- =========================================================================
-- 1. RECURSIÓN CON CORTE EN RAÍZ CUADRADA (Óptima en rendimiento)
-- -------------------------------------------------------------------------
-- * Complejidad Temporal: O(√n) en el peor caso (cuando n es primo).
-- * Complejidad Espacial: O(1) — recursión de cola (tail recursion), GHC la
--   compila a un bucle directo en memoria sin gastar stack ni crear listas.
-- * Ventaja: Es abismalmente más rápida para primos grandes. Por ejemplo,
--   para n = 10.000.019 hace ~3.162 iteraciones en vez de 10 millones.
-- =========================================================================
esPrimo1 :: Int -> Bool
esPrimo1 x 
  | x <= 1    = False
  | otherwise = auxiliar x 2
  where
    auxiliar n i
      | i * i > n      = True
      | n `mod` i == 0 = False
      | otherwise      = auxiliar n (i + 1)


-- =========================================================================
-- 2. LISTA POR COMPRENSIÓN + NULL (Idiomática y declarativa)
-- -------------------------------------------------------------------------
-- * Complejidad Temporal: O(n) en el peor caso (primos); O(1) mejor caso (pares).
-- * Complejidad Espacial: O(1) gracias a la evaluación perezosa (lazy evaluation).
-- * Detalle clave: No genera toda la lista en memoria. `null` solo pide el
--   primer elemento; apenas aparece un divisor, corta la ejecución. Si es
--   primo, sí recorre desde 2 hasta n-1.
-- =========================================================================
esPrimo2 :: Int -> Bool
esPrimo2 n = n > 1 && null [ x | x <- [2 .. n-1], mod n x == 0 ]


-- =========================================================================
-- 3. MODULAR CON DIVISORES (Más declarativa y reutilizable)
-- -------------------------------------------------------------------------
-- * Complejidad Temporal: O(n) cuando es primo.
-- * Complejidad Espacial: O(1) acotado por la comparación perezosa con [1, n].
-- * Detalle clave: Al comparar `divisoresPP3 n == [1, n]`, Haskell compara
--   elemento a elemento: el 1 coincide, y en cuanto aparece un divisor menor
--   a n (ej. el 2), ve que `2 /= n` y corta devolviendo False sin calcular
--   el resto de los divisores. Además, no necesita guarda para negativos o 1.
-- =========================================================================
divisoresPP3 :: Int -> [Int]
divisoresPP3 n = [ x | x <- [1 .. n], mod n x == 0 ]

esPrimo3 :: Int -> Bool
esPrimo3 n = divisoresPP3 n == [1, n]


-- =========================================================================
-- 4. RECURSIÓN LINEAL SIN LISTAS (Estilo Práctica 1 / 2)
-- -------------------------------------------------------------------------
-- * Complejidad Temporal: O(n) en el peor caso (recorre hasta n-1).
-- * Complejidad Espacial: O(1) por recursión de cola.
-- * Detalle clave: Hace exactamente los mismos pasos aritméticos que esPrimo2
--   y esPrimo3, pero evita el pequeño overhead de construir nodos de lista
--   ([2..n-1]), por lo que en tiempo bruto es un poco más rápida que la 2 y 3.
-- =========================================================================
esPrimo4 :: Int -> Bool
esPrimo4 n = n > 1 && noTieneDivisores n 2

noTieneDivisores :: Int -> Int -> Bool
noTieneDivisores n i
  | i >= n         = True
  | mod n i == 0   = False
  | otherwise      = noTieneDivisores n (i + 1)


-- =========================================================================
-- HERRAMIENTAS DE MEDICIÓN Y MAIN
-- =========================================================================

-- Mide el tiempo de evaluación estricta de una expresión en microsegundos (us)
medir :: String -> (Int -> Bool) -> Int -> IO ()
medir nombre f n = do
  inicio <- getCPUTime
  resultado <- evaluate (f n) -- evaluate fuerza a Haskell a calcular el Bool ahora
  fin <- getCPUTime
  let microsegundos = fromIntegral (fin - inicio) / (10^6 :: Double)
  printf "  %-10s -> Resultado: %-5s | Tiempo: %9.2f us\n" nombre (show resultado) microsegundos

probarNumero :: String -> Int -> IO ()
probarNumero descripcion n = do
  putStrLn $ "\n------------------------------------------------------------"
  putStrLn $ "Caso: " ++ descripcion ++ " (n = " ++ show n ++ ")"
  putStrLn $ "------------------------------------------------------------"
  medir "esPrimo1" esPrimo1 n
  medir "esPrimo2" esPrimo2 n
  medir "esPrimo3" esPrimo3 n
  medir "esPrimo4" esPrimo4 n

main :: IO ()
main = do
  putStrLn "=== TEST DE CORRECCIÓN EN CASOS BORDE ==="
  let bordes = [-5, 0, 1, 2, 3, 4, 9, 17]
  putStrLn $ "Casos probados: " ++ show bordes
  putStrLn $ "esPrimo1:       " ++ show (map esPrimo1 bordes)
  putStrLn $ "esPrimo2:       " ++ show (map esPrimo2 bordes)
  putStrLn $ "esPrimo3:       " ++ show (map esPrimo3 bordes)
  putStrLn $ "esPrimo4:       " ++ show (map esPrimo4 bordes)

  putStrLn "\n=== BENCHMARK DE VELOCIDAD Y COMPORTAMIENTO ==="
  
  -- Caso 1: Compuesto par enorme (Mejor caso: corta en i = 2)
  probarNumero "Compuesto par grande (Mejor caso - Cortocircuito en 2)" 10000000

  -- Caso 2: Compuesto impar con divisor chico (Corta rápido en i = 3)
  probarNumero "Compuesto impar (Cortocircuito en 3)" 9999999

  -- Caso 3: Cuadrado de un primo grande (Peor caso para un número compuesto)
  -- 3163 * 3163 = 10004569 (su primer divisor propio es recién 3163)
  probarNumero "Compuesto difícil (3163^2, primer divisor en 3163)" 10004569

  -- Caso 4: Número primo grande (Peor caso absoluto: recorre todo el rango)
  probarNumero "Primo grande (Peor caso: obliga a recorrer todo)" 1000003