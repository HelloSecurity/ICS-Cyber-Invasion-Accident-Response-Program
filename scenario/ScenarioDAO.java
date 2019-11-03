package scenario;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.sql.SQLException;
import asset.AssetDAO;
import asset.AssetDTO;
import result.Result;
import util.DatabaseUtil;
import scenario.ScenarioItem;
import scenario.ScenarioEvaItem;
import user.UserDAO;
import user.User;

public class ScenarioDAO {
   
   Connection conn;
   PreparedStatement pstmt;
   ResultSet rs;
   

  public ScenarioDAO() {
     try {
       //String dbURL = "jdbc:mysql://127.0.0.1:3306/ics2?serverTimezone=UTC";
			String dbURL = "jdbc:mysql://icsdatabase2.csqmh3rbxyia.ap-northeast-2.rds.amazonaws.com:3306/icsdatabase?serverTimezone=UTC";
        String dbID = "icsdatabase";
        String dbPassword = "icsdatabase";
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
     } catch (Exception e) {
        e.printStackTrace();
     }
  }
  
  
  public ArrayList<String> getScenarioIdlist() { //getAssetlist 占쎈쑓占쎌뵠占쎄숲�몴占� 占쎈떄占쎄퐣占쏙옙嚥∽옙 String 獄쏄퀣肉댐옙肉� 占쎄퐫占쎌벉
      ArrayList<String> datas = new ArrayList<String>(); //String 揶쏆빘猿� 占쎄문占쎄쉐
      
      String SQL="SELECT id FROM scenarioitem"; //SQL �뜎�눖�봺�눧占�
      try {
         pstmt = conn.prepareStatement(SQL);
         ResultSet rs = pstmt.executeQuery();
         
         while(rs.next()) {
            datas.add(rs.getString("id")); //asset_name 占쎈쑓占쎌뵠占쎄숲 揶쏉옙占쎌죬占쎌궎疫뀐옙
            
         }

         rs.close();
         
      }catch(Exception e) {
         e.printStackTrace();
      }
      
      return datas;
      
   }
  public ArrayList<ScenarioItem>  getScenariolist() {
     ArrayList<ScenarioItem> datas = new ArrayList<ScenarioItem>();
     String SQL = "SELECT * FROM scenarioitem";
     
     try {
        pstmt = conn.prepareStatement(SQL);
        ResultSet rs = pstmt.executeQuery();
        
        while (rs.next()) {
           ScenarioItem item = new ScenarioItem();
           
           item.setId(rs.getInt("id"));
           item.setScenario_name(rs.getString("scenario_name"));
           item.setScenario_condition(rs.getString("scenario_condition"));
           item.setAsset_name(rs.getString("asset_name"));
           item.setInfringement_level(rs.getInt("infringement_level"));
           item.setScenario_sum(rs.getString("scenario_sum"));
           item.setScenario_content(rs.getString("scenario_content"));
           item.setEva_complete(rs.getString("eva_complete"));
             
           datas.add(item);

        }
        
        rs.close();
     } catch (Exception e) {
        e.printStackTrace();
     }
   return datas;
  }
 
 
  public ArrayList<ScenarioDAO> getScenario() {
        ArrayList<ScenarioDAO> datas = new ArrayList<ScenarioDAO>();
        return datas;
  }
 
   public ArrayList<ScenarioItem> getScenariolist(String keyField,String keyWord) {
      ArrayList<ScenarioItem> list = new ArrayList<ScenarioItem>();
      
      try {
         String sql = "SELECT * FROM scenarioitem ";
         
         if(keyField != null&& !keyField.equals("")) {
            sql +="WHERE "+keyField+'='+'"'+keyWord+'"'+";";
         } else {
            sql +="" +"order by id";
         }
         
         System.out.println("sql = " + sql);
         pstmt = conn.prepareStatement(sql);
         ResultSet rs = pstmt.executeQuery(sql);
         System.out.println(rs);
         
         while(rs.next()) {
            ScenarioItem scenarioItem = new ScenarioItem();
            
            scenarioItem.setId(rs.getInt(1));
            scenarioItem.setScenario_name(rs.getString(2));
            scenarioItem.setInfringement_level(rs.getInt(3));
            
            list.add(scenarioItem);
            //System.out.println(list);
            
         }
      } catch(Exception e) {
         System.out.println(e+"=> getMemberlist fail");         
      } finally {
         db_close();
      }
      
      return list;
      
   }
   
