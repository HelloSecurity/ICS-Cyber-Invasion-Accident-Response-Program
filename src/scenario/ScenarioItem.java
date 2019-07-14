package scenario;

public class ScenarioItem {
	private int id;	
	private String scenario_name;
	private String scenario_condition;
	private String asset_name;
	private String infringement_level;
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
	public String getInfringement_level() {
		return infringement_level;
	}
	public void setInfringement_level(String infringement_level) {
		this.infringement_level = infringement_level;
	}
	
	
}
