<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %> <%-- 자바스크립트 작성 위해 --%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID" /> <%-- 로그인페이지에서 받아서 넘겨주는거 --%>
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>취약점 진단 프로그램</title>
</head>
<body>
	<%
	String userID=null;
	if(session.getAttribute("userID")!=null){
		userID = (String)session.getAttribute("userID");
	}
	if(userID!=null){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(user.getUserID(), user.getUserPassword());
	if (result==1){
		session.setAttribute("userID", user.getUserID());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='main.jsp'");
		script.println("</script>");
		}else if(result==0){
		PrintWriter script =response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("history.back()");
		script.println("</script>");
		}else if(result==-1){
		PrintWriter script =response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");
		}else if(result==-2){
		PrintWriter script =response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류가 발생했습니다.')");
		script.println("history.back()");
		script.println("</script>");
		}
	%>
	<%
	request.setCharacterEncoding("euc-kr");
	//아이디 저장 체크 박스가 체크되었는지 확인 여부
	String save=request.getParameter("save");
	
	//아이디 값을 저장
	String id=request.getParameter("userID");
	String pw=request.getParameter("userPassword");
	
	//체크가 되었는지 비교판단
	if(save!=null){//아이디 저장이 눌렸다면
		//쿠키를 사용하려면 - 쿠키클래스를 생성해주어야 함
		Cookie cookie = new Cookie("id", id);//첫번째 string키 값을 적어줌, 두번째는 value값을 넣어줌
		Cookie cookie2 = new Cookie("pw", pw);
		
		//쿠키 유효시간 설정
		cookie.setMaxAge(60*60); //1시간동안 유효
		cookie2.setMaxAge(60*60);
		
		response.addCookie(cookie); //사용자에게 쿠키 값을 넘겨줌
		response.addCookie(cookie2);


	}	
	%>  
	
	
	
</body>
</html>