
## Evaluación del Ejercicio 7: `(head . drop 3) "0123456"`

### 1. Paso a paso de la función `drop 3`
Definición de `drop`:
```haskell
drop 0 xs     = xs
drop _ []     = []
drop n (x:xs) = drop (n - 1) xs

```

Evaluación recursiva sobre `['0', '1', '2', '3', '4', '5', '6']`:

1. `drop 3 ('0':'1':'2':'3':'4':'5':'6')` $\rightarrow$ `drop (3 - 1) "123456"` $\rightarrow$ `drop 2 "123456"`
2. `drop 2 ('1':'2':'3':'4':'5':'6')` $\rightarrow$ `drop (2 - 1) "23456"` $\rightarrow$ `drop 1 "23456"`
3. `drop 1 ('2':'3':'4':'5':'6')` $\rightarrow$ `drop (1 - 1) "3456"` $\rightarrow$ `drop 0 "3456"`
4. `drop 0 "3456"` $\rightarrow$ `"3456"` *(Caso base)*

---

### 2. Aplicación de la función `head`

Una vez obtenido el resultado del `drop`, se evalúa la función externa `head`:


$$\text{head}\ "3456"$$

* **Resultado final:** `'3'`
* **Tipo:** `Char`

