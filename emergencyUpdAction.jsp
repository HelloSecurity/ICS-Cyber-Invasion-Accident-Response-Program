<%@ page language="java" import="java.sql.*, java.lang.*, java.util.*" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8" %>
<%@page import="java.lang.reflect.Type"%>
<%@page import = "java.io.PrintWriter" %>
<%@ page import="infringementAction.InfringementItem" %>
<%@ page import="infringementAction.InfringementDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
   request.setCharacterEncoding("UTF-8");
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
int year = Integer.parseInt(request.getParameter("year"));
String city = request.getParameter("city");
String country = request.getParameter("country");
String agency = request.getParameter("agency");
String incident_name = request.getParameter("incident_name");
String incident_sum = request.getParameter("incident_sum");
String incident_content=request.getParameter("incident_content");
String damage_level=request.getParameter("damage_level");



/* 결과를 확인하는 코드
out.println("id : " + id + "<br />");
out.println("name : " + complete + "<br />");
out.println("responsibility : " + responsibility + "<br />");
out.println("password : " + uses + "<br />");
*/


//평가 결과가 DB에 들어가는 코드
Connection conn;
PreparedStatement pstmt;

try {
   String dbURL ="jdbc:mysql://icsdatabase.csqmh3rbxyia.ap-northeast-2.rds.amazonaws.com/icsdatabase?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
    String dbID = "icsdatabase";
    String dbPassword = "icsdatabase";
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn= DriverManager.getConnection(dbURL, dbID, dbPassword);
    String SQL = "UPDATE emergencytable SET incident_name=?, incident_sum=?, incident_content=?, damage_level=?, year=?, country=?, city=?, agency=? where id=?";
    //String SQL = "UPDATE scenarioitem SET complete=" + "'" + complete + "'" + ", responsibility=" + "'" + responsibility + "'" + ", uses=" + "'" +uses+ "'" + "where id =" + id;
          
    pstmt = conn.prepareStatement(SQL);
    
    pstmt.setString(1, incident_name);
    pstmt.setString(2, incident_sum);
    pstmt.setString(3, incident_content);
    pstmt.setString(4, damage_level);
    pstmt.setInt(5, year);
    pstmt.setString(6, country);
    pstmt.setString(7, city);
    pstmt.setString(8, agency);
    pstmt.setInt(9, id);
    pstmt.executeUpdate();

 
    PrintWriter script=response.getWriter();
   script.println("<script>");
   script.println("alert('수정에 성공하였습니다.')");
   script.println("location.href='emergencyView.jsp?id=" + id + "'");
   script.println("</script>");
   script.close();
    
    
    
    
} catch (Exception e) {
   PrintWriter script=response.getWriter();
   script.println("<script>");
   script.println("alert('수정에 실패하였습니다.')");
   script.println("location.href='history.back()'");
   script.println("</script>");
   script.close();
   e.printStackTrace();
}



%>


</body>
</html>