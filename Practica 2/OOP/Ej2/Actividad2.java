public class Actividad2{

	public static void main(String[] args){
		Persona[] personas = new Persona[20];

		Persona p1 = new Persona(11111111, "Juan", "Pérez");
		Persona p2 = new Persona(22222222, "María", "Gómez");
		Persona p3 = new Persona(33333333, "Carlos", "López");
		Persona p4 = new Persona(44444444, "Ana", "Martínez");
		Persona p5 = new Persona(55555555, "Luis", "Rodríguez");
		Persona p6 = new Persona(66666666, "Laura", "Fernández");
		Persona p7 = new Persona(77777777, "Diego", "García");
		Persona p8 = new Persona(88888888, "Sofía", "Romero");
		Persona p9 = new Persona(99999999, "Martín", "Torres");
		Persona p10 = new Persona(10101010, "Lucía", "Díaz");

		Estudiante e1 = new Estudiante(12345678, "Pedro", "Alonso", true, 8.5f, 15);
		Estudiante e2 = new Estudiante(23456789, "Valeria", "Sánchez", false, 6.0f, 5);
		Estudiante e3 = new Estudiante(34567890, "Andrés", "Ruiz", true, 9.2f, 20);
		Estudiante e4 = new Estudiante(45678901, "Camila", "Castro", true, 7.8f, 12);
		Estudiante e5 = new Estudiante(56789012, "Javier", "Morales", false, 5.5f, 3);
		Estudiante e6 = new Estudiante(67890123, "Paula", "Herrera", true, 8.0f, 18);
		Estudiante e7 = new Estudiante(78901234, "Facundo", "Rojas", true, 7.1f, 10);
		Estudiante e8 = new Estudiante(89012345, "Florencia", "Giménez", false, 4.5f, 2);
		Estudiante e9 = new Estudiante(90123456, "Tomás", "Navarro", true, 9.8f, 25);
		Estudiante e10 = new Estudiante(11223344, "Julieta", "Vidal", true, 8.3f, 14);

		// Agregando las instancias de Persona
		personas[0] = p1;
		personas[1] = p2;
		personas[2] = p3;
		personas[3] = p4;
		personas[4] = p5;
		personas[5] = p6;
		personas[6] = p7;
		personas[7] = p8;
		personas[8] = p9;
		personas[9] = p10;

// Agregando las instancias de Estudiante
		personas[10] = e1;
		personas[11] = e2;
		personas[12] = e3;
		personas[13] = e4;
		personas[14] = e5;
		personas[15] = e6;
		personas[16] = e7;
		personas[17] = e8;
		personas[18] = e9;
		personas[19] = e10;

		for (Persona p : personas){
			p.imprimir();
			System.out.println("-----------------");
		}
	}
}