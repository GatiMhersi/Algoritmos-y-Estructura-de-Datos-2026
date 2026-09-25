public class Circulo extends Figure{
	double radio;
	final double PI = 3.14;

	public Circulo(double radio){
		this.radio = radio;
	}

	@Override
	public double area(){
		return PI*radio*radio;
	}

	@Override
	public double perimetro(){
		return 2*PI*radio;
	}

}