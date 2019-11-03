package eva;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import java.util.List;





public class EvaDAO {

   private Connection conn;
   private PreparedStatement pstmt;
   
   public EvaDAO() {
      try {
			String dbURL = "jdbc:mysql://icsdatabase2.csqmh3rbxyia.ap-northeast-2.rds.amazonaws.com:3306/icsdatabase?serverTimezone=UTC";
			String dbID = "icsdatabase";
			String dbPassword = "icsdatabase";
          Class.forName("com.mysql.cj.jdbc.Driver");
         conn= DriverManager.getConnection(dbURL, dbID, dbPassword);
         
         getAssetlist();
      }   catch(Exception e) {
         e.printStackTrace();
      }
      
   }
   
   public ArrayList<String> getAssetlist() { //getAssetlist �뜲�씠�꽣瑜� �닚�꽌��濡� String 諛곗뿴�뿉 �꽔�쓬
      ArrayList<String> datas = new ArrayList<String>(); //String 媛앹껜 �깮�꽦
      
      String SQL="SELECT asset_name FROM assettable"; //SQL 荑쇰━臾�
      try {
         pstmt = conn.prepareStatement(SQL);
         ResultSet rs = pstmt.executeQuery();
         
         while(rs.next()) {
            datas.add(rs.getString("asset_name")); //asset_name �뜲�씠�꽣 媛��졇�삤湲�
            
         }

         rs.close();
         
      }catch(Exception e) {
         e.printStackTrace();
      }
      
      return datas;
      
   }
   
   public ArrayList<ControlItemDo> getControlItem() {
      ArrayList<ControlItemDo> datas = new ArrayList<ControlItemDo>();
      
      String SQL="SELECT * FROM controlitem";
      try {
         pstmt = conn.prepareStatement(SQL);
         ResultSet rs = pstmt.executeQuery();
         
         while(rs.next()) {
            ControlItemDo controlItemDO = new ControlItemDo();
            
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
   
   //ControlItemDo�씪�뒗 �옄諛붾퉰利� �뙆�씪!
   //asset_eva_select�뿉�꽌 留뚮뱺 List<ControlItemDo> json媛앹껜瑜� SelectedControlItemDo DB�뿉 �꽔�쓣 �븿�닔 �젙�쓽

      public void insertSelectItem(List<ControlItemDo> insertItemDo) {
         String sql = "INSERT INTO selectedcontrolitem("
               + "id, no, control_field, control_item_no, control_item, check_item, result, importance, management, physics, method, action)"
               + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try {
               
                pstmt = conn.prepareStatement(sql);
                
                for (int j=0; j<insertItemDo.size(); j++) {//list 媛앹껜�쓽 �겕湲� 留뚰겮 DB�궫�엯
                    //list媛앹껜�쓽 �씤�뜳�뒪[0]�씤 ControlItemDo媛앹껜�뿉�꽌 �븿�닔 �궗�슜�븯�뿬 id, No �벑�쓣 媛곴컖 遺덈윭�샂
                pstmt.setInt(1, insertItemDo.get(j).getId());
                pstmt.setString(2, insertItemDo.get(j).getNo().toString());
                pstmt.setString(3, insertItemDo.get(j).getControl_field().toString());          
                pstmt.setString(4, insertItemDo.get(j).getControl_item_no().toString());
                pstmt.setString(5, insertItemDo.get(j).getControl_item().toString());
                pstmt.setString(6, insertItemDo.get(j).getCheck_item().toString());
                pstmt.setString(7, insertItemDo.get(j).getResult().toString());
                pstmt.setString(8, insertItemDo.get(j).getImportance().toString());
                pstmt.setString(9, insertItemDo.get(j).getManagement().toString());
                pstmt.setString(10, insertItemDo.get(j).getPhysics().toString());
                pstmt.setString(11, insertItemDo.get(j).getMethod().toString());
                pstmt.setString(12, insertItemDo.get(j).getAction().toString());
                pstmt.executeUpdate();
                }
             } catch(Exception e) {
                
                e.printStackTrace();
                 //�뜲�씠�꽣踰좎씠�뒪 �삤瑜�
             }

   }
      public ArrayList<SelectedControlItem> getFinalItem() { //n
          ArrayList<SelectedControlItem> datas = new ArrayList<SelectedControlItem>();
          
          String SQL="SELECT control_item_no, result, importance FROM selectedcontrolitem WHERE result = 'N'";
          try {
             pstmt = conn.prepareStatement(SQL);
             ResultSet rs = pstmt.executeQuery();
             
             while(rs.next()) {
                SelectedControlItem getfinalItem  = new SelectedControlItem();
                getfinalItem.setControl_item_no(rs.getString("control_item_no"));
                getfinalItem.setImportance(rs.getString("importance"));
                getfinalItem.setResult(rs.getString("result"));

                datas.add(getfinalItem);
                //Collections.sort(datas, new sort());               
             }

             rs.close();
          }
          catch(Exception e) {
          e.printStackTrace();
          }
          return datas;
             
      }
      
      
      

}
   