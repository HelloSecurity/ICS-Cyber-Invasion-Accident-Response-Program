package scenario;

public class ScenarioEvaItem {
	private int seq;
	private int id;	
	private String scenario_list;
	private String standard_reliability;
	private String standard_perfection;
	private String standard_efficiency;
	private String application;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getScenario_list() {
		return scenario_list;
	}
	public void setScenario_list(String scenario_list) {
		this.scenario_list = scenario_list;
	}
	
	public String getStandard_reliability() {
		return standard_reliability;
	}
	public void setStandard_reliability(String standard_reliability) {
		this.standard_reliability = standard_reliability;
	}
	public String getStandard_perfection() {
		return standard_perfection;
	}
	public void setStandard_perfection(String standard_perfection) {
		this.standard_perfection = standard_perfection;
	}
	public String getStandard_efficiency() {
		return standard_efficiency;
	}
	public void setStandard_efficiency(String standard_efficiency) {
		this.standard_efficiency = standard_efficiency;
	}
	public String getApplication() {
		return application;
	}
	public void setApplication(String application) {
		this.application = application;
	}
	
}
