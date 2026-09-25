	public class Pair{
		private int fst;
		private int snd;

	 /**
	 * Constructor of the class
	 **/
		public Pair(){
			fst = 0;
			snd = 0;
		}
		
	 /**
	 * Constructor of the class
	 * @param x the first component
	 * @param y the second component
	 * @precondition true
	 * @postcondition creates the new object
	 **/
		public Pair(int fst, int snd){
			this.fst = fst;
			this.snd = snd;
		}

	 /**
	 * Get the first coordinate
		 * @return the first value of the pair
	 * @precondition true
	 * @postcondition return the first item
	 **/
		public int getFst(){
			return this.fst;
		}

	 /**
	 * Get the second coordinate
	 * @return the second value of the pair
	 * @precondition true
	 * @postcondition return the second value.
	 **/
		public int getSnd(){
			return this.snd;
		}

	 /**
	 * Change the first coordinate
	 * @param x change the first value
	 * @precondition true
	 * @postcondition change x
	 **/
		public void setFst(int fst){
			this.fst = fst;
		}

	 /**
	 * Change the second coordinate
	 * @param y change the second value
	 * @precondition true
	 * @postcondition change the second value
	 **/
		public void setSnd(int snd){
			this.snd = snd;
		}

	}