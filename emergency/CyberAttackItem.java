package emergency;

public class CyberAttackItem {
	
	int id;
	String category;
	String no;
	String control_item_field;
	String control_item_no;
	String control_item;

	public CyberAttackItem(int id, String category, String no, String control_item_field,
			String control_item_no, String control_item) {
		// TODO Auto-generated constructor stub
		this.id=id;
		this.category=category;
		this.no=no;
		this.control_item_field=control_item_field;
		this.control_item_no=control_item_no;
		this.control_item=control_item;
		
	}
	
	public CyberAttackItem() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getControl_item_field() {
		return control_item_field;
	}

	public void setControl_item_field(String control_item_field) {
		this.control_item_field = control_item_field;
	}

	public String getControl_item_no() {
		return control_item_no;
	}

	public void setControl_item_no(String control_item_no) {
		this.control_item_no = control_item_no;
	}

	public String getControl_item() {
		return control_item;
	}

	public void setControl_item(String control_item) {
		this.control_item = control_item;
	}
	
	

}
