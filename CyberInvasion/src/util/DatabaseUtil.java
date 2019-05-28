package util;

import java.sql.DriverManager;
import java.sql.Connection;


public class DatabaseUtil {

   public static Connection getConnection() {
         try {
        		String dbURL ="jdbc:mysql://127.0.0.1:3306/sys?serverTimezone=UTC";
    	        String dbID = "root";
    	        String dbPassword = "password";
             Class.forName("com.mysql.cj.jdbc.Driver");
             return DriverManager.getConnection(dbURL, dbID, dbPassword);
             
          }   catch(Exception e) {
             e.printStackTrace();
          
          }return null;
   }
}
