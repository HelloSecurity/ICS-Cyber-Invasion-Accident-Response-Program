<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="asset.AssetDTO" %>
<%@ page import="asset.AssetDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*,java.util.*" %>

<!-- DAO 호출 -->
<jsp:useBean id="asset" class="asset.AssetDTO" scope="page"/>
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

   
   String asset_name=null;
   int priority=0;
  int account_manage=0;
   int encryption=0;
   int logging=0;
   int external_connect=0;
   String asset_type=null;
   String inter_face=null;
   String protocol=null;
   String os_type=null;
  String usages=null; 
  
  if(request.getParameter("asset_name")!=null){
   //  asset_name=request.getParameter("asset_name");
     try{
        asset_name=request.getParameter("asset_name");
     }catch(Exception e){
        System.out.println("어셋네임 오류");
  }  }
  if(request.getParameter("priority")!=null){
     try{
     priority=Integer.parseInt(request.getParameter("priority"));
     }catch(Exception e){
        System.out.println("우선순위 오류");
  }}
  if(request.getParameter("account_manage")!=null){
     try{
     account_manage=Integer.parseInt(request.getParameter("account_manage"));
     }catch(Exception e){
        System.out.println("account_manage 오류");
  }}
  if(request.getParameter("encryption")!=null){
     try{
     encryption=Integer.parseInt(request.getParameter("encryption"));
     }catch(Exception e){
        System.out.println("encryption 오류");
  }}
  if(request.getParameter("logging")!=null){
     try{
     logging=Integer.parseInt(request.getParameter("logging"));
     }catch(Exception e){
        System.out.println("logging 오류");
  }}

  if(request.getParameter("external_connect")!=null){
     try{
     external_connect=Integer.parseInt(request.getParameter("external_connect"));
     }catch(Exception e){
        System.out.println("external_connect 오류");
  }}
  if(request.getParameter("asset_type")!=null){
     try{
     asset_type=request.getParameter("asset_type");
     }catch(Exception e){
        System.out.println("asset_type 오류");
  }}
  if(request.getParameter("inter_face")!=null){
     inter_face=request.getParameter("inter_face");
  }  
  if(request.getParameter("protocol")!=null){
     protocol=request.getParameter("protocol");
  }
  if(request.getParameter("os_type")!=null){
     os_type=request.getParameter("os_type");
  }  
  if(request.getParameter("usages")!=null){
     usages=request.getParameter("usages");
  }
  
  if(asset_name==null||priority==0||inter_face==null||protocol==null||os_type==null||usages==null){
               PrintWriter script=response.getWriter();
               script.println("<script>");
               script.println("alert('입력이 안 된 사항이 있습니다.')");
               script.println("history.back()");
               script.println("</script>");
               script.close();
               return;
            }
  
  //모든 입력사항을 다 입력한 경우 
               AssetDAO assetDAO = new AssetDAO(); //assetDAO 객체에 AssetDAO 저장
               //result에 assetDAO에 있는 write함수 값을 저장
               int result = assetDAO.write(new AssetDTO(0, asset_name, priority, account_manage, 
            		   encryption,logging,external_connect, asset_type, inter_face,protocol,os_type,usages));
               
               if(result==-1){
                  PrintWriter script=response.getWriter();
                  script.println("<script>");
                  script.println("alert('자산리스트 추가에 실패했습니다.')");
                  script.println("</script>");
               }else{ //자산 추가 성공적으로 이루어진 경우
                  PrintWriter script=response.getWriter();
                  script.println("<script>");
                  script.println("location.href='asset_list.jsp'");
                  script.println("</script>");
               }
              
%>

     
</body>
</html> 