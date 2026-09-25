public interface Cola<T>{

	void encolar(T item);

	void desencolar();

	boolean esVacia();

	void vaciar();
}