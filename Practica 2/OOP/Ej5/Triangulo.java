
public class Triangulo extends Figure{
	double base;
	double altura;

	public Triangulo(double base, double altura){
		this.base = base;
		this.altura = altura;
	}

	@Override
	public double area(){
		return (base/2)*altura;
	}

	@Override
	public double perimetro(){
		return base+altura+Math.sqrt(Math.pow(base,2)+Math.pow(altura,2)) ;
	}
}