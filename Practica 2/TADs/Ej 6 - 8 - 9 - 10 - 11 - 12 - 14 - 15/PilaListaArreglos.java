public class PilaListaArreglos<T> implements Pila<T>{
	private ListaArreglos<T> pila;

	public PilaListaArreglos(){
		pila = new ListaArreglos<>();
	}

	@Override
	public void apilar(T item){
		pila.insertarFin(item);
	}

	@Override
	public void desapilar(){
		T elem = pila.eliminarUltimo();
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
		while(!esVacia()){
			desapilar();
		}
	}
}