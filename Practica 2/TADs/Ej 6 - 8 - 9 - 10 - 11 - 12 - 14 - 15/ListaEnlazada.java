public class ListaEnlazada<T> implements Lista<T>{
	Nodo<T> cabeza;

	public ListaEnlazada() {
		cabeza = null;
	}

	//	Metodos para Agregar Elementos

	public void insertarFin(T item) {
		Nodo<T> nuevoNodo = new Nodo<T>(item);
		Nodo<T>	aux = cabeza;
		if (aux == null){ 
			cabeza=nuevoNodo;
		}else {
			while(aux.siguiente != null){
				aux = aux.siguiente;
			}
			aux.siguiente = nuevoNodo;	
		}
	}

	public void insertarInicio(T item){
		Nodo<T> nuevoNodo = new Nodo<T>(item);
		nuevoNodo.siguiente = cabeza;	
		cabeza=nuevoNodo;
	}

	public void insertarPos(T item, int pos){
		if (pos <= 0) throw new IllegalArgumentException("Posición inválida");

		if (pos == 1) {
            insertarInicio(item);
            return; // Terminamos el método aquí
        }

		Nodo<T> nuevoNodo = new Nodo<T>(item);
		Nodo<T> aux = cabeza;
			for(int i = 1; i<pos-1; i++){
				if (aux == null) throw new IndexOutOfBoundsException("La posición excede el tamaño");
				
					aux = aux.siguiente;
				
			}
			if (aux == null) throw new IndexOutOfBoundsException("La posición excede el tamaño");
			nuevoNodo.siguiente = aux.siguiente;
			aux.siguiente = nuevoNodo;	
		
		
	}

	//Metodos para Eliminar un Elemento

	public T eliminarUltimo(){
		if(cabeza == null) throw new IllegalStateException();
		
		T datoElemElim;
		if(cabeza.siguiente == null){
			datoElemElim = cabeza.dato;
			cabeza = null;
			return datoElemElim;
		}

		Nodo<T> aux = cabeza;
		while(aux.siguiente.siguiente != null){
			aux = aux.siguiente;
		}

		datoElemElim = aux.siguiente.dato;
		aux.siguiente = null;
		return datoElemElim;
	}

	public T eliminarPrimero(){
		if(cabeza == null) throw new IllegalStateException();
		T datoRetorno = cabeza.dato;
		cabeza = cabeza.siguiente;
		return datoRetorno;
	}

	public T eliminarPos(int pos){
		if(pos<1) throw new IllegalArgumentException("El argumento debe ser a partir de 1");
		if(cabeza == null) throw new IllegalStateException("La lista no debe estar vacia");
		Nodo<T> aux = cabeza;
		T datoRetorno;
		if(pos == 1){
			return eliminarPrimero();
		}
		for(int i = 1; i<pos - 1; i++){
			if(aux==null) throw new IllegalArgumentException("Posicion Invalida");
			aux = aux.siguiente;
		}

		if(aux==null || aux.siguiente == null) throw new IllegalArgumentException("Posicion invalida");
		datoRetorno = aux.siguiente.dato;
		aux.siguiente = aux.siguiente.siguiente;
		return datoRetorno;


	}

	//Obtener un elemento

	public T obtenerPrimero(){
		if(cabeza == null) throw new IllegalStateException("Lista Vacia");
		return cabeza.dato;
	}

	public T obtenerUltimo(){
		if(cabeza == null) throw new IllegalStateException("Lista Vacia");
		T datoRetorno;
		Nodo<T> aux = cabeza;
		while(aux.siguiente != null){
			aux=aux.siguiente;
		}
		datoRetorno	= aux.dato;
		return datoRetorno	;
	}

	public T obtenerElemPos(int pos){
		if(pos<1)throw new IllegalArgumentException("Posicion Invalida");
		if(cabeza==null) throw new IllegalStateException("Lista Vacia");
		Nodo<T> aux = cabeza;
		if(pos==1){
			return obtenerPrimero();
		}
		for(int i = 1; i<pos; i++){
			if(aux == null) throw new IllegalArgumentException("Posicion Invalida");
			aux=aux.siguiente;
		}
		if(aux == null) throw new IllegalArgumentException("Posicion Invalida");
		return aux.dato;
	}

	//Metodos Auxiliares

	public int buscar(T item){
		if(esVacia()) throw new IllegalStateException("Lista Vacia");
		Nodo<T> aux = cabeza;
		int indice = -1;
		int contador = 1;
		while(aux != null){
			if(aux.dato.equals(item)){
				return contador;
			}
			aux=aux.siguiente;
			contador++;
		}
		return indice;
	}


	public int longitud(){
		if(cabeza == null) return 0;
		if (cabeza.siguiente == null) return 1;

		Nodo<T> aux = cabeza;
		int contador = 0;

		while(aux != null){
			aux = aux.siguiente;
			contador++;
		}
		return contador;
	}

	public boolean esVacia(){
		return cabeza == null;
	}

	public void imprimir(){
		if (esVacia()) throw new IllegalStateException("Lista Vacia");
		Nodo<T> aux = cabeza;
		while(aux != null){
			System.out.println(aux.dato);
			aux = aux.siguiente;
		}
	}
}