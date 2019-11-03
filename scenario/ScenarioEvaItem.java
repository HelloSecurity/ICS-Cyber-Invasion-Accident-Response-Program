package scenario;

public class ScenarioEvaItem {
    private int id;   
    private String scenario_name;
    private int infringement_level;
    private String asset_name;
    private String scenario_condition;
    private String scenario_sum;
    private String scenario_content;
    //19.07.28 generate
    private String eva_complete;
    private String accuracy;
    private String feasibility;
    private String efficiency;
    private String complete;
    private String visibility;
    
    

   
   public ScenarioEvaItem(int id, String scenario_name, int infringement_level, String asset_name, String scenario_condition,String scenario_sum,
   String scenario_content, String eva_complete, String accuracy, String feasibility, String efficiency, String complete, String visibility) {
         this.id = id;
         this.scenario_name = scenario_name;
         this.infringement_level = infringement_level;
         this.asset_name = asset_name;
         this.scenario_condition = scenario_condition;
         this.scenario_sum=scenario_sum;
         this.scenario_content=scenario_content;
         this.eva_complete=eva_complete;
         this.accuracy=accuracy;
         this.feasibility=feasibility;
         this.efficiency=efficiency;
         this.complete=complete;
         this.visibility=visibility;
         }
   
   public void SetEvaluation(String eva_complete, String accuracy, String feasibility, String efficiency, String complete, String visibility) {               
               this.eva_complete=eva_complete;
               this.accuracy=accuracy;
               this.feasibility=feasibility;
               this.efficiency=efficiency;
               this.complete=complete;
               this.visibility=visibility;
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
   
   //19.07.28 generate
   public String getEva_complete() {
      return eva_complete;
   }
   
   public void setEva_complete(String eva_complete) {
      this.eva_complete = eva_complete;
   }
   
   

   public String getComplete() {
      return complete;
   }

   public void setComplete(String complete) {
      this.complete = complete;
   }

   
   public String getAccuracy() {
      return accuracy;
   }

   public void setAccuracy(String accuracy) {
      this.accuracy = accuracy;
   }

   public String getFeasibility() {
      return feasibility;
   }

   public void setFeasibility(String feasibility) {
      this.feasibility = feasibility;
   }

   public String getEfficiency() {
      return efficiency;
   }

   public void setEfficiency(String efficiency) {
      this.efficiency = efficiency;
   }

   public String getVisibility() {
      return visibility;
   }

   public void setVisibility(String visibility) {
      this.visibility = visibility;
   }

  public ScenarioEvaItem() {
	  
  };
}