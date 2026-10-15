

# Resolución del Ejercicio 8: Análisis de Tipos en Haskell

---

## (a) `True && False`

* **Comando en `ghci`:**
```haskell
ghci> :t True && False

```


* **Salida exacta de Haskell:**
```haskell
True && False :: Bool

```


* **Explicación:** El operador lógico `&&` toma dos valores booleanos y devuelve un booleano. Como ambos operandos son de tipo `Bool`, la expresión completa evalúa y pertenece estrictamente al tipo `Bool`.

---

## (b) `sqrt 16`

* **Comando en `ghci`:**
```haskell
ghci> :t sqrt 16

```


* **Salida exacta de Haskell:**
```haskell
sqrt 16 :: Floating a => a

```


* **Explicación:** La función `sqrt` opera sobre números para calcular su raíz cuadrada. Su tipo está restringido a la clase `Floating` (números reales con coma flotante como `Float` o `Double`). La restricción de tipo `Floating a =>` indica que el resultado es polimórfico y se adaptará automáticamente al tipo flotante requerido por el contexto de ejecución.

---

## (c) `5 == 5`

* **Comando en `ghci`:**
```haskell
ghci> :t 5 == 5

```


* **Salida exacta de Haskell:**
```haskell
5 == 5 :: Bool

```


* **Explicación:** El operador de comparación por igualdad (`==`) evalúa dos expresiones del mismo tipo y emite un resultado de verdad. Dado que los números enteros pertenecen a las clases numéricas y de comparabilidad (`Eq`), el resultado definitivo de la proposición lógica es de tipo `Bool`.

---

## (d) `(2: [])`

* **Comando en `ghci`:**
```haskell
ghci> :t (2: [])

```


* **Salida exacta de Haskell:**
```haskell
(2: []) :: Num a => [a]

```


* **Explicación:** El operador de construcción de listas `:` (cons) añade un elemento al principio de una estructura preexistente. Al anteponer el entero genérico `2` (de la clase `Num`) a la lista vacía `[]`, el sistema genera una lista homogénea cuyos elementos comparten un tipo genérico `a` sujeto a la restricción numérica `Num a =>`.

---

## (e) `(++)`

* **Comando en `ghci`:**
```haskell
ghci> :t (++)

```


* **Salida exacta de Haskell:**
```haskell
(++) :: [a] -> [a] -> [a]

```


* **Explicación:** Representa al operador infijo de concatenación de listas. Su firma currificada muestra que toma dos listas sucesivas de un tipo genérico común `a` como argumentos de entrada (`[a] -> [a]`) y devuelve como salida una nueva lista combinada del mismo tipo (`-> [a]`).

---

## (f) `length [5,4,3,2,1]`

* **Comando en `ghci`:**
```haskell
ghci> :t length [5,4,3,2,1]

```


* **Salida exacta de Haskell:**
```haskell
length [5,4,3,2,1] :: Int

```


* **Explicación:** La función `length` procesa una lista finita de cualquier tipo de datos para contar el total de componentes que almacena en su interior, devolviendo de forma estándar un número entero de tipo `Int` que representa dicha magnitud.