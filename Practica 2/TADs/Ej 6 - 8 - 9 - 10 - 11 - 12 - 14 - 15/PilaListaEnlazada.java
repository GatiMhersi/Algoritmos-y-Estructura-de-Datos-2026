public class PilaListaEnlazada<T> implements Pila<T>{

	private ListaEnlazada<T> pila;

	public PilaListaEnlazada(){
		this.pila = new ListaEnlazada<>();
	}

	//Escribiendo el codigo me di cuenta que para este tipo de pila
	//tal vez sea mas eficiente utilizar como tope, el primer elemento
	//de la ListaEnlazada, en lugar de el ultimo como esta pensado aqui
	//para implementarlo de esa manera cambiar:
	//	pila.insertarFin 	>> 	pila.insertarInicio 
	//	pila.eliminarUltimo	>>	pila.eliminarPrimero

	@Override
	public void apilar(T item){
		pila.insertarFin(item);
	}

	@Override
	public void desapilar(){
		T eliminado = pila.eliminarUltimo();

	}

	@Override
	public T tope(){
		return pila.obtenerUltimo();
	}

	@Override
	public boolean esVacia(){
		return pila.esVacia();
	}

	@Override
	public void vaciar(){
		while(esVacia()){
			desapilar();
		}
	}
}