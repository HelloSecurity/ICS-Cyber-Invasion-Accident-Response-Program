package InfringmentAction;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import asset.AssetDAO;
import scenario.ScenarioDAO;
import scenario.ScenarioItem;
import scenario.ScenariostageItem;

public class InfringmentDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public InfringmentDAO() {
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
	
	public ArrayList<InfringmentItem> getInfringmentItem() {
		ArrayList<InfringmentItem> datas = new ArrayList<InfringmentItem>();
		return datas;
	}
	public ArrayList<ScenarioDAO> getScenario() {
		   ArrayList<ScenarioDAO> datas = new ArrayList<ScenarioDAO>();
		   return datas;
	}
	public int InfringmentTrainingWrite(InfringmentItem infringmentItem) {
		return 0;
	}
	public int  InfringmentTrainingCorrect(InfringmentItem infringmentItem) {
		return 0;
	}
	public int  InfringmentTrainingDelete(InfringmentItem infringmentItem) {
		return 0;
	}
}
