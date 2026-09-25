import java.util.LinkedList;
import java.util.List;
import java.util.Random;

public class CrearLista{

	public static List<Integer> crearLista(int n){

		Random random = new Random();
		List<Integer> listaConEnteros = new LinkedList<>();

		for(int i = 0; i<n; i++){

			int numeroAleatorio = 1 + random.nextInt(100);
			listaConEnteros.add(numeroAleatorio);

		}

		return listaConEnteros;
	}

}