package infringementAction;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import infringementAction.InfringementDAO;
import infringementAction.InfringementItem;
import asset.AssetDAO;
import scenario.ScenarioDAO;
import scenario.ScenarioItem;
import scenario.ScenariostageItem;
import util.DatabaseUtil;

public class InfringementDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public InfringementDAO() {
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

	public ArrayList<String> getInfringementNum() { // getAssetlist �뜲�씠�꽣瑜� �닚�꽌��濡� String 諛곗뿴�뿉 �꽔�쓬
		ArrayList<String> datas = new ArrayList<String>(); // String 媛앹껜 �깮�꽦

		String SQL = "SELECT scenario_no FROM infringementitem"; // SQL 荑쇰━臾�
		try {
			pstmt = conn.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				datas.add(rs.getString("scenario_no")); // asset_name �뜲�씠�꽣 媛��졇�삤湲�

			}

			rs.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return datas;

	}

	public ArrayList<InfringementDAO> getInfringement() {
		ArrayList<InfringementDAO> datas = new ArrayList<InfringementDAO>();
		return datas;
	}

	public ArrayList<InfringementItem> getInfringementlist() {
		ArrayList<InfringementItem> datas = new ArrayList<InfringementItem>();
		String SQL = "SELECT * FROM infringementitem";
		try {
			pstmt = conn.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				InfringementItem item = new InfringementItem();

				item.setId(rs.getInt("id"));
				item.setTraining_type(rs.getString("training_type"));
				item.setTraining_schedule(rs.getString("training_schedule"));
				item.setTraining_place(rs.getString("training_place"));
				item.setTraining_division(rs.getString("training_division"));
				item.setScenario_no(rs.getInt("scenario_no"));
				item.setDate(rs.getString("date"));
				item.setName(rs.getString("name"));
				datas.add(item);
			}

			rs.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return datas;
	}

	public ArrayList<InfringementItem> getInfringementlist(String keyField, String keyWord) {

		ArrayList<InfringementItem> list = new ArrayList<InfringementItem>();

		try {// �떎�뻾

			String sql = "select * from infringementitem ";

			if (keyField != null && !keyField.equals("")) {
				sql += "WHERE " + keyField + '=' + '"' + keyWord + '"' + ";";
			} else {// 紐⑤뱺 �젅肄붾뱶 寃��깋
				sql += "order by id";
			}

			System.out.println("sql = " + sql);
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(sql);
			System.out.println(rs);

			while (rs.next()) {
				InfringementItem infringementItem = new InfringementItem();

				infringementItem.setId(rs.getInt(1));
				infringementItem.setTraining_type(rs.getString(2));

				list.add(infringementItem);
				// System.out.println(list);

			}
		} catch (Exception e) {
			System.out.println(e + "=> getMemberlist fail");
		} finally {
			db_close();
		}
		return list;
	}

	public void db_close() {

		try {

			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();

		} catch (SQLException e) {
			System.out.println(e + "=> �떕湲� �삤瑜�");
		}

	} // db_close

	public int Write(InfringementItem infringementItem) {

		String SQL = "INSERT INTO infringementitem VALUES(NULL,?,?,?,?,?,?,?)";
		try {
			
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, infringementItem.getTraining_type());
			pstmt.setString(2, infringementItem.getTraining_schedule());
			pstmt.setString(3, infringementItem.getTraining_place());
			pstmt.setString(4, infringementItem.getTraining_division());
			pstmt.setInt(5, infringementItem.getScenario_no());
			pstmt.setString(6, infringementItem.getDate());
			pstmt.setString(7, infringementItem.getName());


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
		return -1; // �뜲�씠�꽣踰좎씠�뒪 �삤瑜�

	}
	
	public ArrayList<InfringementItem> getList(int pageNumber){
	     String SQL = "SELECT * FROM infringementitem";

	     ArrayList<InfringementItem> list = new ArrayList<InfringementItem>();

	     try {        
	        pstmt = conn.prepareStatement(SQL);
	        //pstmt.setInt(1,  getNext() - (pageNumber - 1) * 10);
	        rs = pstmt.executeQuery();
	        
	        while (rs.next()) {
	           InfringementItem item = new InfringementItem();
	           
	           item.setId(rs.getInt(1));
	           item.setTraining_type(rs.getString(2));
	           item.setTraining_schedule(rs.getString(3));
	           item.setTraining_place(rs.getString(4));
	           item.setTraining_division(rs.getString(5));          
	           item.setScenario_no(rs.getInt(6));  
	           item.setDate(rs.getString(7)); 
	           item.setName(rs.getString(8)); 
	             list.add(item);

	        }
	        
	        rs.close();
	     } catch (Exception e) {
	        e.printStackTrace();
	        
	     } return list;
	     
	   }
	
	 public InfringementItem getInfringementdata_content(int id) {
	     String sql = "SELECT * FROM infringementitem WHERE id = ?";
	           
	      try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, id);
	         ResultSet rs = pstmt.executeQuery();
	         
	         if (rs.next()) {
	            
	            InfringementItem item = new InfringementItem();
	            item.setId(rs.getInt("id"));
	            item.setTraining_type(rs.getString("training_type"));
				item.setTraining_schedule(rs.getString("training_schedule"));
				item.setTraining_place(rs.getString("training_place"));
				item.setTraining_division(rs.getString("training_division"));
				item.setScenario_no(rs.getInt("scenario_no"));
	            item.setDate(rs.getString("date"));
	            item.setName(rs.getString("name"));
	            
	            return item;
	         }
	         
	      } catch(Exception e) {
	         e.printStackTrace();         
	     
	      }
	      return null;
	      
	  }
	public int InfringementTrainingCorrect(InfringementItem infringementItem) {
		return 0;
	}

	public int InfringementTrainingDelete(InfringementItem infringementItem) {
		return 0;
	}
}