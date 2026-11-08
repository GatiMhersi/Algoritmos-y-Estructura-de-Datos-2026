module Ej6 where

import Ej5

{- |
  Ejercicio 6: Función `size` sobre Árboles Binarios (BinTree)
  Objetivo: Dado un árbol binario, retornar el número total de nodos que contiene.

  Explicación granular de la definición:
  1. `import Ej5`: Importa el módulo anterior para tener acceso al tipo de dato `BinTree`, sus constructores (`Nil`, `Node`) y los árboles de ejemplo.
  2. `size :: BinTree a -> Int`: Firma de tipo polimórfica.
     - `BinTree a`: Recibe un árbol binario cuyos elementos son de cualquier tipo `a`. No tiene restricciones de clase (como `Eq` o `Ord`) porque para contar nodos no necesitamos inspeccionar ni comparar sus valores.
     - `-> Int`: Devuelve un número entero que representa la cantidad total de nodos.
  3. `size Nil = 0`: Caso base (pattern matching sobre el constructor vacío).
     - Si el árbol es `Nil` (no tiene raíz ni subárboles), la cantidad de nodos es 0. Garantiza que la recursión termine al llegar al final de cada rama.
  4. `size (Node hi a hd) = 1 + size hi + size hd`: Caso recursivo (pattern matching sobre el constructor `Node`).
     - `(Node hi a hd)`: Desarma el árbol en su subárbol izquierdo (`hi`), el valor de la raíz (`a`) y su subárbol derecho (`hd`). (Nota: `a` también puede escribirse como `_` porque su valor no se usa en la cuenta).
     - `1`: Cuenta el nodo actual (la raíz que estamos visitando).
     - `+ size hi`: Llamada recursiva que calcula la cantidad de nodos del subárbol izquierdo.
     - `+ size hd`: Llamada recursiva que calcula la cantidad de nodos del subárbol derecho.
-}

size :: BinTree a -> Int
size Nil            = 0
size (Node hi a hd) = 1 + size hi + size hd

{- |
  Ejemplo de reducción (traza de ejecución paso a paso) en comentario:
  
  Supongamos el árbol `arbolNumeros`:
          5
         / \
        3   8
  En Haskell: Node (Node Nil 3 Nil) 5 (Node Nil 8 Nil)

  Evaluación de `size arbolNumeros`:
  size (Node (Node Nil 3 Nil) 5 (Node Nil 8 Nil))
  = 1 + size (Node Nil 3 Nil) + size (Node Nil 8 Nil)
  = 1 + (1 + size Nil + size Nil) + (1 + size Nil + size Nil)
  = 1 + (1 + 0 + 0) + (1 + 0 + 0)
  = 1 + 1 + 1
  = 3
-}

-- ============================================================================
-- Ejemplos en código y función de prueba (main6)
-- ============================================================================

-- Árbol adicional de prueba (4 nodos, desbalanceado a la derecha)
arbolDesbalanceado :: BinTree String
arbolDesbalanceado = Node Nil "Raiz" (Node (Node Nil "HijoIzq" Nil) "SubRaiz" (Node Nil "HijoDer" Nil))

-- Función principal para probar `size` con los árboles de Ej5 y Ej6 en GHCi
main6 :: IO ()
main6 = do
  putStrLn "=== Pruebas de size (Ejercicio 6) ==="
  putStrLn $ "1. size arbolVacio (esperado 0):         " ++ show (size arbolVacio)
  putStrLn $ "2. size arbolHoja (esperado 1):          " ++ show (size arbolHoja)
  putStrLn $ "3. size arbolNumeros (esperado 3):       " ++ show (size arbolNumeros)
  putStrLn $ "4. size arbolLetras (esperado 3):        " ++ show (size arbolLetras)
  putStrLn $ "5. size arbolDesbalanceado (esperado 4): " ++ show (size arbolDesbalanceado)