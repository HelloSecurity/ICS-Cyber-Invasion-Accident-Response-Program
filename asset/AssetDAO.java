package asset;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import eva.ControlItemDo;
import util.DatabaseUtil;

public class AssetDAO {

   private Connection conn;
   private PreparedStatement pstmt;
   private ResultSet rs;
   
   public AssetDAO() {
      try {
    	  String dbURL = "jdbc:mysql://icsdatabase2.csqmh3rbxyia.ap-northeast-2.rds.amazonaws.com:3306/icsdatabase?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
    	  String dbID = "icsdatabase";
    	  String dbPassword = "icsdatabase";
          Class.forName("com.mysql.cj.jdbc.Driver");
         conn= DriverManager.getConnection(dbURL, dbID, dbPassword);
      }   catch(Exception e) {
         e.printStackTrace();
      }
   }
   
   public int getNext() {
      String SQL = "SELECT no FROM assettable ORDER BY no DESC";
      try {
         PreparedStatement pstmt=conn.prepareStatement(SQL);
         rs=pstmt.executeQuery();
         if(rs.next()) {
            return rs.getInt(1)+1;
         }
         return 1; //筌ｃ꺂苡뀐쭪占� 野껊슣�뻻�눧�눘�뵥 野껋럩�뒭
      }catch(Exception e) {
         e.printStackTrace();
      }
      return -1; //占쎈쑓占쎌뵠占쎄숲甕곗쥙�뵠占쎈뮞 占쎌궎�몴占�
   }
   
   //write 占쎈맙占쎈땾 占쎄문占쎄쉐
   public int write(AssetDTO assetDTO) {
       //AssetTable占쎈퓠 占쎈쑓占쎌뵠占쎄숲 占쎄땜占쎌뿯
         String SQL="INSERT INTO assettable VALUES(NULL,?,?,?,?,?,?,?,?,?,?,?)";
         try {
           
            pstmt=conn.prepareStatement(SQL);
            pstmt.setString(1, assetDTO.getAsset_name());
            pstmt.setInt(2, assetDTO.getPriority());
            pstmt.setInt(3, assetDTO.getAccount_manage());
            pstmt.setInt(4, assetDTO.getEncryption());
            pstmt.setInt(5, assetDTO.getLogging());
            pstmt.setInt(6, assetDTO.getExternal_connect());
            pstmt.setString(7, assetDTO.getAsset_type());
            pstmt.setString(8, assetDTO.getInter_face());
            pstmt.setString(9, assetDTO.getProtocol());
            pstmt.setString(10, assetDTO.getOs_type());
            pstmt.setString(11, assetDTO.getUsages());      
            return pstmt.executeUpdate();
         }catch(Exception e) {
            e.printStackTrace();
         }finally {
            try {if(conn!=null)conn.close();} catch(Exception e) {e.printStackTrace();}
            try {if(pstmt!=null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
            try {if(rs!=null) rs.close();} catch(Exception e) {e.printStackTrace();}
            
         }
         return -1; //占쎈쑓占쎌뵠占쎄숲甕곗쥙�뵠占쎈뮞 占쎌궎�몴占� 

      }
   
   public AssetDTO getAsset(int no) {
      String SQL="SELECT*FROM assettable WHERE no=?";
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         pstmt.setInt(1, no);
         rs=pstmt.executeQuery();
         if(rs.next()) {
            AssetDTO asset=new AssetDTO();
            asset.setNo(rs.getInt(1));
            asset.setAsset_name(rs.getString(2));
            asset.setPriority(rs.getInt(3));
            asset.setAccount_manage(rs.getInt(4));
            asset.setEncryption(rs.getInt(5));
            asset.setLogging(rs.getInt(6));
            asset.setExternal_connect(rs.getInt(7));
            asset.setAsset_type(rs.getString(8));
            asset.setInter_face(rs.getString(9));
            asset.setProtocol(rs.getString(10));
            asset.setOs_type(rs.getString(11));
            asset.setUsages(rs.getString(12));
            return asset;
         }
      }catch(Exception e) {
         e.printStackTrace();
      }
      return null;
   }

   
   public AssetDTO getAssetPriority(String asset_name) {
       String SQL="SELECT * FROM assettable WHERE asset_name=?";
       AssetDTO getPriority = new AssetDTO();
       try {
          pstmt=conn.prepareStatement(SQL);
          
          pstmt.setString(1, asset_name);
          
          ResultSet rs =pstmt.executeQuery();  
          
          rs.next();
        getPriority.setPriority(rs.getInt("priority"));     
        rs.close(); 
         
       } catch(Exception e) {
          e.printStackTrace();
       }
       return getPriority;
      
    }

  
}
   
      
   