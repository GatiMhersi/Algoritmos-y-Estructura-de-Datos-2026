public class EmpleadoMensual extends Empleado{
	
	public EmpleadoMensual(String nombre, double salarioTotal){
		this.nombre = nombre;
		this.salarioTotal= salarioTotal;
	}

	public void calcularPago(){
		System.out.println(nombre + " --- $" + salarioTotal);
	}
}