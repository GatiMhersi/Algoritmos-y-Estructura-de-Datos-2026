{- ============================================================================
   EXPLICACIÓN: CLASES DE TIPOS (TYPECLASSES) VS TIPOS CONCRETOS
   ============================================================================
   - Tipo Concreto (ej. Int, Integer, Float): Define un conjunto de datos en memoria. 
     'Int' es un entero con límite de tamaño (depende de tu procesador, ej 64 bits), 
     mientras que 'Integer' es de precisión arbitraria (no tiene límite, pero ocupa más memoria).
   
   - Clase de Tipos (ej. Num, Eq, Show): Son como "interfaces" o contratos. 
     Agrupan tipos que soportan ciertas operaciones. La clase 'Num' agrupa a todos 
     los tipos que soportan suma (+), resta (-), y multiplicación (*).
     
   Al poner `Num a => [a] -> [a]`, le decimos a Haskell: "Esta función acepta una 
   lista de cualquier tipo 'a', con la condición de que 'a' sea de la clase Num".

   ============================================================================
   DISTINTAS FORMAS DE RESOLVER ESTE EJERCICIO:
   ============================================================================
   1. Listas por comprensión (Solución actual y pedida en esta sección):
      listaCuadradoNaturales xs = [x * x | x <- xs]
      
   2. Funciones de alto orden (usando 'map'):
      listaCuadradoNaturales xs = map (\x -> x * x) xs
      -- O más corto con aplicación parcial: map (^2) xs
      
   3. Recursión explícita (caso base y paso recursivo):
      listaCuadradoNaturales [] = []
      listaCuadradoNaturales (x:xs) = (x * x) : listaCuadradoNaturales xs
============================================================================ -}

-- | 'listaCuadradoNaturales': Recibe una lista de números y retorna una nueva 
-- lista donde cada elemento original fue elevado al cuadrado utilizando listas
-- por comprensión. Extrae cada 'x' de 'xs', y devuelve 'x * x'.
listaCuadradoNaturales :: Num a => [a] -> [a]
listaCuadradoNaturales xs = [x * x | x <- xs]


-- | 'ejecutarPrueba24': Función auxiliar para formatear y automatizar la salida 
-- de las pruebas en consola. Compara el resultado real con el esperado.
ejecutarPrueba24 :: (Eq a, Show a, Num a) => String -> [a] -> [a] -> IO ()
ejecutarPrueba24 operacion sobreQuien esperado = do
    let resultadoReal = listaCuadradoNaturales sobreQuien
    putStrLn $ "Operación:          " ++ operacion
    putStrLn $ "Sobre quién (Input): " ++ show sobreQuien
    putStrLn $ "Resultado esperado: " ++ show esperado
    putStrLn $ "Resultado real:     " ++ show resultadoReal
    putStrLn $ "Estado de prueba:   " ++ if resultadoReal == esperado 
                                           then "ÉXITO\n" 
                                           else "FALLO\n"

-- | 'main24': Función principal de testeo que ejecuta una batería de pruebas
-- sobre 'listaCuadradoNaturales'.
main24 :: IO ()
main24 = do
    putStrLn "--- INICIANDO PRUEBAS EJERCICIO 24 ---\n"
    
    ejecutarPrueba24 
        "Cuadrados de los primeros naturales" 
        [1, 2, 3, 4, 5] 
        [1, 4, 9, 16, 25]
        
    ejecutarPrueba24 
        "Cuadrado de lista vacía" 
        [] 
        []
        
    ejecutarPrueba24 
        "Cuadrado de lista con un solo elemento" 
        [10] 
        [100]
        
    ejecutarPrueba24 
        "Cuadrados incluyendo el cero (matemáticamente a veces incluido)" 
        [0, 2, 4] 
        [0, 4, 16]