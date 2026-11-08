module Ej1 where

{- 
   ==========================================================================
   EJERCICIO 1: Definir el tipo Nat, visto en el teórico.
   ==========================================================================
   
   EXPLICACIÓN TEÓRICA Y DUDAS RESUELTAS:
   
   1. ¿Qué son Zero y Suc? ¿Hay que definirlos aparte?
      No hace falta definirlos por separado. Al usar la palabra clave 'data', 
      estamos creando un tipo de datos algebraico nuevo llamado 'Nat' y, al 
      mismo tiempo, definiendo sus CONSTRUCTORES DE DATOS:
      
      - 'Zero': Constructor base (sin argumentos) que representa el 0.
      - 'Suc Nat': Constructor recursivo que toma un 'Nat' y representa 
        su sucesor (el siguiente número natural).
        Ejemplo: 1 = Suc Zero, 2 = Suc (Suc Zero), etc.

   2. Regla de sintaxis (Mayúsculas):
      En Haskell, tanto los nombres de tipos ('Nat') como sus constructores 
      ('Zero', 'Suc') DEBEN empezar con mayúscula. Si escribiéramos 'succ' 
      con minúscula, Haskell lo interpretaría como una variable o la función 
      predefinida 'succ', dando error de sintaxis.

   3. ¿Para qué sirve 'deriving (Show, Eq)'?
      - 'Show': Permite que GHCi convierta los valores 'Nat' a texto para 
        poder imprimirlos por pantalla.
      - 'Eq': Permite comparar dos valores 'Nat' usando '==' y '/='.
-}

-- Definición del tipo de datos recursivo Nat
data Nat = Zero | Suc Nat
  deriving (Show, Eq)


-- ==========================================================================
-- TESTEO DEL CÓDIGO (main1)
-- ==========================================================================
-- Para ejecutar este testeo en GHCi:
-- 1. Cargar el archivo con: :l Ej1.hs
-- 2. Ejecutar la función escribiendo: main1

main1 :: IO ()
main1 = do
  putStrLn "=== Testeo del Ejercicio 1 (Tipo Nat) ==="
  
  -- Definimos algunos valores de prueba usando los constructores
  let cero = Zero
  let uno  = Suc Zero
  let dos  = Suc (Suc Zero)
  let tres = Suc dos  -- También podemos construir a partir de otro Nat

  -- 1. Prueba de impresión por pantalla (gracias a deriving Show)
  putStrLn "\n1. Representacion de valores Nat:"
  putStrLn ("El 0 se representa como: " ++ show cero)
  putStrLn ("El 1 se representa como: " ++ show uno)
  putStrLn ("El 2 se representa como: " ++ show dos)
  putStrLn ("El 3 se representa como: " ++ show tres)

  -- 2. Prueba de comparación de igualdad (gracias a deriving Eq)
  putStrLn "\n2. Pruebas de igualdad (Eq):"
  putStrLn ("¿Suc Zero es igual a Uno? -> " ++ show (Suc Zero == uno))
  putStrLn ("¿Zero es igual a Suc Zero? -> " ++ show (cero == uno))
  putStrLn ("¿Suc (Suc Zero) es igual a Dos? -> " ++ show (Suc (Suc Zero) == dos))