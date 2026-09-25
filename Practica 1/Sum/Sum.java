public class Sum{
	public static void main(String[] args){
		if(args.length == 2) {
			int suma = Integer.parseInt(args[0])+Integer.parseInt(args[1]);
			System.out.println("La suma es: " + suma);
		} else {
			System.out.println("Por favor ingresa exactamente dos numeros");
		}
	}
}

/**
 * Acordarse que el length es una propiedad de los arreglos y no un metodo
 * acordarse que length termina con th y no con ght
 **/