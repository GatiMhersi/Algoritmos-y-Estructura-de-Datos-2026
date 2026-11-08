module Ej3 where

import Ej1

{- 
   ==========================================================================
   EJERCICIO 3: Definir la función intToNat :: Int -> Nat
   ==========================================================================
   
   FEEDBACK SOBRE TU CÓDIGO Y DETALLES IMPORTANTES:

   1. ¿Por qué acá SÍ podemos hacer 'i - 1'?
      Porque el parámetro de entrada 'i' es de tipo 'Int' (entero de Haskell), 
      y los 'Int' sí tienen definida la resta aritmética.

   2. ¡CUIDADO CON LOS PARÉNTESIS! ('intToNat i-1' vs 'intToNat (i - 1)')
      En Haskell, aplicar una función tiene MAYOR prioridad que el operador '-'.
      - Si escribís:  intToNat i - 1
        Haskell lee:  (intToNat i) - 1   --> ¡ERROR DE TIPOS! (Intenta restarle 
                                             1 a un resultado que ya es Nat).
      - Debés escribir: intToNat (i - 1) --> Primero resta los Int, y el 
                                             resultado se lo pasa a intToNat.

   3. ¿Qué pasa si nos pasan un Int negativo (ej: intToNat (-3))?
      Si solo ponemos el caso base '0', con un negativo haría -1, -2, -3... 
      infinitamente sin frenar nunca (bucle infinito). Podemos atajarlo 
      usando GUARDAS ('|') o lanzando un error.
-}


-- ==========================================================================
-- FORMA 1: Pattern Matching (Tu versión corregida con los paréntesis)
-- ==========================================================================
intToNat :: Int -> Nat
intToNat 0 = Zero
intToNat i = Suc (intToNat (i - 1))

{- 
   TRAZA PASO A PASO (Evaluación de Forma 1):
   Evaluamos: intToNat 2

   Paso 1: intToNat 2
           -> No es 0, entra en la 2da ecuación con i = 2
           -> Reemplaza por: Suc (intToNat (2 - 1))  ==>  Suc (intToNat 1)

   Paso 2: Suc (intToNat 1)
           -> Evalúa intToNat 1. Entra en la 2da ecuación con i = 1
           -> Reemplaza por: Suc (Suc (intToNat (1 - 1)))  ==>  Suc (Suc (intToNat 0))

   Paso 3: Suc (Suc (intToNat 0))
           -> Evalúa intToNat 0. Matchea con la 1ra ecuación (caso base 0)
           -> Reemplaza por: Suc (Suc Zero)
-}


-- ==========================================================================
-- FORMA 2: Usando 'case ... of' (Tu segunda versión corregida)
-- ==========================================================================
-- Nota: En Haskell conviene usar espacios en lugar de Tabulaciones (Tab) 
-- adentro del 'case' para evitar que el compilador se confunda con la alineación.
intToNat2 :: Int -> Nat
intToNat2 x = case x of
  0 -> Zero
  i -> Suc (intToNat2 (i - 1))


-- ==========================================================================
-- FORMA 3: Con función auxiliar 'aux' y acumulador (Donde te habías trabado)
-- ==========================================================================
{-
   ¿CÓMO PENSAR EL ACUMULADOR ACÁ?
   -------------------------------
   En el Ej2 queríamos devolver un 'Int', entonces el acumulador empezaba en 0 
   y hacíamos 'acc + 1'.
   
   Ahora queremos devolver un 'Nat'. Por lo tanto:
   1. Nuestro acumulador 'acc' tiene que ser de tipo 'Nat'.
   2. ¿Con qué valor inicial empieza? Con el caso base: 'Zero'.
   3. En cada paso, a medida que 'i' baja ('i - 1'), al acumulador lo 
      envolvemos en una nueva capa de 'Suc' ('Suc acc').
-}
intToNat3 :: Int -> Nat
intToNat3 x = aux x Zero
  where
    aux :: Int -> Nat -> Nat
    aux 0 acc = acc                      -- Llegamos a 0: devolvemos el Nat acumulado
    aux i acc = aux (i - 1) (Suc acc)    -- Restamos 1 a i, y envolvemos acc en un Suc

{- 
   TRAZA PASO A PASO (Evaluación de Forma 3 con acumulador):
   Evaluamos: intToNat3 2

   Paso 1: intToNat3 2
           -> Llama a: aux 2 Zero

   Paso 2: aux 2 Zero
           -> Matchea con la 2da ecuación de aux (i = 2, acc = Zero)
           -> Llama a: aux (2 - 1) (Suc Zero)       ==>  aux 1 (Suc Zero)

   Paso 3: aux 1 (Suc Zero)
           -> Matchea con la 2da ecuación de aux (i = 1, acc = Suc Zero)
           -> Llama a: aux (1 - 1) (Suc (Suc Zero)) ==>  aux 0 (Suc (Suc Zero))

   Paso 4: aux 0 (Suc (Suc Zero))
           -> Matchea con la 1ra ecuación de aux (el primer argumento es 0)
           -> Devuelve acc directamente:
           -> Suc (Suc Zero)
-}


-- ==========================================================================
-- BONUS FORMA 4: Usando Guardas ('|') para proteger contra números negativos
-- ==========================================================================
{-
   EXPLICACIÓN DE GUARDAS ('|'):
   Las guardas son como "if / else if" encadenados. Se escriben con una barra 
   vertical '|' después de los parámetros y evalúan condiciones booleanas 
   de arriba hacia abajo. 'otherwise' significa "en cualquier otro caso" (siempre True).
-}
intToNatSeguro :: Int -> Nat
intToNatSeguro i
  | i < 0     = error "No existen numeros naturales negativos"
  | i == 0    = Zero
  | otherwise = Suc (intToNatSeguro (i - 1))


-- ==========================================================================
-- TESTEO DEL CÓDIGO (main3)
-- ==========================================================================
-- Para ejecutar en GHCi:
-- 1. :l Ej3.hs
-- 2. main3

main3 :: IO ()
main3 = do
  putStrLn "=== Testeo del Ejercicio 3 (intToNat) ==="

  putStrLn "\n1. Probando Forma 1 (Pattern Matching):"
  putStrLn ("intToNat 0 -> " ++ show (intToNat 0))
  putStrLn ("intToNat 1 -> " ++ show (intToNat 1))
  putStrLn ("intToNat 2 -> " ++ show (intToNat 2))
  putStrLn ("intToNat 4 -> " ++ show (intToNat 4))

  putStrLn "\n2. Probando que las formas dan igual para el 3:"
  putStrLn ("Forma 1 (intToNat 3)       -> " ++ show (intToNat 3))
  putStrLn ("Forma 2 (intToNat2 3)      -> " ++ show (intToNat2 3))
  putStrLn ("Forma 3 (intToNat3 3)      -> " ++ show (intToNat3 3))
  putStrLn ("Forma 4 (intToNatSeguro 3) -> " ++ show (intToNatSeguro 3))