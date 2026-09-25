public class MemoryPair extends Pair{

 private int previousFst; // the previous value of x
 private int previousSnd; // the previous value of y

 /**
 * A basic constructor
 */
 public MemoryPair(){
 super(); // it calls to the super constructor
 previousFst = 0;
 previousSnd = 0;
}

 /**
 * Another constructor that takes two parameters
 */
public MemoryPair(int fst, int snd){
	super(fst, snd);
	previousFst = 0;
	previousSnd = 0;
}
 /**
 * It changes the x
 * @param v the new value
 */
@Override
public void setFst(int v){
	previousFst = getFst();
	super.setFst(v);
}

/*
* It changes the y
* @param v the new value
 */
@Override
public void setSnd(int v){
	previousSnd = getSnd();
	super.setSnd(v);
}

 /**
 * It recovers the old values of x and y
 */
public void recover(){
	setFst(previousFst);
	setSnd(previousSnd);
}

}// end of class