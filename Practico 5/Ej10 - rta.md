### Ejercicio 10: Especificación de la suma en posiciones impares

**Perfil:**
$$sumaPosImpar : [Num] \to Num$$

---

#### Alternativa 1 (Canónica - Filtro de índice en el rango)
Acumula los elementos cuyo índice cumple la condición de ser impar (índice base 0).
$$sumaPosImpar.xs = \langle \sum i : 0 \le i < \#xs \wedge i \text{ mod } 2 \neq 0 : xs.i \rangle$$

#### Alternativa 2 (Cambio de variable algebraico)
Sustituye el índice genérico por una forma explícita de impar ($2k + 1$), eliminando el operador módulo del rango.
$$sumaPosImpar.xs = \langle \sum k : 0 \le 2k + 1 < \#xs : xs.(2k + 1) \rangle$$
