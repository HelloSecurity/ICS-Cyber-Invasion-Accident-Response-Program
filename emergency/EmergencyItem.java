package emergency;

public class EmergencyItem {
   
   int id;
   String incident_name;
   String cyberattackpath;
   String incident_sum;
   String incident_content;
   String damage_level;
   int year;
   String country;
   String city;
   String agency;
   
   public EmergencyItem(int id, String incident_name, String cyberattackpath, String incident_sum, String incident_content, String damage_level, int year, String country, String city, String agency) {
      this.id=id;
      this.incident_name=incident_name;
      this.cyberattackpath=cyberattackpath;
      this.incident_sum=incident_sum;
      this.incident_content=incident_content;
      this.damage_level=damage_level;
      this.year=year;
      this.country=country;
      this.city=city;
      this.agency=agency;
   }
   
   public EmergencyItem() {
      
   }

   public int getId() {
      return id;
   }

   public void setId(int id) {
      this.id = id;
   }

   public String getIncident_name() {
      return incident_name;
   }

   public void setIncident_name(String incident_name) {
      this.incident_name = incident_name;
   }

   public String getCyberattackpath() {
	      return cyberattackpath;
	   }

   public void setCyberattackpath(String cyberattackpath) {
	      this.cyberattackpath = cyberattackpath;
	   }
	   
   public String getIncident_sum() {
      return incident_sum;
   }

   public void setIncident_sum(String incident_sum) {
      this.incident_sum = incident_sum;
   }
   

   public String getIncident_content() {
      return incident_content;
   }

   public void setIncident_content(String incident_content) {
      this.incident_content = incident_content;
   }

   public String getDamage_level() {
      return damage_level;
   }

   public void setDamage_level(String damage_level) {
      this.damage_level = damage_level;
   }

   public int getYear() {
      return year;
   }

   public void setYear(int year) {
      this.year = year;
   }

   public String getCountry() {
      return country;
   }

   public void setCountry(String country) {
      this.country = country;
   }

   public String getCity() {
      return city;
   }

   public void setCity(String city) {
      this.city = city;
   }

   public String getAgency() {
      return agency;
   }

   public void setAgency(String agency) {
      this.agency = agency;
   }
   

}