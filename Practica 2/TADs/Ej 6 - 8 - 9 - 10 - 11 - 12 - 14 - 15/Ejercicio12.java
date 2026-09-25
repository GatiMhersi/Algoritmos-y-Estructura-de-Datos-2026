public class Ejercicio12 {

    public static void main(String[] args) {
        
        // 1. Simulación Básica pedida en el Ejercicio 12
        System.out.println("=== SIMULACIÓN BÁSICA DE IMPRESIÓN ===");
        Cola<String> colaImpresion = new ColaListaEnlazada<>();
        
        colaImpresion.encolar("Trabajo1.txt");
        colaImpresion.encolar("Trabajo2.pdf");
        colaImpresion.encolar("Trabajo3.doc");
        
        System.out.println("Trabajos encolados exitosamente. Iniciando impresión...");
        int numeroTrabajo = 1;
        while (!colaImpresion.esVacia()) {
            colaImpresion.desencolar(); // Se extrae el trabajo
            System.out.println("Imprimiendo trabajo #" + numeroTrabajo + "...");
            numeroTrabajo++;
        }
        System.out.println("Bandeja de impresión vacía.\n");


        // 2. Prueba al Límite (Benchmark)
        System.out.println("=== PRUEBA DE ESTRÉS: Enlazada vs Arreglos ===");
        int limite = 10000; // 100,000 archivos a imprimir
        System.out.println("Cantidad de trabajos a procesar: " + limite + "\n");

        // Prueba 1: Cola con Lista Enlazada
        System.out.println("Iniciando prueba con ColaListaEnlazada...");
        Cola<String> colaEnlazada = new ColaListaEnlazada<>();
        long inicioEnlazada = System.currentTimeMillis();
        
        procesarImpresionesMasivas(colaEnlazada, limite);
        
        long finEnlazada = System.currentTimeMillis();
        System.out.println("-> Tiempo total (Lista Enlazada): " + (finEnlazada - inicioEnlazada) + " milisegundos.\n");


        // Prueba 2: Cola con Lista de Arreglos
        System.out.println("Iniciando prueba con ColaListaArreglos...");
        Cola<String> colaArreglos = new ColaListaArreglos<>();
        long inicioArreglos = System.currentTimeMillis();
        
        procesarImpresionesMasivas(colaArreglos, limite);
        
        long finArreglos = System.currentTimeMillis();
        System.out.println("-> Tiempo total (Lista Arreglos): " + (finArreglos - inicioArreglos) + " milisegundos.");
    }

    /**
     * Método auxiliar para ejecutar la prueba de estrés de forma limpia.
     */
    private static void procesarImpresionesMasivas(Cola<String> cola, int cantidad) {
        // Fase 1: Encolar (Llegan todos los trabajos a la impresora)
        for (int i = 0; i < cantidad; i++) {
            cola.encolar("Documento_Pesado_" + i + ".pdf");
        }
        
        // Fase 2: Desencolar (La impresora procesa todos los trabajos hasta vaciarse)
        while (!cola.esVacia()) {
            cola.desencolar();
        }
    }
}