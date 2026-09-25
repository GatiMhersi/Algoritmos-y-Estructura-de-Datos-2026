public class Rectangulo extends Figure{
	double ancho;
	double alto;

	public Rectangulo(double ancho, double alto){
		this.ancho = ancho;
		this.alto = alto;
	}

	@Override
	public double area(){
		return ancho*alto;
	}

	@Override
	public double perimetro(){
		return 2*(ancho+alto);
	}
}