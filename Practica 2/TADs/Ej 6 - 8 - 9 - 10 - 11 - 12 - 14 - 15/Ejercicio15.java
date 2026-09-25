public class Ejercicio15{
	public int resolucionNotacionPostFija(String expresion){
		Pila<Integer> numeros = new PilaListaEnlazada<>();
		int balance = 0;
		for(String elem: expresion.split("")){
			if(!"+-*/".contains(elem)){
				balance++;
				numeros.apilar(Integer.parseInt(elem));
			}else{
				balance --;
				int a = 0,b = 0;
				switch(elem){
				case "+":
					a = numeros.tope();
					numeros.desapilar();
					b = numeros.tope();
					numeros.desapilar();
					b = b + a;
					break;
				case "-":
					a = numeros.tope();
					numeros.desapilar();
					b = numeros.tope();
					numeros.desapilar();
					b = b - a;
					break;
				case "*":
					a = numeros.tope();
					numeros.desapilar();
					b = numeros.tope();
					numeros.desapilar();
					b = b * a;
					break;
				case "/":
					a = numeros.tope();
					numeros.desapilar();
					b = numeros.tope();
					numeros.desapilar();
					b = b/a;
					break;
				}

				numeros.apilar(b);

			}

		}
		if(balance!=1)throw new IllegalArgumentException("Operacion invalida");
		return numeros.tope();

	}

	public static void main(String[] args) {
		Ejercicio15 evaluador = new Ejercicio15();

    // Ejemplo (a)
		String expresionA = "74-63+*";
		int resultadoA = evaluador.resolucionNotacionPostFija(expresionA);
		System.out.println("Evaluando (a): " + expresionA);
		System.out.println("Resultado obtenido: " + resultadoA + " | Esperado: 27");
		System.out.println("¿Es correcto? " + (resultadoA == 27));
		System.out.println("-----------------------------------");

    // Ejemplo (b)
		String expresionB = "512+4*+3-";
		int resultadoB = evaluador.resolucionNotacionPostFija(expresionB);
		System.out.println("Evaluando (b): " + expresionB);
		System.out.println("Resultado obtenido: " + resultadoB + " | Esperado: 14");
		System.out.println("¿Es correcto? " + (resultadoB == 14));
		System.out.println("-----------------------------------");

    // Ejemplo (c)
		String expresionC = "392+*8-5/";
		int resultadoC = evaluador.resolucionNotacionPostFija(expresionC);
		System.out.println("Evaluando (c): " + expresionC);
		System.out.println("Resultado obtenido: " + resultadoC + " | Esperado: 5");
		System.out.println("¿Es correcto? " + (resultadoC == 5));
		System.out.println("-----------------------------------");
	}
}