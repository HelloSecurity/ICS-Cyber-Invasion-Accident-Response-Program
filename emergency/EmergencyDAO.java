package emergency;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import emergency.EmergencyItem;
import infringementAction.InfringementItem;
import scenario.ScenarioItem;
import util.DatabaseUtil;

public class EmergencyDAO {
   private Connection conn;
   private PreparedStatement pstmt;
   private ResultSet rs;

   public EmergencyDAO() {
      try {
			String dbURL = "jdbc:mysql://icsdatabase2.csqmh3rbxyia.ap-northeast-2.rds.amazonaws.com:3306/icsdatabase?serverTimezone=UTC";
          String dbID = "icsdatabase";
          String dbPassword = "icsdatabase";
         Class.forName("com.mysql.cj.jdbc.Driver");//127.0.0.1:3306/ics3?serverTimezone=UTC
         conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   public ArrayList<EmergencyItem> getList(int pageNumber){
       String SQL = "SELECT * FROM emergencytable";

       ArrayList<EmergencyItem> list = new ArrayList<EmergencyItem>();

       try {        
          pstmt = conn.prepareStatement(SQL);          
          rs = pstmt.executeQuery();
          
          while (rs.next()) {
             EmergencyItem item = new EmergencyItem();
             
             item.setId(rs.getInt(1));
             item.setIncident_name(rs.getString(2));
             item.setIncident_sum(rs.getString(4));
             item.setDamage_level(rs.getString(6));
             list.add(item);
          }
          
          rs.close();
       } catch (Exception e) {
          e.printStackTrace();
          
       } return list;
       
     }
   
   public EmergencyItem getEmergency_content(int id) {
        String sql = "SELECT * FROM emergencytable WHERE id =?";
              
         try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
               
               EmergencyItem item = new EmergencyItem();
               item.setId(rs.getInt(1));
               item.setIncident_name(rs.getString(2));
               item.setCyberattackpath(rs.getString(3));
              item.setIncident_sum(rs.getString(4));
              item.setIncident_content(rs.getString(5));
              item.setDamage_level(rs.getString(6));
              item.setYear(rs.getInt(7));
              item.setCountry(rs.getString(8));
              item.setCity(rs.getString(9));
              item.setAgency(rs.getString(10));
               
               return item;
            }
            
         } catch(Exception e) {
            e.printStackTrace();         
        
         }
         return null;
         
     }
   
   
   public int Write(EmergencyItem emergencyItem) {

      String SQL = "INSERT INTO emergencytable VALUES(NULL,?,?,?,?,?,?,?,?,?)";
      try {
         pstmt = conn.prepareStatement(SQL);
         pstmt.setString(1, emergencyItem.getIncident_name());
         pstmt.setString(2, emergencyItem.getCyberattackpath());
         pstmt.setString(3, emergencyItem.getIncident_sum());
         pstmt.setString(4, emergencyItem.getIncident_content());
         pstmt.setString(5, emergencyItem.getDamage_level());
         pstmt.setInt(6, emergencyItem.getYear());
         pstmt.setString(7, emergencyItem.getCountry());
         pstmt.setString(8, emergencyItem.getCity());
         pstmt.setString(9, emergencyItem.getAgency());


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
   

}