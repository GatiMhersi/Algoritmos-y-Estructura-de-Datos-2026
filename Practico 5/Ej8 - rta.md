### Ejercicio 8: Especificación de lista con todos los elementos iguales

**Perfil:**
$$f : [A] \to \text{Bool}$$

---

#### Alternativa 1 (Canónica - Contra el primer elemento)
Compara cada posición de la lista contra el elemento inicial $xs.0$.
$$f.xs \equiv \langle \forall i : 0 \le i < \#xs : xs.i = xs.0 \rangle$$

#### Alternativa 2 (Pares independientes)
Exige que cualquier par arbitrario de posiciones $(i, j)$ contenga el mismo valor.
$$f.xs \equiv \langle \forall i, j : 0 \le i < \#xs \wedge 0 \le j < \#xs : xs.i = xs.j \rangle$$

#### Alternativa 3 (Pares adyacentes contiguos)
Verifica la igualdad paso a paso entre cada elemento y su sucesor inmediato.
$$f.xs \equiv \langle \forall i : 0 \le i < \#xs - 1 : xs.i = xs.(i + 1) \rangle$$