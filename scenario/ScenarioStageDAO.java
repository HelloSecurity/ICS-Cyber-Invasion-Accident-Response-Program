package scenario;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ScenarioStageDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ScenarioStageDAO() {
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
	public ArrayList<ScenariostageItem> getScenariostageItem() {
		ArrayList<ScenariostageItem> datas = new ArrayList<ScenariostageItem>();
		return datas;
	}
	public int ScenarioStageWrite(ScenariostageItem scenariostageItem) {
		return 0;
	}
	public int ScenarioStageCorrect(ScenariostageItem scenariostageItem) {
		return 0;
	}
	public int ScenarioStageDelete(ScenariostageItem scenariostageItem) {
		return 0;
	}
}
