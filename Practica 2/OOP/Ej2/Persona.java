public class Persona {
	private int dni;
	private String nombre;
	private String apellido;

	public Persona(int dni, String nombre, String apellido){
		this.dni = dni;
		this.nombre = nombre;
		this.apellido = apellido;
	}

	public void imprimir(){
		System.out.println("Ficha de " + apellido + ", " + nombre);
		System.out.println("DNI: " + dni);
	}

	@Override
	public String toString(){
		return "Dni: " + dni + " - Nombre: " + apellido + ", " + nombre;
	}
 	
}