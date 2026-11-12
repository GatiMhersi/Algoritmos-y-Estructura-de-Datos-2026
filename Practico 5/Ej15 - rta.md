### Ejercicio 15: Especificación de existencia de un elemento igual a la suma del resto

**Perfil:**
$$P : [Num] \to Bool$$

---

#### Alternativa 1 (Exclusión directa de índice en la sumatoria)
Exige que exista al menos una posición $i$ donde el valor del elemento $xs.i$ coincida exactamente con la suma de todos los elementos $xs.j$ excluyendo a la propia posición ($j \neq i$).
$$P.xs \equiv \langle \exists i : 0 \le i < \#xs : xs.i = \langle \sum j : 0 \le j < \#xs \wedge j \neq i : xs.j \rangle \rangle$$

#### Alternativa 2 (Caracterización global por el doble del valor)
Aprovecha la propiedad algebraica de que restar un término de la suma total equivale a verificar si el doble del elemento especial es igual a la suma de toda la lista ($2 \cdot xs.i = sum.xs$).
$$P.xs \equiv \langle \exists i : 0 \le i < \#xs : 2 \cdot xs.i = \langle \sum j : 0 \le j < \#xs : xs.j \rangle \rangle$$

#### Alternativa 3 (Descomposición estructural en subsegmentos)
Modela la existencia aislando el elemento en un bloque central de tamaño unitario $[x]$, rodeado por un prefijo $as$ y un sufijo $bs$, y planteando que dicho elemento sea igual a la suma de las sumas de ambas porciones.
$$P.xs \equiv \langle \exists as, bs, x : xs = as ++ [x] ++ bs : x = sum.as + sum.bs \rangle$$