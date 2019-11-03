<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="asset.AssetDTO" %>
<%@ page import="asset.AssetDAO" %>
<%@ page import="scenario.ScenarioDAO" %>
<%@ page import="scenario.ScenarioItem" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*,java.util.*" %>

<!-- DAO 호출 -->
<jsp:useBean id="Item" class="scenario.ScenarioItem" scope="page"/>
<%
   request.setCharacterEncoding("UTF-8");
%>


<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>취약점 진단 프로그램</title>
</head>
<body>
	<script>
	function ScenarioUpdAction(){
		var id=document.update.id;
		var scenario_name=document.update.scenario_name;
		var infringement_level=document.update.infringement_level;
		var asset_name=document.update.asset_name;
		var scenario_condition=document.update.scenario_condition;
		var scenario_sum=document.update.scenario_sum;
		var scenario_content=document.update.scenario_content;
		
		
		if(id.value == ""){
			   alert("id을 입력하세요!");
			   id.focus();
			   return false;
		}else if(scenario_name.value == ""){
			   alert("scenario_name를 입력하세요.!");
			   scenario_name.focus();
			   return false;
			  } else if(scenario_condition.value == ""){
					   alert("scenario_condition을 입력하세요!");
					   scenario_condition.focus();
					   return false;
					  }else if(infringement_level.value == ""){
						   alert("infringement_level을 입력하세요!");
						   infringement_level.focus();
						   return false;
					   }else if(asset_name.value == ""){
						   alert("asset_name을 입력하세요!");
						   infringement_level.focus();
						   return false;
					   }else{
						   alert("시나리오 수정되었습니다.");
						   return true;
					   }
					 }
	
		
	
	</script>
<%  
   

  //모든 입력사항을 다 입력한 경우 
               ScenarioDAO scenarioDAO = new ScenarioDAO(); //assetDAO 객체에 AssetDAO 저장
               //result에 assetDAO에 있는 write함수 값을 저장
               int result = scenarioDAO.ScenarioCorrect(new ScenarioItem(Integer.parseInt(request.getParameter("id")), request.getParameter("scenario_name"), Integer.parseInt(request.getParameter("infringement_level")), request.getParameter("asset_name"), request.getParameter("scenario_condition"), request.getParameter("scenario_sum"), request.getParameter("scenario_content")));
               if(result==-1){
                  PrintWriter script=response.getWriter();
                  script.println("<script>");
                  script.println("alert('자산리스트 추가에 실패했습니다.')");
                  script.println("location.href='scenario.jsp'");
                  script.println("</script>");
                  
               }else{ //자산 추가 성공적으로 이루어진 경우
                  PrintWriter script=response.getWriter();
                  script.println("<script>");
                  script.println("location.href='scenario.jsp'");
                  script.println("</script>");
               }
             %>
              

     
</body>
</html> 