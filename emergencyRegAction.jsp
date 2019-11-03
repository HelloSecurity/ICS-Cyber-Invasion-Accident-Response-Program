<%@ page language="java" import="java.sql.*, java.lang.*, java.util.*" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8" %>
<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="java.lang.reflect.Type"%>
<%@page import="com.google.gson.Gson"%>
    
<%@page import="java.lang.reflect.Type"%>
<%@ page import="user.UserDAO" %>
<%@page import = "java.io.PrintWriter" %>
<%@page import = "java.io.PrintWriter" %>
<%@ page import="scenario.ScenarioItem" %>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="emergency.EmergencyItem" %>
<%@ page import="emergency.EmergencyDAO" %>
<%@page import = "org.json.simple.parser.JSONParser" %>
<%@page import = "org.json.simple.JSONArray" %>
<%@page import = "org.json.simple.JSONObject" %>
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



// 세션의 로그인여부 확인
String userID=null;
if(session.getAttribute("userID")!=null){
   userID=(String)session.getAttribute("userID");
}
if(userID==null){ //로그인 안 됐을 경우
   PrintWriter script=response.getWriter();
   script.println("<script>");
   script.println("alert('로그인을 해주세요.')");
   script.println("location.href='login.jsp'");
   script.println("</script>");
   script.close();
   return;
}


String city = request.getParameter("city");
int year = Integer.parseInt(request.getParameter("year"));
String country = request.getParameter("country");
String agency = request.getParameter("agency");
String incident_name = request.getParameter("incident_name");
String incident_sum = request.getParameter("incident_sum");
String incident_content=request.getParameter("incident_content");
String damage_level=request.getParameter("damage_level");
String jsonStr = request.getParameter("real_data"); // ajax를 이용해 데이터 받기
Gson gson = new Gson();


JSONParser jsonParser = new JSONParser();
JSONArray jsonArray = (JSONArray) jsonParser.parse(jsonStr);


for (int i = 0; i < jsonArray.size(); i++ ){

	JSONObject jsonObject = (JSONObject) jsonArray.get(i);
	String cyberattackpath = jsonObject.get("control_item").toString();
		
	 

	EmergencyDAO emergencyDAO = new EmergencyDAO();
	int result = emergencyDAO.Write(new EmergencyItem(0, incident_name, cyberattackpath, incident_sum, incident_content, damage_level, year, country, city, agency));
	if(result==-1){
	    PrintWriter script=response.getWriter();
	    script.println("<script>");
	    script.println("alert('비상사건 등록에 실패했습니다.')");
	    script.println("history.back()");
	    script.println("</script>");
	 }else{ //자산 추가 성공적으로 이루어진 경우
	    PrintWriter script=response.getWriter();
	    script.println("<script>");
	    script.println("location.href='emergency_case.jsp'");
	    script.println("</script>");
	 }
	
}

	


%>