   public void db_close(){
         
          try {
             
              if (rs != null ) rs.close();
              if (pstmt != null ) pstmt.close();      
         
          } catch (SQLException e) {
              System.out.println(e+"=> �떕湲� �삤瑜�");
          }  
         
         
      } //db_close
     
 
  public int ScenarioWrite(ScenarioItem scenarioItem) {
     String SQL = "INSERT INTO scenarioitem VALUES(NULL,?,?,?,?,?,?,NULL,NULL,NULL,NULL,NULL,NULL)";
     
     try {
        
        pstmt = conn.prepareStatement(SQL);
        //pstmt.setInt(1, scenarioItem.getId());
        pstmt.setString(1, scenarioItem.getScenario_name());
        pstmt.setInt(2, scenarioItem.getInfringement_level());
        pstmt.setString(3, scenarioItem.getAsset_name());
        pstmt.setString(4, scenarioItem.getScenario_condition());
        pstmt.setString(5, scenarioItem.getScenario_sum());
        pstmt.setString(6, scenarioItem.getScenario_content());
         
        return pstmt.executeUpdate();     
     } catch (Exception e) {
        e.printStackTrace();
     } finally {
        try {
           if (conn != null)
              conn.close();     
        } catch (Exception e) {
           e.printStackTrace();
        }
        
        try {
           if (pstmt != null)
              pstmt.close();
        } catch (Exception e) {
           e.printStackTrace();
        }
        try {
           if (rs != null)
              rs.close();           
        } catch (Exception e) {
           e.printStackTrace();
        }
     }
     return -1;
  }
  
  /*
 
  public int ScenarioDelete(ScenarioItem scenarioItem) {
     return 0;
  }
  
  public ArrayList<ScenarioItem>  getSpecificScenariolist2(ScenarioItem scenarioItem)  {
     ArrayList<ScenarioItem> datas = new ArrayList<ScenarioItem>();
     String SQL = "SELECT * FROM scenarioitem WHERE id=?";
     
     try {
        int ID = scenarioItem.id;
        String IDS = String.valueOf(ID);
        IDS = IDS.replaceAll("UNION", "");
        IDS = IDS.replaceAll("SELECT", "");
        IDS=IDS.replaceAll("INSERT","");
          IDS=IDS.replaceAll("drop","");
          IDS=IDS.replaceAll("update","");
          IDS=IDS.replaceAll("and","");
          IDS=IDS.replaceAll("or","");
          IDS=IDS.replaceAll("where","");

          System.out.println(IDS = "IDS");
          
          pstmt = conn.prepareStatement(SQL);
          pstmt.setString(1, IDS);
          
          ResultSet rs = pstmt.executeQuery(IDS);
          
          while (rs.next()) {
             ScenarioItem item = new ScenarioItem();
             item.setId(rs.getInt("id"));
             item.setScenario_name(rs.getString("scenario_name"));
              item.setScenario_condition(rs.getString("scenario_condition"));
              item.setAsset_name(rs.getString("asset_name"));
              item.setInfringement_level(rs.getInt("infringement_level"));
              item.setScenario_sum(rs.getString("scenario_sum"));
              item.setScenario_content(rs.getString("scenario_content"));
              datas.add(item);
          }
          
          rs.close();

     } catch (Exception e) {
        e.printStackTrace();
     }
     
     return datas;
    
  }
  
  */
  
  //190728 generate
  public ScenarioEvaItem getScenario_content(int id) {
     String sql = "SELECT * FROM scenarioitem WHERE id =?";
           
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, id);
         ResultSet rs = pstmt.executeQuery();
         
