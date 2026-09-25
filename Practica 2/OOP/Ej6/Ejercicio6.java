import java.util.List;
import java.util.ArrayList;

public class Ejercicio6 {

	public static void main(String[] args){
		List<Empleado> listaEmpleado = new ArrayList<>();
		listaEmpleado.add(new EmpleadoPorHora(200.2, 15.5, "Matias Ghersinich"));
		listaEmpleado.add(new EmpleadoPorHora(200.2, 15.5, "Matias Ghersinich"));
		listaEmpleado.add(new EmpleadoPorHora(200.2, 15.5, "Matias Ghersinich"));
		listaEmpleado.add(new EmpleadoPorHora(200.2, 15.5, "Matias Ghersinich"));

		for(Empleado empleado : listaEmpleado){
			empleado.calcularPago();
		}


	}
}