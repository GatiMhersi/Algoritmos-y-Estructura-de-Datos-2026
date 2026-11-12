### Ejercicio 11: Especificación de la suma de los elementos de una lista

**Perfil:**
$$sum : [Num] \to Num$$

---

#### Única alternativa (Cuantificador sumatoria)
Suma todos los elementos indexados de la secuencia de forma directa mediante la notación de tres partes.
$$sum.xs = \langle \sum i : 0 \le i < \#xs : xs.i \rangle$$