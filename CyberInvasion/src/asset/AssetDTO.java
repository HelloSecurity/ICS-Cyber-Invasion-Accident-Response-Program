package asset;

public class AssetDTO {
    int no;
    String asset_name;
    int priority;
    int account_manage;
    int encryption;
    int logging;
    int external_connect;
    String asset_type;
    String inter_face;
    String protocol;
    String os_type;
    String usages; 
   

  public AssetDTO(int no, String asset_name, int priority, int account_manage, int encryption,
         int logging, int external_connect, String asset_type, String inter_face, String protocol,
         String os_type, String usages) {
      this.no = no;
      this.asset_name = asset_name;
      this.priority = priority;
      this.account_manage = account_manage;
      this.encryption = encryption;
      this.logging = logging;
      this.external_connect = external_connect;
      this.asset_type = asset_type;
      this.inter_face = inter_face;
      this.protocol = protocol;
      this.os_type = os_type;
      this.usages = usages;
   }
  
public int getNo() {
      return no;
   }
   public void setNo(int no) {
      this.no = no;
   }
    
   public String getAsset_name() {
      return asset_name;
   }
   public void setAsset_name(String asset_name) {
      this.asset_name = asset_name;
   }
   public int getPriority() {
      return priority;
   }
   public void setPriority(int priority) {
      this.priority = priority;
   }
   public int getAccount_manage() {
      return account_manage;
   }
   public void setAccount_manage(int account_manage) {
      this.account_manage = account_manage;
   }
   public int getEncryption() {
      return encryption;
   }
   public void setEncryption(int encryption) {
      this.encryption = encryption;
   }
   public int getLogging() {
      return logging;
   }
   public void setLogging(int logging) {
      this.logging = logging;
   }
   public int getExternal_connect() {
      return external_connect;
   }
   public void setExternal_connect(int external_connect) {
      this.external_connect = external_connect;
   }
   public String getAsset_type() {
      return asset_type;
   }
   public void setAsset_type(String asset_type) {
      this.asset_type = asset_type;
   }
   public String getInter_face() {
      return inter_face;
   }
   public void setInter_face(String inter_face) {
      this.inter_face = inter_face;
   }
   public String getProtocol() {
      return protocol;
   }
   public void setProtocol(String protocol) {
      this.protocol = protocol;
   }
   public String getOs_type() {
      return os_type;
   }
   public void setOs_type(String os_type) {
      this.os_type = os_type;
   }
   public String getUsages() {
      return usages;
   }
   public void setUsages(String usages) {
      this.usages = usages;
   }


  public AssetDTO(){ //기본 생성자
     
  };
   


}