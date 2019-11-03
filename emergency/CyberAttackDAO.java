package emergency;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import emergency.EmergencyItem;
import eva.ControlItemDo;
import infringementAction.InfringementItem;


public class CyberAttackDAO {
	 private Connection conn;
	   private PreparedStatement pstmt;
	   private ResultSet rs;

	public CyberAttackDAO() {
		// TODO Auto-generated constructor stub
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
	
	
	public ArrayList<CyberAttackItem> getCyberAttack_content(String no) {
	    ArrayList<CyberAttackItem> datas = new ArrayList<CyberAttackItem>(); 
		String sql = "SELECT * FROM cyberattack WHERE no = ?";
	           
	      try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, no);
	         ResultSet rs = pstmt.executeQuery();
	         
	         while (rs.next()) {        
	        	CyberAttackItem item = new CyberAttackItem();
	            item.setId(rs.getInt("id"));
	            item.setCategory(rs.getString("category"));
	            item.setNo(rs.getString("no"));
	            item.setControl_item_field(rs.getString("control_item_field"));
	            item.setControl_item_no(rs.getString("control_item_no"));
	            item.setControl_item(rs.getString("control_item"));
	            datas.add(item);
	            
	         }
	         
	      } catch(Exception e) {
	         e.printStackTrace();         
	     
	      }
	      return datas;
	      
	  }
	
	
	
	

}
