package scenario;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import asset.AssetDAO;
import asset.AssetDTO;
import result.Result;

public class ScenarioDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ScenarioDAO() {
		try {
			String dbURL = "jdbc:mysql://127.0.0.1:3306/ics3?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "0805";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<ScenarioItem> getScenarioItem() {
		ArrayList<ScenarioItem> datas = new ArrayList<ScenarioItem>();
		return datas;
	}
	
	public ArrayList<AssetDAO> getAsset() {
		   ArrayList<AssetDAO> datas = new ArrayList<AssetDAO>();
		   return datas;
	}
	public int ScenarioWrite(ScenarioItem scenarioItem) {
		return 0;
	}
	public int ScenarioCorrect(ScenarioItem scenarioItem) {
		return 0;
	}
	public int ScenarioDelete(ScenarioItem scenarioItem) {
		return 0;
	}
}
