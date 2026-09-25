public class EmpleadoPorHora extends Empleado {
	double horasTrabajadas;
	double tarifaPorHora;

	public EmpleadoPorHora(double horasTrabajadas, double tarifaPorHora, String nombre){
		this.horasTrabajadas = horasTrabajadas;
		this.tarifaPorHora = tarifaPorHora;
		this.nombre = nombre;
		this.salarioTotal = horasTrabajadas * tarifaPorHora;
	}

	@Override
	public void calcularPago(){
		System.out.println(nombre + " --- $" + salarioTotal);
	}
}