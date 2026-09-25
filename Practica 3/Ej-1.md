### Consigna:
1. Resuelve las siguientes expresiones de cálculo lambda:
(a) $(\lambda x.x + 2) 3$
(b) $(\lambda x. - x) 7$
(c) $(\lambda x.\lambda y.x * y) 5\ 2$
(d) $(\lambda x.xx)(\lambda x.xx)$

---

### Respuesta:

**(a)** $(\lambda x.x + 2) 3$
* $\beta$-reducción: $3 + 2$
* **Resultado:** $5$

**(b)** $(\lambda x. - x) 7$
* $\beta$-reducción: $-7$
* **Resultado:** $-7$

**(c)** $(\lambda x.\lambda y.x * y) 5\ 2$
* $\beta$-reducción 1: $(\lambda y.5 * y) 2$
* $\beta$-reducción 2: $5 * 2$
* **Resultado:** $10$

**(d)** $(\lambda x.xx)(\lambda x.xx)$
* $\beta$-reducción: $(\lambda x.xx)(\lambda x.xx)$
* **Nota:** Al aplicar la reducción, el argumento se copia a sí mismo, volviendo a generar exactamente la expresión original. Se trata de una expresión divergente (bucle infinito) conocida como el combinador Omega ($\Omega$).