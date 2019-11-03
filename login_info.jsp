<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.sql.*" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.net.URLEncoder" %>


<%
    request.setCharacterEncoding("UTF-8");

request.setCharacterEncoding("euc-kr");
//아이디 저장 체크 박스가 체크되었는지 확인 여부

//아이디 값을 저장
String id=request.getParameter("id");
String pw=request.getParameter("pw");

//체크가 되었는지 비교판단
	//쿠키를 사용하려면 - 쿠키클래스를 생성해주어야 함
	Cookie cookie = new Cookie("id", id);//첫번째 string키 값을 적어줌, 두번째는 value값을 넣어줌
	Cookie cookie2 = new Cookie("pw", pw);
	
	//쿠키 유효시간 설정
	cookie.setMaxAge(60*60); //1시간동안 유효
	cookie2.setMaxAge(60*60);
	
	response.addCookie(cookie); //사용자에게 쿠키 값을 넘겨줌
	response.addCookie(cookie2);
	
	Cookie[] cookies = request.getCookies();
	if(cookies!=null&&cookies.length>0){
		for(int i=0;i<cookies.length;i++)
		{
%>  
<%=cookies[i].getName() %> :
<%=URLDecoder.decode(cookies[i].getValue(),"utf-8") %><br>
<%}
}else{
%>
쿠키가 존재하지 않습니다.
<%
}
%>
