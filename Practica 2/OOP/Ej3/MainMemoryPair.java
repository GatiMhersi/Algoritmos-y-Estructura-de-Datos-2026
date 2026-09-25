public class MainMemoryPair {
	public static void main(String[] args) {
		Pair p = new Pair(5,6);
		System.out.println("p Fst:"+p.getFst());
		System.out.println("p Snd:"+p.getSnd());
		MemoryPair mp = new MemoryPair(3,4);
		mp.setFst(10);
		mp.setSnd(10);
		System.out.println("mp Fst:"+mp.getFst());
		System.out.println("mp Snd:"+mp.getSnd());
		mp.recover();
		System.out.println("mp Fst:"+mp.getFst());
		System.out.println("mp Snd:"+mp.getSnd());
 p = mp; // se puede hacer porque mp es una subclase
 // mp = p no se puede hacer!
}
}