module Ej2 where

import Ej1

{- 
   ==========================================================================
   EJERCICIO 2: Definir la función natToInt :: Nat -> Int
   ==========================================================================
   
   SOBRE TU DUDA: ¿Por qué no se puede hacer 'natToInt (n - 1)'?
   -------------------------------------------------------------
   Porque 'Nat' no pertenece a la clase de tipos 'Num' (no sabe qué es '-', '+' 
   ni los literales como '1'). En los tipos algebraicos recursivos, en lugar 
   de restar aritméticamente, "desarmamos" la estructura con Pattern Matching:
   
   Si entra 'Suc n' (el sucesor de n), el "n - 1" es simplemente 'n' (lo que 
   está adentro del constructor Suc).
-}


-- ==========================================================================
-- FORMA 1: Pattern Matching en la definición (La estándar de la cátedra)
-- ==========================================================================
natToInt :: Nat -> Int
natToInt Zero    = 0
natToInt (Suc n) = 1 + natToInt n

{- 
   TRAZA PASO A PASO (Evaluación de Forma 1):
   Supongamos que evaluamos: natToInt (Suc (Suc Zero))  [que representa el 2]

   Paso 1: natToInt (Suc (Suc Zero))
           -> Matchea con la 2da ecuación (Suc n), donde n = (Suc Zero)
           -> Reemplaza por: 1 + natToInt (Suc Zero)

   Paso 2: 1 + natToInt (Suc Zero)
           -> Evalúa natToInt (Suc Zero). Matchea con (Suc n), donde n = Zero
           -> Reemplaza por: 1 + (1 + natToInt Zero)

   Paso 3: 1 + (1 + natToInt Zero)
           -> Evalúa natToInt Zero. Matchea con la 1ra ecuación (caso base Zero)
           -> Reemplaza por: 1 + (1 + 0)

   Paso 4: Resuelve las sumas pendientes de adentro hacia afuera:
           -> 1 + 1
           -> 2
-}


-- ==========================================================================
-- FORMA 2: Usando expresiones 'case ... of'
-- ==========================================================================
{-
   EXPLICACIÓN DE SINTAXIS Y SEMÁNTICA DE 'case ... of':
   -----------------------------------------------------
   1. ¿Qué es?
      Es hacer Pattern Matching pero ADENTRO del cuerpo de la función (del 
      lado derecho del '='), en lugar de dividir la función en varios 
      renglones con el nombre repetido.

   2. Sintaxis:
      case <expresión_a_evaluar> of
        <Patrón_1> -> <resultado_1>
        <Patrón_2> -> <resultado_2>

      * Detalle clave 1: A diferencia de la definición normal que usa '=', 
        adentro del 'case' se usa la flechita '->' para separar el patrón 
        del resultado.
      * Detalle clave 2 (Indentación): Todos los patrones ('Zero', 'Suc n') 
        deben estar alineados exactamente en la misma columna vertical.

   3. Semántica (¿Cómo funciona?):
      Haskell toma la variable 'x', mira qué forma tiene y la compara de 
      arriba hacia abajo con los patrones. Cuando coincide con uno, ejecuta 
      lo que está a la derecha de su '->'.
-}
natToIntCase :: Nat -> Int
natToIntCase x = case x of
  Zero  -> 0
  Suc n -> 1 + natToIntCase n


