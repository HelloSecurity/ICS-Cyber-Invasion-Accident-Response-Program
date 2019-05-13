package eva;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CalDAO {

    private Connection conn;
      private PreparedStatement pstmt;
      private ResultSet rs;
      
      public CalDAO() {
         try {
            String dbURL ="jdbc:mysql://ics-vaprogram.cti5lacaght2.ap-northeast-2.rds.amazonaws.com:3306/ICS2?useUnicode=true&characterEncoding=utf8";
            String dbID = "admin";
            String dbPassword = "password";
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn= DriverManager.getConnection(dbURL, dbID, dbPassword);
         }   catch(Exception e) {
            e.printStackTrace();
         }
      }
      
      public ArrayList<String> getPriority() { //getPriority 데이터를 순서대로 String 배열에 넣음
            ArrayList<String> datas = new ArrayList<String>(); //String 객체 생성
            
            String SQL="SELECT priority FROM AssetTable"; //SQL 쿼리문
            try {
               pstmt = conn.prepareStatement(SQL);
               ResultSet rs = pstmt.executeQuery();
               
               while(rs.next()) {
                  datas.add(rs.getString("priority")); //priority 데이터 가져오기
                  
               }

               rs.close();
               
            }catch(Exception e) {
               e.printStackTrace();
            }
            
            return datas;
            
         }
      
      public int getFinalItem() { //통제항목 중요도 함수
            ArrayList<SelectedControlItem> datas = new ArrayList<SelectedControlItem>(); //SelcetedControlItem 객체 생성
            
            String SQL="SELECT * FROM SelectedControlItem"; //SQL 쿼리문
            try {
                pstmt=conn.prepareStatement(SQL);
                int high=0; //중요도 '상'
                int middle=0; //중요도 '중'
                int low=0; //중요도 '하'
                rs=pstmt.executeQuery(); //쿼리 실행
                String result = rs.getString("result"); //result 컬럼 가져와서 변수에 저장
                String importance = rs.getString("importance"); //importance 컬럼 가져와서 변수에 저장
                if(rs.next()) {
                   if("N".equals(result)) { //result 컬럼 데이터가  N이면 실행
                     if("상".equals(importance)) { //importance 컬럼 데이터가 상이면
                        high++; //high 갯수 1 증가
                        return high; //higt 반환
                     }
                     else if("중".equals(importance)) { //importance 컬럼 데이터가 중이면
                        middle++; //middle 갯수 1 증가
                        return middle; //middle 반환
                     }
                     else //importance 컬럼 데이터가 상, 중이 아니면
                        low++; //low 갯수 1 증가
                        return low; //low 반환
                   }
                   else 
                      return 0; // result 컬럼 데이터가 N이 아니면 실행
                }
                return -1; 
             } catch(Exception e) {
                e.printStackTrace();
             }
             return -2;  //데이터 베이스 오류
          }
           
         }