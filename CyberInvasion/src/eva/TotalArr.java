package eva;

class TotalArr {
	private static int size;
	private String id;
	private int sum;
	
	public TotalArr(String id) {
		this.id=id;
		this.sum=0;
		size=0;
	}
	
	public static int getSize() {
		return size;
	}

	public static void setSize(int num) {
		size = num;
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getSum() {
		return this.sum;
	}
	
	public void add(int x) {
		this.sum += x;
	}

}
