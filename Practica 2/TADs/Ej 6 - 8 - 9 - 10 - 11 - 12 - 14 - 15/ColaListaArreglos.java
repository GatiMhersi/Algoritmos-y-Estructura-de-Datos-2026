public class ColaListaArreglos<T> implements Cola<T>{

	private Lista<T> cola;

	public ColaListaArreglos(){
		cola = new ListaArreglos<>(100000);
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