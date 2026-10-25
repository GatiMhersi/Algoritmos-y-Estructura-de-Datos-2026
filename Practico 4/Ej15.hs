
{-
  MINI DESCRIPCIÓN DE FILTER:
  'filter' es una función de alto orden con firma:
      filter :: (a -> Bool) -> [a] -> [a]
  Recibe un predicado (una función que devuelve un Booleano) y una lista,
  y devuelve una nueva lista que contiene únicamente los elementos que
  satisfacen dicha condición.

  EXPLICACIÓN DE LA EXPRESIÓN LAMBDA (\x -> ...):
  Una expresión lambda (comenzada con la barra invertida '\', que simula la letra griega lambda λ)
  define una función anónima, es decir, una función sin nombre que se crea "al vuelo".
  En la expresión '\x -> n `mod` x == 0', la 'x' que está a la izquierda de la flecha es el parámetro
  que la función recibe en cada iteración del 'filter' (cada elemento de la lista '[1..n]'),
  mientras que la expresión a la derecha es el cuerpo que se evalúa utilizando ese valor.

  EXPLICACIÓN DE REM (Resto) VS MOD:
  - 'rem' (remainder) y 'mod' (modulo) calculan el resto de la división entera.
  - Con números positivos (como al buscar divisores de un natural), ambos dan exactamente el mismo resultado.
  - La diferencia sutil radica en el signo cuando intervienen números negativos:
    * 'rem' tiene el signo del dividendo (el primer argumento).
    * 'mod' tiene el signo del divisor (el segundo argumento).

  FORMAS DE APLICAR EL MOD / REM EN HASKELL:
  1. Como función prefija tradicional:
     mod n x  o  rem n x
  2. Como función infija usando acentos graves (backticks):
     n `mod` x  o  n `rem` x
  3. Aplicación parcial (sección de operador):
     (n `mod`) -- Fija el dividendo a la izquierda
     (`mod` x) -- Fija el divisor a la derecha

  DIFERENTES FORMAS DE DIVISIÓN SEGÚN LOS TIPOS DE NÚMEROS:
  En [Haskell](https://www.haskell.org/), el tipo de división está estrictamente ligado al tipo de dato:
  1. División Entera Truncada (`div` / `quot`):
     - Exigen tipos de la clase `Integral` (como `Int` o `Integer`).
     - Devuelven un valor entero, descartando la parte fraccionaria.
     - Ejemplo: `div 7 2` da `3`.
  2. División Fraccionaria / Real (`/`):
     - Exige tipos de la clase `Fractional` (como `Float`, `Double` o `Rational`).
     - Devuelve un número con decimales exactos. No compila si se intenta usar con `Int`.
     - Ejemplo: `7 / 2` da `3.5`.
  3. Resto y Módulo (`mod` / `rem`):
     - Exclusivos para tipos enteros (`Integral`), fundamentales para calcular divisores, paridad, etc.
-}

-- Versión 1: Usando lambda explícita y 'mod'
listaDivisores :: Int -> [Int]
listaDivisores n = filter (\x -> n `mod` x == 0) [1..n]

-- Versión 2: Usando lambda y 'rem'
listaDivisoresRem :: Int -> [Int]
listaDivisoresRem n = filter (\x -> rem n x == 0) [1..n]


-- MAIN PARA TESTEAR EL EJERCICIO 15
main15 :: IO ()
main15 = do
    let n1 = 12
    let esperado1 = [1, 2, 3, 4, 6, 12]

    let n2 = 7
    let esperado2 = [1, 7]

    putStrLn "=== TEST EJERCICIO 15: listaDivisores ==="
    
    putStrLn "\n--- Test 1 (Divisores de 12 con mod) ---"
    putStrLn $ "Entrada (n):          " ++ show n1
    putStrLn $ "Resultado esperado:   " ++ show esperado1
    putStrLn $ "Obtenido (con mod):   " ++ show (listaDivisores n1)

    putStrLn "\n--- Test 2 (Número primo 7 con rem) ---"
    putStrLn $ "Entrada (n):          " ++ show n2
    putStrLn $ "Resultado esperado:   " ++ show esperado2
    putStrLn $ "Obtenido (con rem):   " ++ show (listaDivisoresRem n2)

main :: IO ()
main = main15