<%@ page language="java" import="java.sql.*, java.lang.*, java.util.*" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8" %>
<%@page import="java.lang.reflect.Type"%>
<%@ page import="user.UserDAO" %>
<%@page import = "java.io.PrintWriter" %>
<%@ page import="scenario.ScenarioItem" %>
<%@ page import="java.sql.*,java.util.*" %>
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
//eva_view.jsp에서 파라미터 넘겨받기

String training_type = null;
String training_schedule = null;
String training_place = null;
String training_division = null;
String date = null;
String name = null;
int scenario_no = 0;

	 if(request.getParameter("training_type")!=null){
	     try{
	    	 training_type=request.getParameter("training_type");
	     }catch(Exception e){
	        System.out.println("종류 오류");
	  }}
	  if(request.getParameter("training_schedule")!=null){
	     try{
	    	 training_schedule=request.getParameter("training_schedule");
	     }catch(Exception e){
	        System.out.println("일정 오류");
	  }}
	  if(request.getParameter("training_place")!=null){
	     try{
	    	 training_place=request.getParameter("training_place");
	     }catch(Exception e){
	        System.out.println("장소 오류");
	  }}
	  if(request.getParameter("training_division")!=null){
		     try{
		    	 training_division=request.getParameter("training_division");
		     }catch(Exception e){
		        System.out.println("division 오류");
		  }}
	  if(request.getParameter("scenario_no")!=null){
		     try{
		    	 scenario_no=Integer.parseInt(request.getParameter("scenario_no"));
		     }catch(Exception e){
		        System.out.println("scenario_no 오류");
		  }}
	  if(request.getParameter("date")!=null){
		     try{
		    	date=request.getParameter("date");
		     }catch(Exception e){
		        System.out.println("date 오류");
		  }}
	  if(request.getParameter("name")!=null){
		     try{
		    	name=request.getParameter("name");
		     }catch(Exception e){
		        System.out.println("name 오류");
		  }}
	  if(training_type==null||training_schedule==null||training_place==null||training_division==null||scenario_no==0){
          PrintWriter script=response.getWriter();
          script.println("<script>");
          script.println("alert('입력이 안 된 사항이 있습니다.')");
          script.println("history.back()");
          script.println("</script>");
          script.close();
          return;
       }
	  
InfringementDAO infringementDAO = new InfringementDAO();
int result = infringementDAO.Write(new InfringementItem(0, training_type, training_schedule, training_place,training_division, scenario_no, date, name));
if(result==-1){
    PrintWriter script=response.getWriter();
    script.println("<script>");
    script.println("alert('침해대응 훈련 등록에 실패했습니다.')");
    script.println("history.back()");
    script.println("</script>");
 }else{ //자산 추가 성공적으로 이루어진 경우
    PrintWriter script=response.getWriter();
    script.println("<script>");
    script.println("location.href='infringement.jsp'");
    script.println("</script>");
 }
%>
