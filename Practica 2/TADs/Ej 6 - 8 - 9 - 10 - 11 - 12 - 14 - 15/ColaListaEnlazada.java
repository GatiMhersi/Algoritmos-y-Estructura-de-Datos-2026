public class ColaListaEnlazada<T> implements Cola<T>{

	private ListaEnlazada<T> cola;

	public ColaListaEnlazada() {
		cola = new ListaEnlazada<>();
	}

	@Override
	public void encolar(T item){
		cola.insertarFin(item);
	}

	@Override
	public void desencolar(){
		cola.eliminarPrimero();
	}

	@Override
	public boolean esVacia(){
		return cola.esVacia();
	}

	@Override
	public void vaciar(){
		while(!esVacia()){
			desencolar();
		}
	}
}