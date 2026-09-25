public class ListaArreglos<T> implements Lista<T>{

	private T[] listaArreglo;
	private int cantidad;

	public ListaArreglos(){
		listaArreglo = (T[]) new Object[100];
		cantidad = 0;
	}

	public ListaArreglos(int cantidadMaxima){
		listaArreglo = (T[]) new Object[cantidadMaxima];
		cantidad = 0;
	}

	//	Metodos para Agregar Elementos

	public void insertarFin(T item){
		if(cantidad == listaArreglo.length) throw new IllegalStateException("Lista de Arreglos llena!");
		listaArreglo[cantidad] = item;
		cantidad++;
	}

	public void insertarInicio(T item){
		if(cantidad == listaArreglo.length) throw new IllegalStateException("Lista de Arreglos llena!");
		for(int i = cantidad - 1; i >= 0; i--){
			listaArreglo[i+1] = listaArreglo[i];
		}
		/**
		 *	pense en este bucle para desplazar, pero si cantidad era cero en la primera iteracion apuntaria
		 * a la posicion -1
		for(int i = cantidad; i >= 0; i--){
			listaArreglo[i] = listaArreglo[i-1];
		}

		**/


		cantidad++;
		listaArreglo[0] = item;
	}

	public void insertarPos(T item, int pos){
		//no se puede poner en una posicion que haga que corte la lista
		//no se puede insertar elementos si el arreglo esta lleno

		if (pos<=0 || pos>cantidad+1) throw new IllegalArgumentException();
		if (cantidad == listaArreglo.length) throw new IllegalStateException();

		for(int i = cantidad - 1; i>=pos - 1 ; i--){
			listaArreglo[i+1] = listaArreglo[i];
		}
		listaArreglo[pos-1] = item;
		cantidad++;
	}

	//Metodos para Eliminar un Elemento

	
	public T eliminarUltimo(){
		if(cantidad == 0) throw new IllegalStateException();

		T aux = listaArreglo[cantidad-1];
		listaArreglo[cantidad-1] = null;
		cantidad--;
		return aux;
	}
		

	public T eliminarPrimero(){
		if(cantidad == 0) throw new IllegalStateException();

		T itemRetorno = listaArreglo[0];

		for(int i = 0; i<cantidad-1; i++){
			listaArreglo[i] = listaArreglo[i+1];
		}

		listaArreglo[cantidad - 1]= null;

		cantidad--;

		return itemRetorno;
		}

	public T eliminarPos(int pos){
		if(cantidad == 0) throw new IllegalStateException();
		T itemRetorno = listaArreglo[pos-1];

		for(int i = pos-1; i<cantidad-1 ; i++){
			listaArreglo[i] = listaArreglo[i+1];
		}
		listaArreglo[cantidad-1] = null;
		cantidad--;
		return itemRetorno;
	}



	//Obtener un elemento

	public T obtenerPrimero(){
		if(cantidad == 0) throw new IllegalArgumentException();
		return listaArreglo[0];
	}

	public T obtenerUltimo(){
		if(cantidad == 0) throw new IllegalArgumentException();
		return listaArreglo[cantidad-1];
	}
		

	public T obtenerElemPos(int pos){
		if(pos>cantidad)throw new ArrayIndexOutOfBoundsException();
		return listaArreglo[pos-1];
	}

	//Metodos Auxiliares

	//Retorna el Primero?? o todas las coincidencias?pensado por ahora para el primero
	public int buscar(T item){

		int posicionFinal = -1;

		for(int posicion = 0; posicion < cantidad; posicion++){
			if (listaArreglo[posicion].equals(item)){
				posicionFinal = posicion+1;
				break;
			};
		}

		return posicionFinal;
	}

	public int longitud(){
		return cantidad;
	}

	public boolean esVacia(){
		return cantidad == 0;
	}


	public void imprimir(){
		for(int i = 0 ; i<cantidad ; i++ ){
			System.out.println(listaArreglo[i]);
		}
	}


}