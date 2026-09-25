import java.util.ArrayList;
import java.util.List;

public class Ejercicio4{
	public static void main(String[] args){
		Caja<Integer> cajaEntero = new Caja<>();
		Caja<String> cajaString = new Caja<>();
		Caja<Persona> cajaPersona= new Caja<>();
		Persona persona = new Persona( 41827056, "Matias", "Ghersinich");
		List<Caja<?>> listaDeCajas = new ArrayList<>();
		listaDeCajas.add(cajaEntero);
		listaDeCajas.add(cajaString);
		listaDeCajas.add(cajaPersona);



		cajaEntero.guardar(1);
		cajaString.guardar("Soy una cadena de caracteres");
		cajaPersona.guardar(persona);

		System.out.println("Ejercicio c - Mostrando info de las cajas");
		cajaEntero.mostrarInfo();
		cajaString.mostrarInfo();
		cajaPersona.mostrarInfo();

		System.out.println("Ejercicio c - retornando objeto");
		System.out.println("Imprimiento entero");
		Integer entero1 = cajaEntero.obtener();
		System.out.println(entero1);

		System.out.println("Imprimiento string");
		String string1 = cajaString.obtener();
		System.out.println(string1);

		System.out.println("Imprimiento persona");
		Persona persona1 = cajaPersona.obtener();
		System.out.println(persona1);

		for (Caja<?> caja : listaDeCajas){
			caja.mostrarInfo();
		}

	}
}