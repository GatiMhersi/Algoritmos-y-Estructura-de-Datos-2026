public class Greeting {
    public static void main(String[] args) {
        if (args.length > 0) {
            String name = args[0];
            System.out.println("Hello, " + name + "! Welcome to Java!");
        } else {
            System.out.println("Please run the program with your name as an argument.");
        }
    }
}


/**
 * A) java Greeting
 * 
 * se imprime por consola:
 * "Please run the program with your name as an argument."
 * 
 * B) java Greeting Pablo
 * 
 * seimprime por consola:
 *"Hello, Pablo! Welcome to Java!"
 *
 * C) java Greeting Matias
 * 
 * seimprime por consola:
 * "Hello, Matias! Welcome to Java!"
 * */