         if (rs.next()) {
            
            ScenarioEvaItem item = new ScenarioEvaItem();
            item.setId(rs.getInt("id"));
            item.setScenario_name(rs.getString("scenario_name"));
            item.setScenario_condition(rs.getString("scenario_condition"));
            item.setAsset_name(rs.getString("asset_name"));
            item.setInfringement_level(rs.getInt("infringement_level"));
            item.setScenario_sum(rs.getString("scenario_sum"));
            item.setScenario_content(rs.getString("scenario_content"));
            item.setEva_complete(rs.getString("eva_complete"));
            item.setAccuracy(rs.getString("accuracy"));
            item.setFeasibility(rs.getString("feasibility"));
            item.setEfficiency(rs.getString("efficiency"));
            item.setComplete(rs.getString("complete"));
            item.setVisibility(rs.getString("visibility"));
            
            return item;
         }
         
      } catch(Exception e) {
         e.printStackTrace();         
     
      }
      return null;
      
  }
  
  
  
  public ArrayList<ScenarioEvaItem> getList(int pageNumber){
     String SQL = "SELECT * FROM scenarioitem";

     ArrayList<ScenarioEvaItem> list = new ArrayList<ScenarioEvaItem>();

     try {        
        pstmt = conn.prepareStatement(SQL);
        //pstmt.setInt(1,  getNext() - (pageNumber - 1) * 10);
        rs = pstmt.executeQuery();
        
        while (rs.next()) {
           ScenarioEvaItem item = new ScenarioEvaItem();
           
           item.setId(rs.getInt(1));
           item.setScenario_name(rs.getString(2));
           item.setInfringement_level(rs.getInt(3));
           item.setAsset_name(rs.getString(4));
           item.setScenario_condition(rs.getString(5));          
           item.setScenario_sum(rs.getString(6));
           item.setScenario_content(rs.getString(7));
           item.setEva_complete(rs.getString(8));
             //19.09.12 媛믪뿬遺��뿉 �뵲�씪 �떎瑜닿쾶 蹂댁씠湲� �쐞�빐 異붽�
           //19.09.17 �룊媛�湲곗� 蹂�寃�
           item.setAccuracy(rs.getString("accuracy"));
           item.setFeasibility(rs.getString("feasibility"));
           item.setEfficiency(rs.getString("efficiency"));
           item.setComplete(rs.getString("complete"));
           item.setVisibility(rs.getString("visibility"));
             
           list.add(item);

        }
        
        rs.close();
     } catch (Exception e) {
        e.printStackTrace();
        
     } return list;
     
   }
   
   
  
 
  
  public int getNext() {
     String SQL = "SELECT id FROM scenarioitem ORDER BY id DESC";
     try {
        pstmt = conn.prepareStatement(SQL);
        rs = pstmt.executeQuery();
        if (rs.next()) {
           return rs.getInt(1) +1;
        }
        return 1;
        
     } catch (Exception e)  {
        e.printStackTrace();
     }
     
     return -1;
  }
  
  public int insertEvaluation(ScenarioEvaItem scenarioEvaItem) {
     String SQL = "UPDATE scenarioitem SET complete=?, responsibility=? WHERE id=?";
     try {
        
        conn = DatabaseUtil.getConnection();
        pstmt = conn.prepareStatement(SQL);
        //19.09.17 �룊媛�湲곗� 蹂�寃�
        pstmt.setString(9, scenarioEvaItem.getAccuracy().toString());
        pstmt.setString(10, scenarioEvaItem.getFeasibility().toString());
        pstmt.setString(11, scenarioEvaItem.getEfficiency().toString());
        pstmt.setString(12, scenarioEvaItem.getComplete().toString());
        pstmt.setString(13, scenarioEvaItem.getVisibility().toString());
        System.out.println();
         
         pstmt.executeUpdate();

        
     } catch (Exception e) {
        e.printStackTrace();
        System.out.println(e);
        
     } 
     return -1;           
     
  }
  
       
}