//Inciso C
public class MedicionesTemperaturasTest {
	public static void main (String[] args){

		//INCISO D - empieza
		//instanciar objeto
		//MedicionesTemperatura preset = new MedicionesTemperatura(1,2);
		//Correccion:
		/**
		 *+Tener cuidado con invocar la clase exacta MedicionesTemperatura 
		 * no es igual a MedicionesTemperaturas (la s en temperaturaS) 
		 * 
		 * */

		MedicionesTemperaturas preset = new MedicionesTemperaturas(1,2);

		//Valores a agregar
		// int[8] medicionesAAgregar = [−1, 3, 8, 15, 12, 6, 6, 2];
		
		// +correccion no poner valor de tamaño en la inicializacion
		// +para pasarle el arreglo debes pasarle el conjunto con llaves, no con corchetes
		// +tener cuidado al copiar y pegar que la representacion del simbolo negativo
		// 	sea un guion medio (-) y no un guion medio largo (−), son muy similares, pero no
		// 	generan el mismo efecto.
		int[] medicionesAAgregar = {-1, 3, 8, 15, 12, 6, 6, 2};

		//iteracion de agregado
		for(int medicion : medicionesAAgregar){
			preset.agregarRegistro(medicion);
		}
		//INCISO D - termina

		//Inciso E
		//Imprimir en consola

		/**
		 * 
		preset.imprirTemperaaturas();
		*
		* Cuidado con la ortografia
		* */
		System.out.println("imprimirTemperaturas()");
		preset.imprimirTemperaturas();
		System.out.println("promedio()");
		System.out.println(preset.promedio());
		System.out.println("temperaturaMaxima()");
		System.out.println(preset.temperaturaMaxima());
		System.out.println("temperaturaMinima()");
		System.out.println(preset.temperaturaMinima());
		System.out.println("amplitud()");
		System.out.println(preset.amplitud());

	}
}