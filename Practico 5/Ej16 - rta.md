### Ejercicio 16: Longitud del subsegmento más largo de ceros

**Perfil:**
$$maxCeros : [Int] \to Int$$

---

#### Alternativa 1 (Cuantificador Max sobre ternas de subsegmentos)
Utiliza la descomposición canónica de subsegmentos ($xs = as ++ bs ++ cs$) para evaluar la longitud $\#bs$ de todas las porciones continuas cuyos elementos cumplen con ser todos ceros.
$$maxCeros.xs = \langle Max \ as, bs, cs : xs = as ++ bs ++ cs \wedge \langle \forall i : 0 \le i < \#bs : bs.i = 0 \rangle : \#bs \rangle$$

#### Alternativa 2 (Predicado modular de homogeneidad)
Reemplaza la condición interna por un predicado auxiliar de apoyo que evalúa si el subsegmento está compuesto íntegramente por ceros.
$$maxCeros.xs = \langle Max \ bs : (\exists as, cs : xs = as ++ bs ++ cs) \wedge todosCeros.bs : \#bs \rangle$$
*Donde:* $\text{todosCeros.bs} \equiv \langle \forall x : x \in bs : x = 0 \rangle$

#### Alternativa 3 (Intervalos de índices semicerrados)
Modela la selección del subsegmento continuo mediante los límites de sus posiciones de inicio y fin ($i$ y $j$) dentro de la secuencia.
$$maxCeros.xs = \langle Max \ i, j : 0 \le i \le j \le \#xs \wedge \langle \forall k : i \le k < j : xs.k = 0 \rangle : j - i \rangle$$