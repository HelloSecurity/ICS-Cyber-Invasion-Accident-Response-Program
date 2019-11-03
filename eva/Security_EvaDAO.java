package eva;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import asset.AssetDTO;


public class Security_EvaDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	
	public Security_EvaDAO() {
		try {
			String dbURL = "jdbc:mysql://icsdatabase2.csqmh3rbxyia.ap-northeast-2.rds.amazonaws.com:3306/icsdatabase?serverTimezone=UTC";
	        String dbID = "root";
	        String dbPassword = "password";
			Class.forName("com.mysql.jdbc.Driver");
			conn= DriverManager.getConnection(dbURL, dbID, dbPassword);
			
			getAssetlist();
			setAssetlist();
		}	catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<String> getAssetlist() { //getAssetlist 데이터를 순서대로 String 배열에 넣음
		ArrayList<String> datas = new ArrayList<String>(); //String 객체 생성
		
		String SQL="SELECT asset_name FROM assettable"; //SQL 쿼리문
		try {
			pstmt = conn.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				datas.add(rs.getString("asset_name")); //asset_name 데이터 가져오기
				
			}

			rs.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return datas;
		
	}
	public ArrayList<String> setAssetlist() { //getAssetlist 데이터를 순서대로 String 배열에 넣음
		ArrayList<String> datas = new ArrayList<String>(); //String 객체 생성
		
		String SQL="SELECT asset_name FROM assettable"; //SQL 쿼리문
		try {
			pstmt = conn.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				datas.add(rs.getString("asset_name")); //asset_name 데이터 가져오기
				
			}

			rs.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return datas;
		
	}
	
	
	public ArrayList<SelectedControlItem> getSelectedControlItem() {
		ArrayList<SelectedControlItem> datas = new ArrayList<SelectedControlItem>();
		
		String SQL="SELECT * FROM controlitem";
		try {
			pstmt = conn.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SelectedControlItem controlItemDO = new SelectedControlItem();
				
				controlItemDO.setId(rs.getInt("id"));
				controlItemDO.setNo(rs.getString("no"));
				controlItemDO.setControl_field(rs.getString("control_field"));
				controlItemDO.setControl_item_no(rs.getString("control_item_no"));
				controlItemDO.setControl_item(rs.getString("control_item"));
				controlItemDO.setCheck_item(rs.getString("check_item"));
				controlItemDO.setImportance(rs.getString("importance"));
				controlItemDO.setManagement(rs.getString("management"));
				controlItemDO.setPhysics(rs.getString("physics"));
				controlItemDO.setMethod(rs.getString("method"));
				controlItemDO.setAction(rs.getString("action"));
				datas.add(controlItemDO);
			}

			rs.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return datas;
		
	}
	
	//ControlItemDo라는 자바빈즈 파일!
	//asset_eva_select에서 만든 List<ControlItemDo> json객체를 SelectedControlItemDo DB에 넣을 함수 정의

	  
	         
	         public void SelectControlItem(List<SelectedControlItem> selectcontrolitem) {}
	         public void SecurityEvaluation(List<SelectedControlItem> securitycontrolitem, List<AssetDTO> securityassetlist) {}
	  
	   
}
	