public class HelloWorld {
	public static void main ( String [] args ) {
		System . out . println ( " H e l l o W o r l d f r o m J a v a ! " ) ;
	}
}

/**
 * Codigo Inicial
 * 
public class HelloWorld {
	public static void main ( String [] args ) {
		System . out . println ( " H e l l o W o r l d f r o m J a v a ! " ) ;
	}
}

Funciona
**/

/**
 * Ejercicio A
 * Cambiar main por principal
 * 
 * error porque no encuentra el punto de acceso
 * el programa necesita un metodo main para saber por
 * donde debe arrancar 
 * 
 * public class HelloWorld {
	public static void main ( String [] args ) {
		System . out . println ( " H e l l o W o r l d f r o m J a v a ! " ) ;
	}
}
**/




/**
 *  Ejercicio B
 * Da error en versiones anteriores
 * en la LTS 25 no
 * pero no deja de ser buena practica utilizarlo por
 * compatibilidad entre JVM
 * 
public class HelloWorld {
	public void main ( String [] args ) {
		System . out . println ( " H e l l o W o r l d f r o m J a v a ! " ) ;
	}
}
**/

/**
 * Ejercicio C
 * Cambiar void por int
 * 
 * Error: Could not find or load main class HelloWorld.class
Caused by: java.lang.ClassNotFoundException: HelloWorld.class
(El error se mantiene cuando retornamos un int)

public class HelloWorld {
	public static int main ( String [] args ) {
		System . out . println ( " H e l l o W o r l d f r o m J a v a ! "
	) ;
	return 0;
	}
}

**/

/**
 * 
 * Ejercicio D
 * Bonus: Renombra el nombre del archivo de ”HelloWorld.java” a 
 * ”HolaMundo.java”,guarda los cambios, compila y ejecuta. 
 * Da alg´un mensaje de error? Fue en el momento de compilaci´on 
 * o ejecuci´on?
 * 
 * Probe ccambiandole el nombre pero como el nombre de la clase debe ser el
 * nombre del archivo, seguido por un .java
 * 
 * El error que me dio fue este:
 *	"HolaMundo.java:51: error: class HelloWorld is public, 
 * should be declared in a file named HelloWorld.java"
**/
