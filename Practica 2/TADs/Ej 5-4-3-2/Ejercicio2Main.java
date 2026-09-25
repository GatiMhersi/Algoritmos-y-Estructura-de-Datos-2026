import java.util.List;

public class Ejercicio2Main {

	public static void main(String[] args){
		List<Integer> lista = CrearLista.crearLista(100);
		System.out.println(lista);
		System.out.println("El numero 35...");
		if(Pertenece.revisarPertenencia(lista, 35)){
			System.out.println("ESTA EN LA LISTA");
		}else{
			System.out.println("NO ESTA EN LA LISTA");
		}
		System.out.println("Arreglo ordenado: ");
		BubbleSort.execute(lista);
		System.out.println(lista);
	}
}