-- ==========================================================================
-- FORMA 3: Función auxiliar ('aux'), cláusula 'where' y acumulador ('acc')
-- ==========================================================================
{-
   EXPLICACIÓN DE SINTAXIS Y SEMÁNTICA DE 'where', 'aux' y 'acc':
   --------------------------------------------------------------
   1. ¿Por qué necesitamos otra función ('aux')?
      Nuestra función principal 'natToIntAcc' tiene tipo 'Nat -> Int' (recibe 
      UN solo argumento). Pero para ir llevando la cuenta parcial paso a paso 
      como si fuera un contador, necesitamos DOS argumentos: el 'Nat' que 
      vamos desarmando y un 'Int' donde guardamos la cuenta (el acumulador).
      
      Por eso creamos una función ayudante (que por convención suele llamarse 
      'aux' o 'go', no es una palabra reservada de Haskell) que recibe ambos.

   2. ¿Qué es 'where' (Sintaxis)?
      La palabra reservada 'where' permite definir funciones o variables 
      "locales" (privadas) que solo existen y se pueden usar adentro de la 
      función principal. Así no "ensuciamos" el archivo global con funciones 
      auxiliares que nadie más va a llamar desde afuera.

   3. Semántica del Acumulador ('acc'):
      - Arrancamos llamando a 'aux x 0' (el contador empieza en 0).
      - Por cada capa de 'Suc' que quitamos, en vez de dejar un '1 +' en 
        espera como en la Forma 1, le sumamos 1 directamente al contador 
        ('acc + 1') y se lo pasamos al siguiente paso.
      - Cuando el 'Nat' llega a 'Zero', ya no queda nada por contar, así que 
        simplemente devolvemos el valor total que juntó 'acc'.
-}
natToIntAcc :: Nat -> Int
natToIntAcc x = aux x 0
  where
    -- Esta función 'aux' solo existe acá adentro gracias al 'where'
    aux :: Nat -> Int -> Int
    aux Zero    acc = acc              -- Caso base: devolvemos lo acumulado
    aux (Suc n) acc = aux n (acc + 1)  -- Caso recursivo: sacamos un Suc y sumamos 1 a acc

{- 
   TRAZA PASO A PASO (Evaluación de Forma 3 con acumulador):
   Evaluamos: natToIntAcc (Suc (Suc Zero))

   Paso 1: natToIntAcc (Suc (Suc Zero))
           -> Entra a la función principal y llama a: aux (Suc (Suc Zero)) 0

   Paso 2: aux (Suc (Suc Zero)) 0
           -> Matchea con la 2da ecuación de aux: (Suc n) acc
              donde n = (Suc Zero) y acc = 0
           -> Llama a: aux (Suc Zero) (0 + 1)  ==>  aux (Suc Zero) 1

   Paso 3: aux (Suc Zero) 1
           -> Matchea con la 2da ecuación de aux: (Suc n) acc
              donde n = Zero y acc = 1
           -> Llama a: aux Zero (1 + 1)        ==>  aux Zero 2

   Paso 4: aux Zero 2
           -> Matchea con la 1ra ecuación de aux (caso base Zero):
              donde acc = 2
           -> Devuelve directamente acc:
           -> 2
-}


-- ==========================================================================
-- TESTEO DEL CÓDIGO (main2)
-- ==========================================================================
-- Para ejecutar en GHCi:
-- 1. :l Ej2.hs
-- 2. main2

main2 :: IO ()
main2 = do
  putStrLn "=== Testeo del Ejercicio 2 (natToInt) ==="

  let cero   = Zero
  let uno    = Suc Zero
  let dos    = Suc (Suc Zero)
  let cuatro = Suc (Suc (Suc (Suc Zero)))

  putStrLn "\n1. Probando Forma 1 (Pattern Matching estandar):"
  putStrLn ("natToInt Zero             -> " ++ show (natToInt cero))
  putStrLn ("natToInt (Suc Zero)       -> " ++ show (natToInt uno))
  putStrLn ("natToInt (Suc (Suc Zero)) -> " ++ show (natToInt dos))
  putStrLn ("natToInt (4 en Nat)       -> " ++ show (natToInt cuatro))

  putStrLn "\n2. Probando que las 3 formas dan el mismo resultado para el 4:"
  putStrLn ("Forma 1 (natToInt)     -> " ++ show (natToInt cuatro))
  putStrLn ("Forma 2 (natToIntCase) -> " ++ show (natToIntCase cuatro))
  putStrLn ("Forma 3 (natToIntAcc)  -> " ++ show (natToIntAcc cuatro))