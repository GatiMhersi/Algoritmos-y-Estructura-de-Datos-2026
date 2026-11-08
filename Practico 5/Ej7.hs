module Ej7 where

import Ej5
import Ej6 (size, arbolDesbalanceado)

{- |
  Ejercicio 7: Función `height` sobre Árboles Binarios (BinTree)
  Objetivo: Dado un árbol binario, retornar la altura del mismo.

  ============================================================================
  1. Conceptos clave y dudas frecuentes sobre la altura (`height`)
  ============================================================================
  - ¿Qué es la altura de un árbol?:
    Es la cantidad de nodos (o niveles) que componen el CAMINO MÁS LARGO
    desde la raíz hasta una hoja.

  - ¿Los constructores `Nil` cuentan en la altura?:
    NO suman altura. Un árbol vacío (`Nil`) representa la ausencia de nodos,
    por lo que su altura es 0. Una hoja (ej. `Node Nil 10 Nil`) tiene dos `Nil`
    debajo de altura 0 y suma 1 por su propio nodo, dando altura 1.

  - ¿Cómo se calcula en árboles desbalanceados?:
    Cuando una rama es más profunda que la otra, en cada nodo debemos elegir
    el camino más largo entre el subárbol izquierdo y el derecho usando la
    función `max`. El camino más corto queda descartado en ese nivel.

  ============================================================================
  2. Relación y diferencias entre `size` (Ej. 6) y `height` (Ej. 7)
  ============================================================================
  Ambas funciones recorren toda la estructura del árbol con el mismo esquema
  de recursión estructural, pero responden preguntas distintas:
  
  - `size` (Cantidad total / Acumulación):
    Suma los nodos de AMBOS lados: `1 + size hi + size hd`.
    Importa el volumen total del árbol sin importar cómo estén distribuidos.

  - `height` (Profundidad máxima / Selección):
    Compara ambos lados y elige el MAYOR: `max (1 + height hi) (1 + height hd)`.
    Importa qué tan profundo llega el árbol en su rama más larga.

  - Propiedad matemática que las relaciona:
    En todo árbol binario `t` se cumple que: `height t <= size t`.
    * Caso extremo 1 (Árbol degenerado / "lista"): Todos los nodos tienen un
      solo hijo. Aquí la altura es igual a la cantidad de nodos (`height t == size t`).
    * Caso extremo 2 (Árbol perfectamente balanceado): Los nodos se reparten
      equitativamente a izquierda y derecha, logrando la menor altura posible
      para esa cantidad de nodos (crecimiento logarítmico).

  ============================================================================
  3. Explicación granular de la definición en Haskell
  ============================================================================
  1. `height :: BinTree a -> Int`: Firma polimórfica. Recibe un árbol de
     cualquier tipo `a` y devuelve un entero `Int`.
  2. `height Nil = 0`: Caso base. Un árbol vacío tiene 0 niveles de altura.
  3. `height (Node hi _ hd) = max (1 + height hi) (1 + height hd)`: Caso recursivo.
     - `(Node hi _ hd)`: Hace pattern matching usando el constructor de valor
       `Node` (no confundir con el constructor de tipo `BinTree`). Extrae el
       hijo izquierdo (`hi`), ignora el valor de la raíz con el comodín (`_`)
       y extrae el hijo derecho (`hd`).
     - `1 + height hi`: Calcula la altura si tomamos el camino izquierdo.
     - `1 + height hd`: Calcula la altura si tomamos el camino derecho.
     - `max (...) (...)`: Se queda con el mayor de los dos caminos.
     (Nota: Matemáticamente equivale a escribir `1 + max (height hi) (height hd)`).
-}

height :: BinTree a -> Int
height Nil            = 0
height (Node hi _ hd) = max (1 + height hi) (1 + height hd)

{- |
  Ejemplo de reducción (traza paso a paso) en un árbol desbalanceado:

  Tomemos `arbolLetras` definido en Ej5:
        'A'          <-- Nivel 1
        / \
      'B'  Nil       <-- Nivel 2
      / \
    Nil 'C'          <-- Nivel 3
        / \
      Nil Nil        <-- Base (Altura 0)

  En Haskell: Node (Node Nil 'B' (Node Nil 'C' Nil)) 'A' Nil

  Evaluación de `height arbolLetras`:
  height (Node (Node Nil 'B' (Node Nil 'C' Nil)) 'A' Nil)
  = max (1 + height (Node Nil 'B' (Node Nil 'C' Nil))) (1 + height Nil)
  = max (1 + max (1 + height Nil) (1 + height (Node Nil 'C' Nil))) (1 + 0)
  = max (1 + max (1 + 0) (1 + max (1 + height Nil) (1 + height Nil))) 1
  = max (1 + max 1 (1 + max (1 + 0) (1 + 0))) 1
  = max (1 + max 1 (1 + max 1 1)) 1
  = max (1 + max 1 (1 + 1)) 1
  = max (1 + max 1 2) 1
  = max (1 + 2) 1
  = max 3 1
  = 3
-}

-- ============================================================================
-- Función de prueba comparando height vs size (main7)
-- ============================================================================

main7 :: IO ()
main7 = do
  putStrLn "=== Pruebas de height y comparacion con size (Ejercicio 7) ==="
  
  putStrLn "\n1. Arbol Vacio:"
  putStrLn $ "   height (esperado 0): " ++ show (height arbolVacio) ++ " | size: " ++ show (size arbolVacio)
  
  putStrLn "\n2. Arbol Hoja (1 solo nodo):"
  putStrLn $ "   height (esperado 1): " ++ show (height arbolHoja) ++ " | size: " ++ show (size arbolHoja)
  
  putStrLn "\n3. Arbol Numeros (Balanceado - 3 nodos en 2 niveles):"
  putStrLn $ "   height (esperado 2): " ++ show (height arbolNumeros) ++ " | size: " ++ show (size arbolNumeros)
  
  putStrLn "\n4. Arbol Letras (Degenerado/En cadena - 3 nodos en 3 niveles):"
  putStrLn $ "   height (esperado 3): " ++ show (height arbolLetras) ++ " | size: " ++ show (size arbolLetras)
  
  putStrLn "\n5. Arbol Desbalanceado (4 nodos repartidos en 3 niveles):"
  putStrLn $ "   height (esperado 3): " ++ show (height arbolDesbalanceado) ++ " | size: " ++ show (size arbolDesbalanceado)