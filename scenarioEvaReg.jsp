<%@ page language="java" import="java.sql.*, java.lang.*, java.util.*" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<%@ page import="scenario.ScenarioItem" %>
<%@ page import="scenario.ScenarioDAO" %>
<%@ page import="scenario.ScenarioEvaItem" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import = "java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dao" class="scenario.ScenarioDAO" />
<html>
<head>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width", initial-scale="1">
  <script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>취약점 진단 프로그램</title>

 <link rel="stylesheet" href="css/bootstrap.css">
<!-- 부트스트립 css 추가하기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<!-- 커스텀 css 추가하기 -->
<link rel="stylesheet" href="./css/custom.css">
</head>
<body>
<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="./js/jquery.min.js"></script>
	<!-- 파퍼 자바스크립트 추가하기 -->
	<script src="./js/popper.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>
	
	<% // 로그인여부 확인
      String userID=null;
      if(session.getAttribute("userID")!=null){
         userID=(String)session.getAttribute("userID");
      }
      
      int id = 0;
      if (request.getParameter("id") != null) {
         id = Integer.parseInt(request.getParameter("id"));
      }
      
      if (id == 0) {
         
        PrintWriter script=response.getWriter();
        script.println("<script>");
        script.println("alert('유효하지 않은 글 입니다..')");
        script.println("location.href='scenarioEva.jsp'");
        script.println("</script>");
        script.close();
         
      }
      
      
      ScenarioEvaItem scenarioitem = new ScenarioDAO().getScenario_content(id);
      
           
      
   %>

	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">산업제어시스템 사이버 침해사고 대응체계 프로그램</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="asset_list.jsp">자산 리스트</a></li>
				<li><a href="asset_eva.jsp" onclick="return eva_button()">자산
						평가</a></li>
				<li><a href="sec_eva.jsp">보안성 평가 결과</a></li>
				<li><a href="emergencyCase.jsp">비상사건 관리</a></li>
		<!-- 	<li><a href="scenario.jsp">시나리오 리스트</a></li> -->
				<li class="active"><a href="scenario_eva.jsp">시나리오 관리</a></li>
				<li><a href="infringement.jsp">침해대응 훈련</a></li>
			</ul>
			<%
				//로그인 여부에 따라 달라지는 탭 구현 위한 코드
				if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>

    <style>
    .table{
    	width:90%;
    	margin:auto;
    	border: 1px solid #444444;
    }
    .btn-primary{
			background-color:#848484;
			border-color:#848484
		}
    </style>
    <br>
    
        <div class="container">
	<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
	    
	    <tbody>	    
	    <tr>	        
	    <td width=12% colspan="2"><strong>시나리오 번호</strong></td>
	    <td><%=scenarioitem.getId() %></td> <!-- DB에서 자동으로 가져옴 -->
	    </tr>
	    
	    <tr>	        
	    <td width=12% colspan="2"><strong>시나리오 제목</strong> </td>
        <td><%=scenarioitem.getScenario_name() %></td>
	    </tr>
	    
	    <tr>	        
	    <td width=12% colspan="2"><strong>해당 자산</strong> </td>
        <td colspan = "3"><%=scenarioitem.getAsset_name() %></td>
	    </tr>
	    
	    <tr>	        
	    <td width=12% colspan="2"><strong>침해사고수준</strong> </td>
        <td colspan = "3"><%=scenarioitem.getInfringement_level() %></td>
	    </tr>
	    
	    <tr>	        
	    <td width=12% colspan="2"><strong>초기 조건</strong> </td>
        <td colspan = "3"><%=scenarioitem.getScenario_condition() %></td>
	    </tr>
	    <tr>
	    <td width=12% colspan="2"><strong>시나리오 요약</strong> </td>
	    <td><%=scenarioitem.getScenario_sum() %></td>
	    </tr>
	    
	    <tr>
	    <td width=12% colspan="2"><strong>시나리오 내용</strong></td>
	    <td><%=scenarioitem.getScenario_content() %></td>
	    </tr>	    
	    </tbody> 
	</table>
	
	
	<div>
	

	
	</div>
	</div>
	</div>
	<%
				for (int i = 1; i <= 1; i++) {
			%>
			<br>
    		<form method="get" action="./regAction.jsp" class="form-inline mt-3" style="float:right; margin-right:300px">
				<a href="#scenario_eva" data-toggle="modal" class="btn btn-primary mx-1 mx-2" value="<%=i%>">평가하기</a>ㅤ
			</form>
				<%
				}
			%>
			<div class="modal fade" id="scenario_eva" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog">
			<div class="modal-content">
				<div class="scenario_table" style = "display:inline; float:left; width:70%">    
			<form name = "scenario_evaluation" id = "evaluation" action = "scenarioEvaRegAction.jsp" method = post>
			<%request.setAttribute("ID", id); %>
			<%-- 게시물 ID action.jsp로 넘기기--%>
	 		<input type="hidden" name="id" value="<%= id %>">      
			<table name="scenario_evaluation" class="table table-striped" style="width:500px; text-align:center; border:2px solid #dddddd">
	         <style>
	         tbody>td{
	         background-color:#eeeeee;}
	         a{
	         margin-right:10px;
	         }
	         </style>
    	 <thead>
         <tr>
         <th width=3% colspan="2" style="background-color:#eeeeee; text-align:center;">평가하기</th>           	 
    	 </tr>
    	 </thead>
    	 
    	   	 
    	 <tbody style="background-color:#eeeeee">
    	 <tr>
    	 <td>정확성</td>
    	 <td><input type="radio" name="accuracy" value="상">상
			<input type="radio" name="accuracy" value="중">중
			<input type="radio" name="accuracy" value="하">하
    	 </td>
    	 </tr>
    	 
    	 <tr>
    	 <td>실현가능성</td>
    	 <td><input type="radio" name="feasibility" value="상">상
			<input type="radio" name="feasibility" value="중">중
			<input type="radio" name="feasibility" value="하">하
    	 </td>
    	 </tr>
    	 
    	 <tr>
    	 <td>효율성</td>
    	 <td><input type="radio" name="efficiency" value="상">상
			<input type="radio" name="efficiency" value="중">중
			<input type="radio" name="efficiency" value="하">하
    	 </td>
    	 </tr>
    	 
    	 <tr>
    	 <td>완전성</td>
    	 <td><input type="radio" name="complete" value="상">상
			<input type="radio" name="complete" value="중">중
			<input type="radio" name="complete" value="하">하
    	 </td>
    	 </tr>
    	 
    	 <tr>
    	 <td>가시성</td>
    	 <td><input type="radio" name="visibility" value="상">상
		<input type="radio" name="visibility" value="중">중
		<input type="radio" name="visibility" value="하">하
		</td>
    	 </tr>
    	 
    	
    	 <tr>
    	<td width=3% colspan="2" style=" text-align:center;">
    	<button id = evaluate_btn class = "btn btn-primary pull-right" type="submit" onclick="doAssessment()">평가완료</button>
    	</td>
    	</tr>
    	 
    	</tbody>
    </table>
    
    </form>
    </div>
    
	</div>
</body>
</html>