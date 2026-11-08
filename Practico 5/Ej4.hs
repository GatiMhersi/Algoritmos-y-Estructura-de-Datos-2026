module Ej4 where

import Ej1
import Ej2
import Ej3

{- 
   ==========================================================================
   EJERCICIO 4: Definir la función sumaNat :: Nat -> Nat -> Nat
   ==========================================================================
   
   FEEDBACK SOBRE TU SOLUCIÓN CON 'natToInt' E 'intToNat':
   -------------------------------------------------------
   Tu idea:
     sumaNat n1 n2 = intToNat (natToInt n1 + natToInt n2)
   
   Funciona perfecto y demuestra que entendiste cómo componer las funciones 
   anteriores. PERO en la materia buscan que operes directamente sobre el 
   tipo inductivo 'Nat' usando Pattern Matching y recursión estructural, 
   sin pasar por 'Int' como intermediario.
   
   ¿Por qué?
   1. Eficiencia: Tu versión recorre n1 entero, recorre n2 entero, los suma 
      y después construye desde cero el resultado (3 recorridos).
   2. Concepto: La idea de los Tipos de Datos Recursivos es definir las 
      operaciones basándonos en sus constructores (Zero y Suc).
-}


-- ==========================================================================
-- FORMA 1: Recursión Estructural sobre el 1er argumento (La estándar de cátedra)
-- ==========================================================================
{-
   LÓGICA MATEMÁTICA (Axiomas de Peano):
   - Caso Base:      0 + n2       = n2
   - Caso Recursivo: (1 + n) + n2 = 1 + (n + n2)
   
   Traducido a constructores 'Zero' y 'Suc':
   - Si el primer número es 'Zero', devolver el segundo ('n2') intacto.
   - Si el primer número es 'Suc n', dejamos ese 'Suc' afuera esperando y 
     sumamos recursivamente 'n' con 'n2'.
-}
sumaNat :: Nat -> Nat -> Nat
sumaNat Zero    n2 = n2
sumaNat (Suc n) n2 = Suc (sumaNat n n2)

{- 
   TRAZA PASO A PASO (Evaluación de Forma 1):
   Supongamos que sumamos 2 + 1:
   n1 = Suc (Suc Zero)
   n2 = Suc Zero

   Paso 1: sumaNat (Suc (Suc Zero)) (Suc Zero)
           -> Matchea con la 2da ecuación: el 1er arg es (Suc n) con n = (Suc Zero)
           -> Deja un Suc afuera: Suc (sumaNat (Suc Zero) (Suc Zero))

   Paso 2: Suc (sumaNat (Suc Zero) (Suc Zero))
           -> Evalúa sumaNat (Suc Zero) (Suc Zero). Matchea con (Suc n) donde n = Zero
           -> Deja otro Suc afuera: Suc (Suc (sumaNat Zero (Suc Zero)))

   Paso 3: Suc (Suc (sumaNat Zero (Suc Zero)))
           -> Evalúa sumaNat Zero (Suc Zero). ¡Caso base! El 1er arg es Zero.
           -> Devuelve directamente el 2do arg (Suc Zero):
           -> Suc (Suc (Suc Zero))   [Que representa el 3]
-}


-- ==========================================================================
-- FORMA 2: Pasando los 'Suc' de un número al otro (Recursión de Cola natural)
-- ==========================================================================
{-
   LÓGICA (Como pasar monedas de una mano a la otra):
   En vez de dejar el 'Suc' esperando afuera, cada vez que le sacamos un 'Suc' 
   al primer número, se lo metemos adentro al segundo número:
   (1 + n) + n2  =  n + (1 + n2)
   
   Fijate que acá NO hace falta crear una función 'aux', porque 'n2' ya 
   funciona directamente como nuestro acumulador.
-}
sumaNatCola :: Nat -> Nat -> Nat
sumaNatCola Zero    n2 = n2
sumaNatCola (Suc n) n2 = sumaNatCola n (Suc n2)

{- 
   TRAZA PASO A PASO (Evaluación de Forma 2):
   Sumamos 2 + 1: sumaNatCola (Suc (Suc Zero)) (Suc Zero)

   Paso 1: sumaNatCola (Suc (Suc Zero)) (Suc Zero)
           -> Le saca un Suc al 1ro y se lo pasa al 2do:
           -> sumaNatCola (Suc Zero) (Suc (Suc Zero))

   Paso 2: sumaNatCola (Suc Zero) (Suc (Suc Zero))
           -> Le saca otro Suc al 1ro y se lo pasa al 2do:
           -> sumaNatCola Zero (Suc (Suc (Suc Zero)))

   Paso 3: sumaNatCola Zero (Suc (Suc (Suc Zero)))
           -> El 1er arg llegó a Zero (Caso base). Devuelve el 2do arg:
           -> Suc (Suc (Suc Zero))   [Representa el 3]
-}


-- ==========================================================================
-- FORMA 3: Usando 'case ... of'
-- ==========================================================================
sumaNatCase :: Nat -> Nat -> Nat
sumaNatCase n1 n2 = case n1 of
  Zero  -> n2
  Suc n -> Suc (sumaNatCase n n2)


-- ==========================================================================
-- FORMA 4: Tu versión (Usando conversión con Int como puente)
-- ==========================================================================
-- Nota: En Haskell no hacen falta paréntesis alrededor de una sola variable 
-- como 'natToInt (n1)', basta con escribir 'natToInt n1'.
sumaNatPuente :: Nat -> Nat -> Nat
sumaNatPuente n1 n2 = intToNat (natToInt n1 + natToInt n2)


-- ==========================================================================
-- TESTEO DEL CÓDIGO (main4)
-- ==========================================================================
-- Para ejecutar en GHCi:
-- 1. :l Ej4.hs
-- 2. main4

main4 :: IO ()
main4 = do
  putStrLn "=== Testeo del Ejercicio 4 (sumaNat) ==="

  let cero = Zero
  let dos  = Suc (Suc Zero)
  let tres = Suc (Suc (Suc Zero))

  putStrLn "\n1. Probando Forma 1 (Estructural estandar):"
  putStrLn ("0 + 2 (en Nat) -> " ++ show (sumaNat cero dos))
  putStrLn ("2 + 0 (en Nat) -> " ++ show (sumaNat dos cero))
  putStrLn ("2 + 3 (en Nat) -> " ++ show (sumaNat dos tres))
  putStrLn ("Verificado en Int (2 + 3): " ++ show (natToInt (sumaNat dos tres)))

  putStrLn "\n2. Comparando las 4 formas para sumar 2 + 3:"
  putStrLn ("Forma 1 (sumaNat)       -> " ++ show (sumaNat dos tres))
  putStrLn ("Forma 2 (sumaNatCola)   -> " ++ show (sumaNatCola dos tres))
  putStrLn ("Forma 3 (sumaNatCase)   -> " ++ show (sumaNatCase dos tres))
  putStrLn ("Forma 4 (sumaNatPuente) -> " ++ show (sumaNatPuente dos tres))