public class MainEjercicio6b {

    public static void main(String[] args) {
        System.out.println("=== INICIANDO PRUEBAS DE LISTA DE ARREGLOS ===\n");

        // 1. Instanciamos la lista con capacidad para 5 elementos
        ListaArreglos<String> miLista = new ListaArreglos<>(5);

        System.out.println("¿La lista está vacía? " + miLista.esVacia()); // Debería ser true
        System.out.println("Longitud inicial: " + miLista.longitud()); // Debería ser 0

        // 2. Probamos Inserciones
        System.out.println("\n--- Agregando elementos ---");
        miLista.insertarFin("Manzana");   // Posición 1
        miLista.insertarFin("Naranja");   // Posición 2
        miLista.insertarInicio("Pera");   // Pasa a Pos 1, Manzana a 2, Naranja a 3
        miLista.insertarPos("Banana", 2); // Pasa a Pos 2, Manzana a 3, Naranja a 4

        System.out.println("Estado de la lista (debería ser: Pera, Banana, Manzana, Naranja):");
        miLista.imprimir();
        System.out.println("Longitud actual: " + miLista.longitud()); // Debería ser 4

        // 3. Probamos Obtener elementos
        System.out.println("\n--- Consultando elementos ---");
        System.out.println("Primer elemento: " + miLista.obtenerPrimero()); // Debería ser Pera
        System.out.println("Último elemento: " + miLista.obtenerUltimo());  // Debería ser Naranja
        System.out.println("Elemento en la posición 3: " + miLista.obtenerElemPos(3)); // Debería ser Manzana

        // 4. Probamos Búsqueda
        System.out.println("\n--- Buscando elementos ---");
        System.out.println("Posición de 'Manzana': " + miLista.buscar("Manzana")); // Debería ser 3
        System.out.println("Posición de 'Sandía' (no existe): " + miLista.buscar("Sandía")); // Debería ser -1

        // 5. Probamos Eliminaciones
        System.out.println("\n--- Eliminando elementos ---");
        System.out.println("Se eliminó el primero: " + miLista.eliminarPrimero()); // Elimina Pera
        System.out.println("Se eliminó el último: " + miLista.eliminarUltimo());   // Elimina Naranja
        
        System.out.println("Lista tras eliminar extremos (debería quedar: Banana, Manzana):");
        miLista.imprimir();

        System.out.println("Se eliminó en la posición 1: " + miLista.eliminarPos(1)); // Elimina Banana

        System.out.println("\nLista Final (debería quedar solo Manzana):");
        miLista.imprimir();
        System.out.println("Longitud final: " + miLista.longitud()); // Debería ser 1

        // 6. Prueba de Excepciones (Opcional: forzamos un error para ver si lo ataja)
        System.out.println("\n--- Prueba de errores (Excepciones) ---");
        try {
            System.out.println("Intentando buscar en la posición 10...");
            miLista.obtenerElemPos(10);
        } catch (Exception e) {
            System.out.println("¡Excepción capturada con éxito!: " + e.getClass().getSimpleName());
        }
    }
}