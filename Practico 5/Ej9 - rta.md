### Ejercicio 9: Especificación de lista con todos los elementos distintos

**Perfil:**
$$f : [A] \to \text{Bool}$$

---

#### Alternativa 1 (Canónica - Pares estrictamente ordenados)
Exige que para cualquier par de posiciones diferentes $i$ y $j$ (asegurando $i < j$), los contenidos sean distintos.
$$f.xs \equiv \langle \forall i, j : 0 \le i < j < \#xs : xs.i \neq xs.j \rangle$$

#### Alternativa 2 (Inyectividad lógica)
Modela la propiedad exigiendo que si dos contenidos son iguales, las posiciones deben coincidir obligatoriamente.
$$f.xs \equiv \langle \forall i, j : 0 \le i < \#xs \wedge 0 \le j < \#xs : xs.i = xs.j \implies i = j \rangle$$

#### Alternativa 3 (Negación existencial)
Niega la existencia de al menos un par de posiciones distintas que compartan el mismo valor.
$$f.xs \equiv \neg \langle \exists i, j : 0 \le i < j < \#xs : xs.i = xs.j \rangle$$