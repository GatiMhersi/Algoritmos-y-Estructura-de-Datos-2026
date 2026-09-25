public class ColaConArregloCircular implements Cola<Integer>{

	private int[] cola ;
	private int inicio;
	private int fin;
	private int cantidadActual;
	private int cantidadMaxima;

	public ColaConArregloCircular(int cantidad){
		inicio = 0;
		fin = 0;
		cola = new int[cantidad];
		cantidadMaxima = cantidad;
		cantidadActual = 0;
	}	

	public void encolar(int item){
		if(estaLlena()) throw new IllegalStateException("Maxima Capacidad");
			cola[fin] = item;
			fin = ((fin+1) %cantidadMaxima);
			cantidadActual++;	
		
	}

	public void desencolar(){
		if(esVacia()) throw new IllegalStateException("Cola Vacia");
		cola[inicio] = 0;
		inicio = ((inicio+1)%cantidadMaxima);
		cantidadActual--;
	}

	public boolean esVacia(){
		return cantidadActual == 0;
	}

	public boolean estaLlena(){
		return cantidadActual == cantidadMaxima;
	}

	public void imprimir(){
		int aux = inicio;
        for (int i = 0; i < cantidadActual; i++) {
            System.out.println(cola[aux]);
            aux = (aux + 1) % cantidadMaxima;
        }
	}

	




}