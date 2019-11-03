package infringementAction;

public class InfringementItem {
	private int id;
	private String training_type;
	private String training_schedule;
	private String training_place;
	private String training_division;
	private int scenario_no;
	private String date;
	private String name;
	

	public InfringementItem(int id, String training_type, String training_schedule, String training_place,
			String training_division, int scenario_no, String date, String name) {
		this.id = id;
		this.training_type = training_type;
		this.training_schedule = training_schedule;
		this.training_place = training_place;
		this.training_division = training_division;
		this.scenario_no = scenario_no;
		this.date = date;
		this.name = name;
	}

	public InfringementItem() {
	}




	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTraining_type() {
		return training_type;
	}

	public void setTraining_type(String training_type) {
		this.training_type = training_type;
	}

	public String getTraining_schedule() {
		return training_schedule;
	}

	public void setTraining_schedule(String training_schedule) {
		this.training_schedule = training_schedule;
	}

	public String getTraining_place() {
		return training_place;
	}

	public void setTraining_place(String training_place) {
		this.training_place = training_place;
	}

	public String getTraining_division() {
		return training_division;
	}

	public void setTraining_division(String training_division) {
		this.training_division = training_division;
	}

	public int getScenario_no() {
		return scenario_no;
	}

	public void setScenario_no(int scenario_no) {
		this.scenario_no = scenario_no;
	}
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}