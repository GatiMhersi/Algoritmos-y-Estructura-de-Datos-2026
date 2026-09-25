import java.util.List;

public class BubbleSort{

	public static void execute(List<Integer> listaTemporal){

		
		for(int j = 0 ; j < listaTemporal.size() - 1 ; j++){
			boolean cambios = false;
			for(int i = 0 ; i < listaTemporal.size() - 1 - j ; i++){
				int v1 = listaTemporal.get(i);
				int v2 = listaTemporal.get(i+1);
				int aux;
				if(v1>v2){
					aux = v1;
					int posv1 = i;
					int posv2 = i+1;
					listaTemporal.set(posv1, v2);
					listaTemporal.set(posv2, aux);
					cambios = true;
				}	
			}
			if (!cambios){
				break;
			}
		}
		
		

	}
}