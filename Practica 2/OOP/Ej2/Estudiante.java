public class Estudiante extends Persona{
	private boolean esRegular;
	private float promedio;
	private int cantidadMateriasAprobadas;

	public Estudiante(int dni, String nombre, String apellido, boolean esRegular, float promedio, int cantidadMateriasAprobadas){
		super(dni, nombre, apellido);
		this.esRegular = esRegular;
		this.promedio = promedio;
		this.cantidadMateriasAprobadas = cantidadMateriasAprobadas;
	}
	@Override
	public void imprimir(){

		super.imprimir();
		System.out.println("Es un Estudiante");
		System.out.println( esRegular? "Alumno Regular" : "Alumno No Regular");
		System.out.println("Promedio: " + promedio);
		System.out.println("Materias Aprobadas: " + cantidadMateriasAprobadas);
	}

	public void aproboMateria(int nota){
		cantidadMateriasAprobadas++;		
		promedio = (promedio + nota) / 2;
	}
 
}