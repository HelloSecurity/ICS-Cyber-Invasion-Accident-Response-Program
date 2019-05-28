package scenario;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.sql.Statement;
import java.util.ArrayList;
import java.sql.SQLException;

import asset.AssetDAO;
import asset.AssetDTO;
import result.Result;
import util.DatabaseUtil;
import scenario.ScenarioItem;


public class ScenarioDAO {
  // Statement stmt;
	 Connection conn;
	 PreparedStatement pstmt;
	ResultSet rs;
	
	public ScenarioDAO() {
		try {
			String dbURL ="jdbc:mysql://127.0.0.1:3306/sys?serverTimezone=UTC";
	        String dbID = "root";
	        String dbPassword = "password";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<ScenarioItem> getScenariolist() {
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
	
	 public ArrayList<ScenarioItem> getScenariolist(String keyField, String keyWord){
		
	        ArrayList<ScenarioItem> list = new ArrayList<ScenarioItem>();
	       
	        try{//실행
		           
	            String sql ="select * from scenarioitem ";
	           
	            if(keyField != null && !keyField.equals("") ){
	                sql +="WHERE "+keyField+'='+'"'+keyWord+'"'+";";
	            }else{//모든 레코드 검색
	                sql +="order by id";
	            }
	         
	            System.out.println("sql = " + sql);
				pstmt = conn.prepareStatement(sql);
	            ResultSet rs = pstmt.executeQuery(sql);
	            System.out.println(rs);

	            while(rs.next()){
	            	ScenarioItem scenarioItem = new ScenarioItem();
	            	
	                scenarioItem.setId(rs.getInt(1));
	                scenarioItem.setScenario_name(rs.getString(2));
	                scenarioItem.setInfringement_level(rs.getInt(3));
	            
	                list.add(scenarioItem);
		            System.out.println(list);

	            }
	        }catch(Exception e){          
	            System.out.println(e+"=> getMemberlist fail");        
	        }finally{          
	            db_close();
	        }      
	        return list;
	    }  
	 
	 public void db_close(){
	       
	        try {
	           
	            if (rs != null ) rs.close();
	            if (pstmt != null ) pstmt.close();      
	       
	        } catch (SQLException e) {
	            System.out.println(e+"=> 닫기 오류");
	        }   
	        
	       
	    } //db_close
	   
	
	public int ScenarioWrite(ScenarioItem scenarioItem) { 

		String SQL = "INSERT INTO scenarioitem VALUES(?,?,?,?,?,?,?)";
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, scenarioItem.getId());
			pstmt.setString(2, scenarioItem.getScenario_name());
			pstmt.setInt(3, scenarioItem.getInfringement_level());
			pstmt.setString(4, scenarioItem.getAsset_name());
			pstmt.setString(5, scenarioItem.getScenario_condition());
			pstmt.setString(6, scenarioItem.getScenario_sum());
			pstmt.setString(7, scenarioItem.getScenario_content());

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
		return -1; // 데이터베이스 오류

	}
	public int ScenarioCorrect(ScenarioItem scenarioItem) {
		return 0;
	}
	public int ScenarioDelete(ScenarioItem scenarioItem) {
		return 0;
	}

	

	 
	 public ArrayList<ScenarioItem> getSpecificScenariolist2(ScenarioItem id) { //public int memberInsert(MemberscenarioItem scenarioItem){
			ArrayList<ScenarioItem> datas = new ArrayList<ScenarioItem>();

			String SQL = "SELECT * FROM scenarioitem WHERE id="+id;
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
					
					datas.add(item);
				}

				rs.close();

			} catch (Exception e) {
				e.printStackTrace();
			}

			return datas;

	 }
}


