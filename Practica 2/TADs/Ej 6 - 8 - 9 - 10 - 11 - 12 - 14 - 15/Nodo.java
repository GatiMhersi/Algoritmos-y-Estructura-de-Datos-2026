public class Nodo<T> {
	public T dato;
	public Nodo<T> siguiente;

	public Nodo(T item) {
		this.dato = item;
		this.siguiente = null;
	}
}