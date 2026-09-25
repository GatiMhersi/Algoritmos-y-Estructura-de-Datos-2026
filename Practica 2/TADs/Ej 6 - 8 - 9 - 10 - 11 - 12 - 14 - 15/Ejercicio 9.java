public class Ejercicio9{

	public boolean balanceadoPilaEnlazada(String expresion){
		Pila<Character> pilaEnlazada = new PilaListaEnlazada<>();

		// (Opcional) Un string vacío se considera balanceado matemáticamente
        if (expresion == null || expresion.length() == 0) {
            return true; 
        }

		for(int i = 0 ; i < expresion.length() ; i++){

			char caracterActual = expresion.charAt(i);

			switch(caracterActual){

				case '(':
					pilaEnlazada.apilar(caracterActual);
					break;

				case ')':
					if(pilaEnlazada.esVacia()) return false;
					pilaEnlazada.desapilar();
					break;

				default:
			}
		}
		return pilaEnlazada.esVacia();

	}

	public boolean balanceadoPilaArreglo(String expresion){
		Pila<Character> pilaArreglo = new PilaListaArreglos<>();

		// (Opcional) Un string vacío se considera balanceado matemáticamente
        if (expresion == null || expresion.length() == 0) {
            return true; 
        }

		for(int i = 0 ; i < expresion.length() ; i++){

			char caracterActual = expresion.charAt(i);

			switch(caracterActual){

				case '(':
					pilaArreglo.apilar(caracterActual);
					break;

				case ')':
					if(pilaArreglo.esVacia()) return false;
					pilaArreglo.desapilar();
					break;

				default:
			}
		}
		return pilaArreglo.esVacia();

	}
}
