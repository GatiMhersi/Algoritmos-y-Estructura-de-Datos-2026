### Ejercicio 14: Especificación de la función mínimo

**Perfil:**
$$min : [Num] \to Num \quad (\text{para } \#xs > 0)$$

---

#### Alternativa 1 (Cuantificador Min directo)
Extrae directamente el menor valor contenido entre los índices de la secuencia.
$$min.xs = \langle Min \ i : 0 \le i < \#xs : xs.i \rangle$$

#### Alternativa 2 (Caracterización lógica por pertenencia y cota inferior)
Define implícitamente el mínimo exigiendo que $m$ sea un elemento perteneciente a la lista y, simultáneamente, una cota inferior menor o igual a todos los demás elementos.
$$min.xs = m \iff \left(\langle \exists i : 0 \le i < \#xs : m = xs.i \rangle \wedge \langle \forall i : 0 \le i < \#xs : m \le xs.i \rangle\right)$$