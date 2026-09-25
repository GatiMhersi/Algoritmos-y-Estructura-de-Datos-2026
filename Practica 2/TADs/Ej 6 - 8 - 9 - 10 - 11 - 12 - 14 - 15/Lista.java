public interface Lista<T>{

//	Metodos para Agregar Elementos

	public void insertarFin(T item);

	public void insertarInicio(T item);

	public void insertarPos(T item, int pos);

	//Metodos para Eliminar un Elemento

	public T eliminarUltimo();

	public T eliminarPrimero();

	public T eliminarPos(int pos);

	//Obtener un elemento

	public T obtenerPrimero();

	public T obtenerUltimo();

	public T obtenerElemPos(int pos);

	//Metodos Auxiliares

	public int buscar(T item);

	public int longitud();

	public boolean esVacia();

	public void imprimir();
}