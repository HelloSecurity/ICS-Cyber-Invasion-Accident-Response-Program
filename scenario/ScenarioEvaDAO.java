package scenario;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import eva.ControlItemDo;
import eva.SelectedControlItem;

public class ScenarioEvaDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ScenarioEvaDAO() {
		try {
			String dbURL = "jdbc:mysql://icsdatabase2.csqmh3rbxyia.ap-northeast-2.rds.amazonaws.com:3306/icsdatabase?serverTimezone=UTC";
	        String dbID = "icsdatabase";
	        String dbPassword = "icsdatabase";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<ScenarioDAO> getScenario() {
		ArrayList<ScenarioDAO> datas = new ArrayList<ScenarioDAO>();
		return datas;
	}
	public ArrayList<ScenarioEvaItem> getScenarioEvaItem() {
		ArrayList<ScenarioEvaItem> datas = new ArrayList<ScenarioEvaItem>();
		return datas;
	}
	 public ArrayList<ScenarioEvaItem> setScenarioEvaItem() { //n
		 ArrayList<ScenarioEvaItem> datas = new ArrayList<ScenarioEvaItem>();
		 return datas;
		 }
	 public void ScenarioEvaluation(List<ScenarioEvaItem> scenarioevaitem) {
		 
	 }
	}
