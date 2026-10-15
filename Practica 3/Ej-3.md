## Resolución del Ejercicio 3: Definición de `OR` e Implicación en Cálculo Lambda

Para definir operaciones lógicas utilizando cálculo lambda puro, empleamos la **Codificación de Church** para los booleanos, donde estos actúan como funciones selectores:

* $\text{TRUE} \equiv \lambda x. \lambda y. x$
* $\text{FALSE} \equiv \lambda x. \lambda y. y$

---

### 1. Definición y Demostración del `OR`

La disyunción lógica ($p \lor q$) se define formalmente como:


$$\text{OR} \equiv \lambda p. \lambda q. p\ p\ q$$

#### Verificación paso a paso ($\beta$-reducción)

Evaluemos la expresión probando con $\text{TRUE}\ \text{OR}\ \text{FALSE}$:

$$\text{OR}\ \text{TRUE}\ \text{FALSE}$$

1. **Sustitución de la función OR:**

$$(\lambda p. \lambda q. p\ p\ q)\ \text{TRUE}\ \text{FALSE}$$


2. **Aplicación del primer argumento ($p = \text{TRUE}$):**

$$(\lambda q. \text{TRUE}\ \text{TRUE}\ q)\ \text{FALSE}$$


3. **Aplicación del segundo argumento ($q = \text{FALSE}$):**

$$\text{TRUE}\ \text{TRUE}\ \text{FALSE}$$


4. **Sustitución de $\text{TRUE}$ por su definición ($\lambda x. \lambda y. x$):**

$$(\lambda x. \lambda y. x)\ \text{TRUE}\ \text{FALSE}$$


5. **Reducción de Church (selección del primer argumento):**

$$\text{TRUE}$$



---

### 2. Definición y Demostración de la Implicación ($p \implies q$)

La implicación material ($p \implies q$) se define formalmente como:


$$\text{IMPL} \equiv \lambda p. \lambda q. p\ q\ \text{TRUE}$$

#### Verificación paso a paso ($\beta$-reducción)

Evaluemos la expresión probando con $\text{FALSE} \implies \text{TRUE}$:

$$\text{IMPL}\ \text{FALSE}\ \text{TRUE}$$

1. **Sustitución de la función IMPL:**

$$(\lambda p. \lambda q. p\ q\ \text{TRUE})\ \text{FALSE}\ \text{TRUE}$$


2. **Aplicación del primer argumento ($p = \text{FALSE}$):**

$$(\lambda q. \text{FALSE}\ q\ \text{TRUE})\ \text{TRUE}$$


3. **Aplicación del segundo argumento ($q = \text{TRUE}$):**

$$\text{FALSE}\ \text{TRUE}\ \text{TRUE}$$


4. **Sustitución de $\text{FALSE}$ por su definición ($\lambda x. \lambda y. y$):**

$$(\lambda x. \lambda y. y)\ \text{TRUE}\ \text{TRUE}$$


5. **Reducción de Church (selección del segundo argumento):**

$$\text{TRUE}$$