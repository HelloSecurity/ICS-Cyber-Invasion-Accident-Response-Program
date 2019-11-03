package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import user.User;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		///
	
		///
		try {
			String dbURL = "jdbc:mysql://icsdatabase2.csqmh3rbxyia.ap-northeast-2.rds.amazonaws.com:3306/icsdatabase?serverTimezone=UTC";
				String dbID = "icsdatabase";
				String dbPassword = "icsdatabase";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn= DriverManager.getConnection(dbURL, dbID, dbPassword);
			System.out.println("커넥션 성공");
		}	catch(Exception e) {
			e.printStackTrace();
			System.out.println("커넥션 실패");

		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL="SELECT userPassword FROM user WHERE userID=?";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword))
					return 1; //로그인 성공
				else
					return 0; // 비밀번호 불일치
			}
			return -1; //아이디가 없음
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -2;  //데이터 베이스 오류
	}
	
	public int join(User user) {
		String SQL="INSERT INTO user VALUES (?, ?, ?, ?)"; //데이터 삽입
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserEmail());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
}
