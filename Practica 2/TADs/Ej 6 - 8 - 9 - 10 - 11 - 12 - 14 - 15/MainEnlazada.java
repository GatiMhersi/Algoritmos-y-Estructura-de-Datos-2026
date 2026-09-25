public class MainEnlazada {

    public static void main(String[] args) {
        System.out.println("=== INICIANDO PRUEBAS DE LISTA ENLAZADA ===\n");

        // 1. Instanciamos nuestra nueva Lista Enlazada
        ListaEnlazada<String> miLista = new ListaEnlazada<>();

        System.out.println("¿La lista está vacía? " + miLista.esVacia()); // Debería ser true
        System.out.println("Longitud inicial: " + miLista.longitud()); // Debería ser 0

        // 2. Probamos Inserciones
        System.out.println("\n--- Agregando elementos ---");
        miLista.insertarFin("Manzana");   // Posición 1
        miLista.insertarFin("Naranja");   // Posición 2
        miLista.insertarInicio("Pera");   // Pasa a Pos 1. [Pera, Manzana, Naranja]
        miLista.insertarPos("Banana", 2); // Pasa a Pos 2. [Pera, Banana, Manzana, Naranja]
        miLista.insertarPos("Uva", 5);    // Pasa al final. [Pera, Banana, Manzana, Naranja, Uva]

        System.out.println("Estado de la lista (debería ser: Pera, Banana, Manzana, Naranja, Uva):");
        miLista.imprimir();
        System.out.println("Longitud actual: " + miLista.longitud()); // Debería ser 5

        // 3. Probamos Obtener elementos
        System.out.println("\n--- Consultando elementos ---");
        System.out.println("Primer elemento: " + miLista.obtenerPrimero()); // Debería ser Pera
        System.out.println("Último elemento: " + miLista.obtenerUltimo());  // Debería ser Uva
        System.out.println("Elemento en la pos 3: " + miLista.obtenerElemPos(3)); // Debería ser Manzana

        // 4. Probamos Búsqueda
        System.out.println("\n--- Buscando elementos ---");
        System.out.println("Posición de 'Manzana': " + miLista.buscar("Manzana")); // Debería ser 3
        System.out.println("Posición de 'Sandía' (no existe): " + miLista.buscar("Sandía")); // Debería ser -1

        // 5. Probamos Eliminaciones
        System.out.println("\n--- Eliminando elementos ---");
        System.out.println("Se eliminó el primero: " + miLista.eliminarPrimero()); // Elimina Pera
        System.out.println("Se eliminó el último: " + miLista.eliminarUltimo());   // Elimina Uva
        
        System.out.println("Lista temporal (debería quedar: Banana, Manzana, Naranja):");
        miLista.imprimir();

        // Como eliminamos 2, Manzana ahora está en la pos 2. Vamos a borrarla.
        System.out.println("Se eliminó en la posición 2: " + miLista.eliminarPos(2)); // Elimina Manzana

        System.out.println("\nLista Final (debería quedar: Banana, Naranja):");
        miLista.imprimir();
        System.out.println("Longitud final: " + miLista.longitud()); // Debería ser 2

        // 6. Prueba de Excepciones (Forzamos errores a propósito para probar tus escudos)
        System.out.println("\n--- Prueba de errores (Excepciones) ---");
        try {
            System.out.println("Intentando insertar en la posición 10...");
            miLista.insertarPos("Kiwi", 10);
        } catch (Exception e) {
            System.out.println("¡Excepción capturada con éxito!: " + e.getMessage());
        }
    }
}