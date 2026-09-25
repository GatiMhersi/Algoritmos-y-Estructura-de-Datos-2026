import java.util.Arrays;
/**
 * Clase ArrayUtils: contiene implementaciones de rutinas fundamentales
 * sobre arreglos.
 * 
 * @author N. Aguirre
 * @version 0.1
 */
public class ArrayUtils
{
    
    /**
     * Comprueba si un elemento (entero) pertenece a un arreglo.
     */
    public boolean pertenece(int elem, int[] arreglo) {
        if (arreglo == null)
            throw new IllegalArgumentException("Arreglo nulo");
        //TODO: Completar la implementación, reemplazando la línea siguiente
        for(int elementoActual : arreglo){
            if(elem == elementoActual){
                return true;
            }
        }
        return false;
    }
    
    /**
     * Calcula la suma de los elementos de un arreglo de enteros
     */
    public int suma(int[] arreglo) {
        //TODO: Completar la implementación, reemplazando la línea siguiente
        int acumulador = 0;
        for(int elemActual : arreglo){
            acumulador += elemActual;
        }
        return acumulador;
    }
    
    /**
     * Calcula el valor mínimo de un arreglo de reales
     */
    public float minimo(float[] arreglo) {
        //TODO: Completar la implementación, reemplazando la línea siguiente
        float tempMinimo = arreglo[0];
        for(float elemActual : arreglo){
            if(tempMinimo > elemActual){
                tempMinimo = elemActual;
            }
        }
        return tempMinimo;
    }
    
    /**
     * Calcula el valor máximo de un arreglo de reales
     */
    public float maximo(float[] arreglo) {
        //TODO: Completar la implementación, reemplazando la línea siguiente
        float tempMaximo = arreglo[0];
        for(float elemActual : arreglo){
            if(tempMaximo < elemActual){
                tempMaximo = elemActual;
            }
        }
        return tempMaximo;
    }
    
    
    /**
     * Calcula el valor promedio de un arreglo de reales
     */
    public float promedio(float[] arreglo) {
        //TODO: Completar la implementación, reemplazando la línea siguiente
        int cantidadElementos = arreglo.length;
        float acumulador = 0;
        for(float elementoActual : arreglo){
            acumulador += elementoActual;
        }
        return (float) acumulador / cantidadElementos;
    }
    
    /**
     * Retorna un arreglo con los primeros n números de Fibonacci
     */
    public int[] fibSequence(int n) {
        //TODO: Completar la implementación, reemplazando la línea siguiente
        int[] arreglo = new int[n];
        for(int i = 0 ; i < n ; i++){
            if(i == 0 || i == 1){
                arreglo[i] = i;
            } else {
                arreglo[i] = arreglo[i-1] + arreglo[i-2];
            }
        }
        return arreglo;
    }
    
    /**
     * Calcula la mediana de un arreglo de reales
     */
    public float mediana(float[] arreglo) {
        //TODO: Completar la implementación, reemplazando la línea siguiente

        //copia del arreglo par ano mdificar el arreglo original
        float[] arregloCopia = arreglo.clone();

        //ordenar copia del arreglo
        Arrays.sort(arregloCopia);

        //obtener largo del arreglo
        int n = arregloCopia.length;

        //arreglo de tamanio par o impar?
        if(n % 2 == 1){
            return arregloCopia[n/2];
        } else {
            float medio1 = arregloCopia[(n/2) - 1];
            float medio2 = arregloCopia[n/2];
            return (medio1+medio2)/2;
        }
    }
    
    /**
     * Comprueba si dos arreglos de enteros son iguales
     */
    public boolean iguales(int[] arr1, int[] arr2) {
        //TODO: Completar la implementación, reemplazando la línea siguiente
        if(arr1.length != arr2.length){
            return false;
        }
        for(int i = 0 ; i<arr1.length ; i++){
            if(arr1[i] != arr2[i]){
                return false;
            }
        }

        return true;
    }
    
