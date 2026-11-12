### Ejercicio 13: Especificación de lista ordenada de forma creciente

**Perfil:**
$$creciente : [A] \to Bool$$

---

#### Alternativa 1 (Contiguos adyacentes)
Exige que cada elemento sea menor o igual que su sucesor inmediato, asegurando el orden por transitividad.
$$creciente.xs \equiv \langle \forall i : 0 \le i < \#xs - 1 : xs.i \le xs.(i + 1) \rangle$$

#### Alternativa 2 (Todos los pares ordenados $i < j$)
Verifica de manera global que cualquier par de posiciones donde una precede a la otra mantenga el orden de sus valores.
$$creciente.xs \equiv \langle \forall i, j : 0 \le i < j < \#xs : xs.i \le xs.j \rangle$$

#### Alternativa 3 (Mediante partición de subsegmentos)
Utiliza la descomposición contigua de subsegmentos para postular que en cualquier partición donde aparezca un bloque de dos elementos adyacentes $[x, y]$, se cumpla la relación $x \le y$.
$$creciente.xs \equiv \langle \forall as, bs, x, y : xs = as ++ [x, y] ++ bs : x \le y \rangle$$