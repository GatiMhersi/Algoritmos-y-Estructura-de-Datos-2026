import java.util.ArrayList;
import java.util.List;

public class Ejercicio5{
	

	public static void main(String[] args){
		List<Figure> listaFiguras =  new ArrayList<>();
		double total = 0;
		
		listaFiguras.add(new Circulo(4.4));
		listaFiguras.add(new Rectangulo(4.4, 4.5));
		listaFiguras.add(new Triangulo(4.4, 4.5));

		for (Figure figura : listaFiguras){
			total += figura.area();
		}
		System.out.println("El area total de todas las figuras es: " + total);
	}
}