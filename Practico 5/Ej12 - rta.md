### Ejercicio 12: Especificación de la suma de los números pares de una lista

**Perfil:**
$$sumaPares : [Int] \to Int$$

---

#### Única alternativa (Sumatoria con filtro de valor en el rango)
Acumula únicamente los elementos $xs.i$ que cumplen con ser números pares.
$$sumaPares.xs = \langle \sum i : 0 \le i < \#xs \wedge xs.i \text{ mod } 2 = 0 : xs.i \rangle$$