<%@ page language="java" import="java.sql.*, java.lang.*, java.util.*" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8" %>
<%@page import="java.lang.reflect.Type"%>
<%@page import = "java.io.PrintWriter" %>
<%@ page import="infringementAction.InfringementItem" %>
<%@ page import="infringementAction.InfringementDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    request.setCharacterEncoding("EUC-KR");
%>

<!DOCTYPE html>
<html>
<head>
  <meta http-quiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width", initial-scale="1">
  <link rel="stylesheet" href="css/bootstrap.css">
<title>취약점 진단 프로그램</title>
</head>
<body>

<%

//eva_view.jsp에서 파라미터 넘겨받기

int id = Integer.parseInt(request.getParameter("id"));


/* 결과를 확인하는 코드
out.println("id : " + id + "<br />");
out.println("name : " + complete + "<br />");
out.println("responsibility : " + responsibility + "<br />");
out.println("password : " + uses + "<br />");
*/

//삭제 코드
Connection conn;
PreparedStatement pstmt;

try {
   String dbURL ="jdbc:mysql://icsdatabase.csqmh3rbxyia.ap-northeast-2.rds.amazonaws.com/icsdatabase?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
    String dbID = "icsdatabase";
    String dbPassword = "icsdatabase";
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn= DriverManager.getConnection(dbURL, dbID, dbPassword);
    String SQL = "DELETE FROM emergencytable WHERE id=?";
    //String SQL = "UPDATE scenarioitem SET complete=" + "'" + complete + "'" + ", responsibility=" + "'" + responsibility + "'" + ", uses=" + "'" +uses+ "'" + "where id =" + id;
          
    pstmt = conn.prepareStatement(SQL);
    
    pstmt.setInt(1, id);
    pstmt.executeUpdate();

 
    PrintWriter script=response.getWriter();
   script.println("<script>");
   script.println("alert('삭제에 성공하였습니다.')");
   script.println("location.href='emergency_case.jsp'");
   script.println("</script>");
   script.close();
    
    
    
    
} catch (Exception e) {
   PrintWriter script=response.getWriter();
   script.println("<script>");
   script.println("alert('삭제에 실패하였습니다.')");
   script.println("location.href='history.back()'");
   script.println("</script>");
   script.close();
   e.printStackTrace();
}


//pageContext.forward(".jsp"); //eva_action.jsp에서 모든 과정을 처리하면  _eva.jsp로 화면 포워딩 꼭 필요!


%>


</body>
</html>