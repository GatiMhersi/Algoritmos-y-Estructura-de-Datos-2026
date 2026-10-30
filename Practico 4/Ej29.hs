{-
  EJERCICIO 29 - LISTA INFINITA DE NÚMEROS PARES
  
  Contexto: Este ejercicio introduce uno de los conceptos más poderosos de 
  Haskell: la "Evaluación Perezosa" (Lazy Evaluation). Esto permite definir 
  estructuras de datos infinitas, ya que el lenguaje solo computa los valores 
  a medida que se los solicita. 
  
  A continuación, se presentan tres enfoques válidos para resolverlo, pasando 
  por el uso de secuencias aritméticas hasta listas por comprensión con 
  diferentes estrategias algorítmicas (filtrado vs. generación directa).
-}

-- =====================================================================
-- 1. Secuencia Aritmética (Azúcar sintáctico)
-- =====================================================================
{-
  Esta es la forma más idiomática y sencilla en Haskell para secuencias 
  matemáticas lineales. Al darle los primeros dos elementos `[2, 4]`, el 
  compilador infiere automáticamente que el "paso" o incremento es de +2. 
  El `..` indica que la serie continúa indefinidamente.
-}
listaParesInfinita :: [Int]
listaParesInfinita = [2, 4 ..]


-- =====================================================================
-- 2. Listas por Comprensión (Filtrado por módulo)
-- =====================================================================
{-
  Aquí aplicamos el concepto de Listas por Comprensión iterando sobre la 
  lista infinita de números naturales `[1..]`.
  Para cada número `x`, evaluamos la condición `x `mod` 2 == 0`.
  A nivel computacional, esto es un poco ineficiente porque la máquina 
  tiene que generar los números impares, evaluarlos y luego descartarlos.
-}
listaParesInfinitaComprension :: [Int]
listaParesInfinitaComprension = [x | x <- [1..], x `mod` 2 == 0]


-- =====================================================================
-- 3. Listas por Comprensión Mejorada (Generación Directa o Mapeo)
-- =====================================================================
{-
  Este es el enfoque superador dentro del paradigma de comprensión.
  En lugar de generar todos los números y filtrar los que no sirven, 
  tomamos la lista infinita de naturales `[1..]` y aplicamos una 
  transformación directa a cada elemento: `x * 2`.
  Es más rápido computacionalmente porque no hay evaluaciones condicionales 
  ni se descartan elementos; cada ciclo produce un resultado válido.
-}
listaParesInfinitaMejorada :: [Int]
listaParesInfinitaMejorada = [x * 2 | x <- [1..]]


-- =====================================================================
-- ZONA DE PRUEBAS (main29)
-- =====================================================================

{-
  ¡ATENCIÓN ARQUITECTÓNICA!: Como las listas son infinitas, si intentamos 
  imprimirlas directamente (`show listaParesInfinita`), el programa entrará 
  en un loop infinito consumiendo recursos hasta crashear. 
  
  Para probarlas de forma segura, debemos utilizar la función `take n`, 
  que extrae solo los primeros `n` elementos de la lista y fuerza al 
  motor perezoso de Haskell a evaluar únicamente esa porción.
-}

-- Función auxiliar para imprimir las pruebas forzando una evaluación finita
test :: String -> [Int] -> Int -> [Int] -> IO ()
test nombre listaInfinita cantidadAExtraer esperado = do
    let outputReal = take cantidadAExtraer listaInfinita
    putStrLn $ "--- Ejecutando: " ++ nombre ++ " ---"
    putStrLn $ "Operacion:       take " ++ show cantidadAExtraer ++ " de la lista infinita"
    putStrLn $ "Output Esperado: " ++ show esperado
    putStrLn $ "Output Real:     " ++ show outputReal
    putStrLn ""

main29 :: IO ()
main29 = do
    let n = 10 -- Cantidad de elementos que vamos a extraer para probar
    let resultadoEsperado = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
    
    putStrLn "========================================================="
    putStrLn "          TESTING: EJERCICIO 29 (Listas Infinitas)       "
    putStrLn "=========================================================\n"
    
    test "Secuencia Aritmetica" listaParesInfinita n resultadoEsperado
    test "Comprension (Filtro mod 2)" listaParesInfinitaComprension n resultadoEsperado
    test "Comprension Mejorada (Mapeo x*2)" listaParesInfinitaMejorada n resultadoEsperado