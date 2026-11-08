module Ej5 where

{- |
  Ejercicio 5: Definición de Árboles Binarios (BinTree)
  
  Explicación granular de la estructura:
  1. `data`: Palabra reservada en Haskell para declarar un nuevo tipo de dato algebraico (siempre en minúscula).
  2. `BinTree a`: Constructor de tipo polimórfico. La variable de tipo `a` indica que el árbol puede almacenar elementos de cualquier tipo (Int, Char, String, etc.), siempre que todos los nodos del mismo árbol sean del mismo tipo.
  3. `=`: Separa el nombre del tipo de sus constructores de datos (valores).
  4. `Nil`: Constructor constante (caso base). Representa un árbol binario vacío (sin nodos ni ramas).
  5. `|`: Operador de alternativa (disyunción) que separa los distintos constructores del tipo.
  6. `Node (BinTree a) a (BinTree a)`: Constructor recursivo que toma tres argumentos en orden:
     - Primer `(BinTree a)`: El subárbol izquierdo (definición recursiva).
     - `a`: El valor o dato almacenado en la raíz de este nodo.
     - Segundo `(BinTree a)`: El subárbol derecho (definición recursiva).
  7. `deriving (Show, Eq)`: Permite que Haskell convierta automáticamente el árbol a texto para imprimirlo en consola (`Show`) y comparar si dos árboles son iguales (`Eq`).
-}

data BinTree a = Nil | Node (BinTree a) a (BinTree a)
  deriving (Show, Eq)

{- |
  Ejemplo visual y en comentario:
  
  1. Árbol vacío:
     Representación: (vacío)
     En Haskell:     Nil

  2. Árbol con un solo elemento (Hoja con valor 10):
     Representación:
          10
         /  \
       Nil  Nil
     En Haskell:     Node Nil 10 Nil

  3. Árbol binario con 3 elementos:
     Representación gráfica:
          5
         / \
        3   8
       / \ / \
      N  N N  N   (donde N = Nil)
      
     En Haskell:
     Node (Node Nil 3 Nil) 5 (Node Nil 8 Nil)
-}

-- ============================================================================
-- Ejemplos en código y función de prueba (main5)
-- ============================================================================

-- Ejemplo 1: Árbol vacío de enteros
arbolVacio :: BinTree Int
arbolVacio = Nil

-- Ejemplo 2: Árbol de un solo nodo (hoja)
arbolHoja :: BinTree Int
arbolHoja = Node Nil 10 Nil

-- Ejemplo 3: Árbol con raíz 5, hijo izquierdo 3 e hijo derecho 8
arbolNumeros :: BinTree Int
arbolNumeros = Node (Node Nil 3 Nil) 5 (Node Nil 8 Nil)

-- Ejemplo 4: Árbol desbalanceado de caracteres ('A' en la raíz, 'B' a la izquierda, 'C' a la derecha de 'B')
arbolLetras :: BinTree Char
arbolLetras = Node (Node Nil 'B' (Node Nil 'C' Nil)) 'A' Nil

-- Función principal para probar e imprimir los ejemplos en GHCi
main5 :: IO ()
main5 = do
  putStrLn "=== Ejemplos de BinTree (Ejercicio 5) ==="
  putStrLn $ "1. Arbol vacio:     " ++ show arbolVacio
  putStrLn $ "2. Arbol hoja:      " ++ show arbolHoja
  putStrLn $ "3. Arbol numeros:   " ++ show arbolNumeros
  putStrLn $ "4. Arbol letras:    " ++ show arbolLetras