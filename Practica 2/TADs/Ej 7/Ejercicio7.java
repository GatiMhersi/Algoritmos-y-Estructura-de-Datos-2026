import java.util.Stack;

public class Ejercicio7{

	public boolean balanceado(String expresion){
		Stack<Character> pila = new Stack<>();
		
		// (Opcional) Un string vacío se considera balanceado matemáticamente
        if (expresion == null || expresion.length() == 0) {
            return true; 
        }

		for(int i = 0 ; i < expresion.length() ; i++){

			char caracterActual = expresion.charAt(i);

			switch(caracterActual){

				case '(':
					pila.push(caracterActual);
					break;

				case ')':
					if(pila.empty()) return false;
					pila.pop();
					break;

				default:
			}
		}
		return pila.empty();

	}
}
