package c;

import b.O;

public class Client {
	public void test() {
		O o = new O();
		o.doit();
	}

	public static void main(String[] args) {
		new Client().test();
	}
}