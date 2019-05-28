package scenario;

public class ScenarioItem {
	 int id;	
	 String scenario_name;
	 int infringement_level;
	String asset_name;
	 String scenario_condition;
	 String scenario_sum;
	String scenario_content;
	
	public ScenarioItem(int id, String scenario_name, int infringement_level, String asset_name, String scenario_condition,String scenario_sum,
	String scenario_content) {
	      this.id = id;
	      this.scenario_name = scenario_name;
	      this.infringement_level = infringement_level;
	      this.asset_name = asset_name;
	      this.scenario_condition = scenario_condition;
	      this.scenario_sum=scenario_sum;
	      this.scenario_content=scenario_content;
		   }

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getScenario_name() {
		return scenario_name;
	}
	public void setScenario_name(String scenario_name) {
		this.scenario_name = scenario_name;
	}
	public String getScenario_condition() {
		return scenario_condition;
	}
	public void setScenario_condition(String scenario_condition) {
		this.scenario_condition = scenario_condition;
	}
	public String getAsset_name() {
		return asset_name;
	}
	public void setAsset_name(String asset_name) {
		this.asset_name = asset_name;
	}
	public int getInfringement_level() {
		return infringement_level;
	}
	public void setInfringement_level(int infringement_level) {
		this.infringement_level = infringement_level;
	}
	public String getScenario_sum() {
		return scenario_sum;
	}
	public void setScenario_sum(String scenario_sum) {
		this.scenario_sum =scenario_sum;
	}
	public String getScenario_content() {
		return scenario_content;
	}
	public void setScenario_content(String scenario_content) {
		this.scenario_content = scenario_content;
	}
	  public ScenarioItem(){ //기본 생성자
		     
	  };
}

