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

   
   
   int id=0;
   String scenario_name=null;
   String scenario_condition=null;
   String asset_name=null;
   int infringement_level=0;
   String scenario_sum=null;
   String scenario_content=null;
  
  if(request.getParameter("id")!=null){
   //  asset_name=request.getParameter("asset_name");
     try{
        id=Integer.parseInt(request.getParameter("id"));
     }catch(Exception e){
        System.out.println("아이디 오류");
  }  }
  if(request.getParameter("scenario_name")!=null){
     try{
    	 scenario_name=request.getParameter("scenario_name");
     }catch(Exception e){
        System.out.println("scenario_name 오류");
  }}
  if(request.getParameter("scenario_condition")!=null){
	     try{
	    	 scenario_condition=request.getParameter("scenario_condition");
	     }catch(Exception e){
	        System.out.println("scenario_condition 오류");
	  }}
 
  if(request.getParameter("asset_name")!=null){
     try{
    	 asset_name=request.getParameter("asset_name");
     }catch(Exception e){
        System.out.println(" asset_name 오류");
  }}
  if(request.getParameter("infringement_level")!=null){
	try{
		infringement_level=Integer.parseInt(request.getParameter("infringement_level"));
  }catch(Exception e){
      System.out.println("아이디 오류");
} }
  if(request.getParameter("scenario_sum")!=null){
	     try{
	    	 scenario_sum=request.getParameter("scenario_sum");
	     }catch(Exception e){
	        System.out.println("scenario_sum 오류");
	  }}
  if(request.getParameter("scenario_content")!=null){
	     try{
	    	 scenario_content=request.getParameter("scenario_content");
	     }catch(Exception e){
	        System.out.println("scenario_content 오류");
	  }}
     

  if(id==0){
      PrintWriter script=response.getWriter();
      script.println("<script>");
      script.println("alert('id==0')");
      script.println("history.back()");
      script.println("</script>");
      script.close();
      return;
   }
  if(scenario_name==null){
      PrintWriter script=response.getWriter();
      script.println("<script>");
      script.println("alert('scenario_name==null')");
      script.println("history.back()");
      script.println("</script>");
      script.close();
      return;
   }
  
  if(asset_name==null){
      PrintWriter script=response.getWriter();
      script.println("<script>");
      script.println("alert('asset_name==null')");
      script.println("history.back()");
      script.println("</script>");
      script.close();
      return;
   }
  
  if(infringement_level==0){
      PrintWriter script=response.getWriter();
      script.println("<script>");
      script.println("alert('ainfringement_level==0')");
      script.println("history.back()");
      script.println("</script>");
      script.close();
      return;
   }
  
  if(id==0||scenario_name==null||scenario_condition==null||asset_name==null||infringement_level==0){
               PrintWriter script=response.getWriter();
               script.println("<script>");
               script.println("alert('입력이 안 된 사항이 있습니다.')");
               script.println("history.back()");
               script.println("</script>");
               script.close();
               return;
            }
  
  //모든 입력사항을 다 입력한 경우 
               ScenarioDAO scenarioDAO = new ScenarioDAO (); //assetDAO 객체에 AssetDAO 저장
               //result에 assetDAO에 있는 write함수 값을 저장
               int result = scenarioDAO.ScenarioWrite(new ScenarioItem(id, scenario_name, infringement_level, asset_name, scenario_condition, scenario_sum, scenario_content));
               
               if(result==-1){
                  PrintWriter script=response.getWriter();
                  script.println("<script>");
                  script.println("alert('자산리스트 추가에 실패했습니다.')");
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