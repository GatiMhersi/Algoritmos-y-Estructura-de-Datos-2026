{- ============================================================================
   EXPLICACIÓN: LISTAS POR COMPRENSIÓN
   ============================================================================
   La sintaxis de listas por comprensión en Haskell está inspirada en la notación 
   de constructores de conjuntos en matemática (Set-builder notation).
   
   Estructura general:
   [ expresión | generador, condición1, condición2, ... ]
   
   - Expresión: Define qué elemento formará parte de la nueva lista. Puede ser
     el elemento en sí (`x`), o una transformación (`x * 2`).
   - Generador: De dónde extraemos los datos. `x <- xs` significa "toma cada
     elemento de la lista `xs` y llamalo `x`".
   - Condiciones (Guardas): Son filtros booleanos. El elemento `x` solo pasa 
     a la 'expresión' si TODAS las condiciones evalúan a True.
     
   Ejemplo del ejercicio: [x | x <- xs, even x, x > 10]
   Se lee: "La lista de todos los 'x', tal que 'x' pertenece a 'xs', 'x' es par, 
   y 'x' es estrictamente mayor a 10".

   ============================================================================
   EXPLICACIÓN: CLASES DE TIPOS Y PERFILES QUE NO FUNCIONAN
   ============================================================================
   ¿Por qué fallan ciertas firmas de tipos (perfiles) al usar mod, even o > ?

   1. FIRMA INCORRECTA 1: paresMayores :: [a] -> [a]
      - Por qué falla: El tipo 'a' es completamente polimórfico (puede ser un 
        Char, un Bool, etc.). No podemos preguntarle si es par a un caracter, 
        ni saber si es mayor a 10, porque esas operaciones no están definidas 
        para absolutamente todos los tipos.
      
   2. FIRMA INCORRECTA 2: paresMayores :: Num a => [a] -> [a]
      - Por qué falla: La typeclass 'Num' es un contrato matemático básico que 
        solo garantiza operaciones de anillo: suma (+), resta (-) y 
        multiplicación (*). NO incluye división entera ('div' / 'mod'), no 
        incluye 'even', y tampoco incluye operadores de orden ('>', '<').
        
   3. FIRMA CORRECTA A (Genérica): paresMayores :: Integral a => [a] -> [a]
      - Por qué funciona: La typeclass 'Integral' garantiza que el tipo es un 
        número entero. Esto habilita las funciones 'mod', 'div' y 'even'. 
        Además, los tipos que son 'Integral' implícitamente pertenecen a la 
        clase 'Ord', lo que permite usar comparaciones relacionales como '>'.
        
   4. FIRMA CORRECTA B (Concreta): paresMayores :: [Int] -> [Int]
      - Por qué es ideal aquí: El enunciado 25 pide textualmente "Dada una 
        lista de enteros". Usar el tipo concreto 'Int' es la solución más 
        directa y evita la sobrecarga cognitiva de las clases de tipos cuando 
        no requerimos polimorfismo extra.
============================================================================ -}


-- | SOLUCIÓN 1: La más idiomática en Haskell.
-- Utiliza la función incorporada 'even' para verificar paridad y restringe 
-- la firma al tipo concreto 'Int', cumpliendo al pie de la letra el enunciado.
paresMayoresA10_v1 :: [Int] -> [Int]
paresMayoresA10_v1 xs = [x | x <- xs, even x, x > 10]


-- | SOLUCIÓN 2: Usando aritmética modular explícita.
-- En lugar de 'even', usamos la operación de módulo (x `mod` 2 == 0).
-- Es útil si queremos controlar matemáticamente el resto de la división.
paresMayoresA10_v2 :: [Int] -> [Int]
paresMayoresA10_v2 xs = [x | x <- xs, x `mod` 2 == 0, x > 10]


-- | SOLUCIÓN 3: Usando tipo genérico 'Integral'.
-- La lógica es idéntica a la v1, pero la firma permite que la función acepte 
-- listas de 'Int', o listas de 'Integer' (enteros de precisión arbitraria).
paresMayoresA10_v3 :: Integral a => [a] -> [a]
paresMayoresA10_v3 xs = [x | x <- xs, even x, x > 10]


-- ============================================================================
-- ZONA DE PRUEBAS (main25)
-- ============================================================================

-- | Función auxiliar para ejecutar e imprimir cada test.
ejecutarPrueba25 :: (Eq a, Show a) => String -> String -> [a] -> [a] -> [a] -> IO ()
ejecutarPrueba25 nombreFuncion descripcion input esperado resultadoReal = do
    putStrLn $ "Función en uso:     " ++ nombreFuncion
    putStrLn $ "Caso de prueba:     " ++ descripcion
    putStrLn $ "Input:              " ++ show input
    putStrLn $ "Resultado esperado: " ++ show esperado
    putStrLn $ "Resultado real:     " ++ show resultadoReal
    putStrLn $ "Estado de prueba:   " ++ if resultadoReal == esperado 
                                           then "ÉXITO\n" 
                                           else "FALLO\n"

-- | Función principal para correr todas las validaciones.
main25 :: IO ()
main25 = do
    putStrLn "--- INICIANDO PRUEBAS EJERCICIO 25 ---\n"
    
    -- Prueba con la Versión 1 (Mezcla de números donde el 10 queda afuera por ser "mayor estricto")
    ejecutarPrueba25 
        "paresMayoresA10_v1" 
        "Lista mixta (evalúa paridad y > 10)" 
        [2, 10, 11, 12, 15, 20] 
        [12, 20] 
        (paresMayoresA10_v1 [2, 10, 11, 12, 15, 20])
        
    -- Prueba con la Versión 2 (Ningún elemento cumple las condiciones)
    ejecutarPrueba25 
        "paresMayoresA10_v2" 
        "Lista sin elementos que cumplan" 
        [1, 3, 5, 8, 10] 
        [] 
        (paresMayoresA10_v2 [1, 3, 5, 8, 10])
        
    -- Prueba con la Versión 3 (Manejo de negativos y ceros)
    ejecutarPrueba25 
        "paresMayoresA10_v3" 
        "Lista con números negativos y cero" 
        [-4, 0, 12, 14, 9] 
        [12, 14] 
        (paresMayoresA10_v3 [-4, 0, 12, 14, 9])