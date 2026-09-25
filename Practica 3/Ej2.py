# Definición de las funciones lambda
ejA = (lambda x: x+2)
ejB = (lambda x: -x)
ejC = (lambda x: (lambda y: x*y))
ejD = (lambda x: x(x))

# Guardamos los resultados en variables
resultado_a = ejA(3)
resultado_b = ejB(7)
resultado_c = ejC(5)(2)

# Imprimimos los resultados guardados
print(f"Ejercicio a : {resultado_a}")
print(f"Ejercicio b : {resultado_b}")
print(f"Ejercicio c : {resultado_c}")

# Manejo de la divergencia (bucle infinito) del inciso d
try:
    # Intentamos guardar el resultado, aunque sabemos que fallará
    resultado_d = ejD(lambda x: x(x))
    print(f"Ejercicio d : {resultado_d}")
except RecursionError as e:
    # Python detiene la ejecución infinita y lanza un RecursionError
    print(f"Ejercicio d : Error de recursión infinita detectado ({e})")
except Exception as e:
    # Captura cualquier otro error genérico por las dudas
    print(f"Ejercicio d : Error {e}")