package InfringmentAction;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class InfringmentDateDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public InfringmentDateDAO() {
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
	public ArrayList<InfringmentDAO> getInfringmentItem() {
		ArrayList<InfringmentDAO> datas = new ArrayList<InfringmentDAO>();
		return datas;
	}
	public ArrayList<InfringmentStageItem> getInfringmentStageItem() {
		ArrayList<InfringmentStageItem> datas = new ArrayList<>();
		return datas;
	}
	public int InfringmentDateTrainingWrite(InfringmentStageItem infringmentstageItem) {
		return 0;
	}
	public int InfringmentDateTrainingCorrect(InfringmentStageItem infringmentstageItem) {
		return 0;
	}
	public int InfringmentDateTrainingDelete(InfringmentStageItem infringmentstageItem) {
		return 0;
	}
	
}
