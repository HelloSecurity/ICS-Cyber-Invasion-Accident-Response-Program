<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="java.lang.reflect.Type"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="eva.ControlItemDo"%>
<%@page import="eva.EvaDAO"%>
<%@page import="eva.SelectedControlItem"%>
<%@page import="asset.AssetDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*" %>
<%@ page import ="java.util.ArrayList"%> 
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="evaDAO" class="eva.EvaDAO" />
<jsp:useBean id="eva" class="eva.SelectedControlItem" />
<jsp:useBean id="assetDAO" class="asset.AssetDAO" />
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width", initial-scale="1">
  <link rel="stylesheet" href="css/bootstrap.css">
<title>취약점 진단 프로그램</title>
</head>
<body>

<%

String jsonStr = request.getParameter("real_data"); // ajax를 이용해 데이터 받기

Gson gson = new Gson(); // 받은 데이터를 List<Item> 타입으로 변환

Type type = new TypeToken<List<ControlItemDo>>() {}.getType();
List<ControlItemDo> itemList = gson.fromJson(jsonStr, type); // itemList의 값 타입은 ControlItemDo


//디비에 삽입
EvaDAO insertDAO = new EvaDAO(); // ControlItemDB와 연결하는 EvaDAO 객체를 생성
insertDAO.insertSelectItem(itemList); //EvaDAO에서 정의한 insertSelectItem함수로 SelectedControlItemDo 디비에 삽입

pageContext.forward("sec_eva.jsp"); //asset_eva_select에서 모든 과정을 처리하면  sec_eva.jsp로 화면 포워딩 꼭 필요!


/* 
★값이 잘 넘어오는지 asset_eva_select에서 확인
//아래 ${str }, ${itemList }, ${PRIORITY } 로 값 전송
request.setAttribute("str", asset_name);
request.setAttribute("itemList", itemList);
request.setAttribute("PRIORITY", assetfinal);
request.setAttribute("CONTROL", exam);
request.getRequestDispatcher("sec_eva.jsp").forward(request, response);
${requestScope.CONTROL }
asset_name: ${CONTROL } <br>
*/


%>
<!-- ★값이 잘 넘어오는지 asset_eva_select에서 확인  
asset_name: ${str } <br>
itemList: ${itemList } <br>
자산우선순위 : ${PRIORITY } <br>
datas : ${CONTROL } -->

</body>
</html>