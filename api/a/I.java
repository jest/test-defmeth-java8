package a;

public interface I {

	default void doit() {
		System.out.println("In I");
	}
	
}