    /**
     * Comprueba si un arreglo tiene valores repetidos
     */
    public boolean tieneRepetidos(int[] arreglo) {
        //TODO: Completar la implementación, reemplazando la línea siguiente
        for(int i = 0 ; i < arreglo.length ; i++){
            for(int j = i+1 ; j < arreglo.length ; j++){
                if(arreglo[i] == arreglo[j]){
                    return true;
                }
            }
        }
        return false;
    }
    
    /**
     * Comprueba si un arreglo tiene dos valores cuya suma dé cero.
     */
    public boolean tieneOpuestos(float[] arreglo) {
        //TODO: Completar la implementación, reemplazando la línea siguiente
        for(int i = 0 ; i < arreglo.length ; i++){
            for(int j = i+1 ; j < arreglo.length ; j++){
                if(arreglo[i] + arreglo[j] == 0){
                    return true;
                }
            }
        }
        return false;
    }

    public static void main(String[] args) {
        
        // Instanciamos nuestra propia clase para poder usar sus métodos
        ArrayUtils utils = new ArrayUtils();
        
        System.out.println("=== PRUEBAS DE ARRAY UTILS ===");

        // --- Arreglos de prueba ---
        int[] enteros1 = {2, 4, 6, 8, 10};
        int[] enterosIguales = {2, 4, 6, 8, 10};
        int[] enterosDistintos = {2, 4, 6, 8, 11};
        int[] enterosConRepetidos = {1, 5, 7, 5, 9};
        
        float[] reales1 = {2.5f, 1.0f, 8.5f, -3.0f, 5.0f};
        float[] realesConOpuestos = {4.2f, 1.1f, -4.2f, 8.0f};
        float[] realesPar = {10.0f, 2.0f, 8.0f, 4.0f};

        // --- Ejecución de Pruebas llamando al objeto 'utils' ---
        
        // Prueba: pertenece
        System.out.println("\n-- Método: pertenece --");
        System.out.println("¿El 6 pertenece a enteros1?: " + utils.pertenece(6, enteros1)); 
        System.out.println("¿El 7 pertenece a enteros1?: " + utils.pertenece(7, enteros1)); 

        // Prueba: suma
        System.out.println("\n-- Método: suma --");
        System.out.println("Suma de enteros1 (esperado 30): " + utils.suma(enteros1));

        // Prueba: minimo y maximo
        System.out.println("\n-- Método: minimo y maximo --");
        System.out.println("Mínimo de reales1 (esperado -3.0): " + utils.minimo(reales1));
        System.out.println("Máximo de reales1 (esperado 8.5): " + utils.maximo(reales1));

        // Prueba: promedio
        System.out.println("\n-- Método: promedio --");
        System.out.println("Promedio de reales1 (esperado 2.8): " + utils.promedio(reales1));

        // Prueba: fibSequence
        System.out.println("\n-- Método: fibSequence --");
        int[] fibo = utils.fibSequence(7);
        System.out.println("Fibonacci de 7: " + java.util.Arrays.toString(fibo)); 

        // Prueba: mediana
        System.out.println("\n-- Método: mediana --");
        System.out.println("Mediana de reales1 (impar): " + utils.mediana(reales1));
        System.out.println("Mediana de realesPar (par): " + utils.mediana(realesPar));

        // Prueba: iguales
        System.out.println("\n-- Método: iguales --");
        System.out.println("¿enteros1 es igual a enterosIguales?: " + utils.iguales(enteros1, enterosIguales)); 
        System.out.println("¿enteros1 es igual a enterosDistintos?: " + utils.iguales(enteros1, enterosDistintos)); 

        // Prueba: tieneRepetidos
        System.out.println("\n-- Método: tieneRepetidos --");
        System.out.println("¿enteros1 tiene repetidos?: " + utils.tieneRepetidos(enteros1)); 
        System.out.println("¿enterosConRepetidos tiene repetidos?: " + utils.tieneRepetidos(enterosConRepetidos)); 

        // Prueba: tieneOpuestos
        System.out.println("\n-- Método: tieneOpuestos --");
        System.out.println("¿reales1 tiene opuestos?: " + utils.tieneOpuestos(reales1)); 
        System.out.println("¿realesConOpuestos tiene opuestos?: " + utils.tieneOpuestos(realesConOpuestos)); 
    }
    
}
