<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="asset.AssetDAO" %>
<%@ page import="asset.AssetDTO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*,java.util.*" %>


<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>취약점 진단 프로그램</title>
</head>
<body>
<%
	String userID=null;
   if(session.getAttribute("userID")!=null){
      userID=(String)session.getAttribute("userID");
   }
   if(userID==null){
      PrintWriter script=response.getWriter();
      script.println("<script>");
      script.println("alert('로그인을 하세요.')");
      script.println("location.href='login.jsp'");
      script.println("</script>");
   } 
   int no=0;
   if(request.getParameter("no")!=null){
	   no=Integer.parseInt(request.getParameter("no"));
   }
if(no==0){
	PrintWriter script=response.getWriter();
	script.println("<script>");
	script.println("alert('유효하지 않은 자산입니다.')");
	script.println("location.href='asset_list.jsp'");
	script.println("</script>");
}
%>

<script>
  $("#selectBtn").click(function(){ 
            
        var rowData = new Array(); 
        var tdArr = new Array();
        var checkbox = $("input[asset_name=checkbox:checked");
     // 체크된 체크박스 값을 가져온다
        checkbox.each(function(i) {
        
            // checkbox.parent() : checkbox의 부모는 <td>이다.
            // checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
            var tr = checkbox.parent().parent().eq(i);
            var td = tr.children();
                    
            // 체크된 row의 모든 값을 배열에 담는다.
            rowData.push(tr.text());
                    
            // td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
            var no = td.eq(1).text()+", "
            var asset_name = td.eq(2).text()+", ";
            var priority = td.eq(3).text()+", ";
            var account_manage = td.eq(4).text()+", ";
                    
            // 가져온 값을 배열에 담는다.
            tdArr.push(no);
            tdArr.push(asset_name);
            tdArr.push(priority);
            tdArr.push(account_manage);
                    
        });
 </script>
<%
//post 한글처리
request.setCharacterEncoding("utf-8");
//폼 파라미터값 가져오기
String re_asset_name=request.getParameter("asset_name");                  
int re_priority=Integer.parseInt(request.getParameter("priority"));      
int re_account_manage=Integer.parseInt(request.getParameter("account_manage"));                  
int re_encryption=Integer.parseInt(request.getParameter("encryption"));                  
int re_logging=Integer.parseInt(request.getParameter("logging"));                  
int re_external_connect=Integer.parseInt(request.getParameter("external_connect"));                  
String re_asset_type=request.getParameter("asset_type");        
String re_inter_face=request.getParameter("inter_face");
String re_protocol=request.getParameter("protocol");
String re_os_type=request.getParameter("os_type");
String re_usages=request.getParameter("usages");
// 1. 드라이버 로딩
Class.forName("com.mysql.cj.jdbc.Driver");
// JDBC 변수
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs= null;
try{
  
			String dbURL = "jdbc:mysql://icsdatabase.csqmh3rbxyia.ap-northeast-2.rds.amazonaws.com:3306/icsdatabase?serverTimezone=UTC";
			String dbID = "icsdatabase";
			String dbPassword = "icsdatabase";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
	
		              pstmt=conn.prepareStatement("UPDATE AssetTable SET asset_name=?,priority=?,account_manage=?,encryption=?,logging=?,external_connect=?,asset_type=?,inter_face=?,protocol=?,os_type=?,usages=? WHERE no=?");
		       		  pstmt.setString(1, re_asset_name);
		              pstmt.setInt(2, re_priority);
		              pstmt.setInt(3, re_account_manage);
		              pstmt.setInt(4, re_encryption);
		              pstmt.setInt(5, re_logging);
		              pstmt.setInt(6, re_external_connect);
		              pstmt.setString(7, re_asset_type);
		              pstmt.setString(8, re_inter_face);
		              pstmt.setString(9, re_protocol);
		              pstmt.setString(10, re_os_type);
		              pstmt.setString(11, re_usages);
		  			//실행
		              pstmt.executeUpdate();
%>
		  			<%
}catch(Exception e){
	      System.out.println(e);   } 
      finally{
		    	  if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
		    	  if(conn!=null)try{conn.close();}catch(SQLException ex){}
		    	  if(conn!=null)try{conn.close();}catch(SQLException ex){}
		      }
      
%>
<script>
	alert('수정 성공');
	location.href='asset_list.jsp';
</script>
  
</body>
</html> 