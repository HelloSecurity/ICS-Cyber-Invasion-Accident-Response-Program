<%@ page language="java" import="java.sql.*, java.lang.*, java.util.*" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<%@ page import="scenario.ScenarioItem" %>
<%@ page import="scenario.ScenarioDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import = "java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dao" class="scenario.ScenarioDAO" />
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width", initial-scale="1">
  <script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>취약점 진단 프로그램</title>

<script>
   $(document).ready(function(){   
   alert("평가 할 시나리오 제목을 눌러주세요.");   
   });

</script>

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
      ScenarioItem scenarioitem = new ScenarioDAO().getScenario_content(id);
           
      
   %>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">ICS 취약점 진단 웹 사이트</a>
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
			 <!-- <li><a href="scenario.jsp">시나리오 리스트</a></li>-->
         <li><a href="scenario_eva.jsp">시나리오 관리</a></li>
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
    
    
    <div class = scenario_evaluationdiv class="container" style="margin-left:265px; margin-right:265px; padding: 10px">
	<table name="eva_result" class="table table-striped" style="text-align:center; border:1px solid #dddddd">
         
         
    	 <thead>
         <tr>
         <th width=17% colspan="5" style="background-color:#eeeeee; text-align:center;">평가 결과</th>
    	 </tr>
    	 </thead>
    	 
    	 <thead>
         <tr>
         <th width=3% style="background-color:#eeeeee; text-align:center;">정확성</th>
         <th width=3% style="background-color:#eeeeee; text-align:center;">실현가능성</th>
         <th width=3% style="background-color:#eeeeee; text-align:center;">완전성</th>
         <th width=3% style="background-color:#eeeeee; text-align:center;">효율성</th>
         <th width=3% style="background-color:#eeeeee; text-align:center;">가시성</th>
    	 </tr>
    	 </thead>
    	 
    	 <tbody>
    	 <tr>
    	 <td><%=scenarioitem.getAccuracy()%></td>
    	 <td><%=scenarioitem.getFeasibility() %></td>
    	 <td><%=scenarioitem.getEfficiency()%></td>  	 
    	 <td><%=scenarioitem.getComplete()%></td>
    	 <td><%=scenarioitem.getVisibility() %></td>    	 
    	 </tr>
    	
    	 </tbody>
    </table>
    </div>
    <div class="container">
	<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
	    
	    <tbody>
	    
	    <tr>	        
	    <td width=8% colspan="2">시나리오 번호</td>
	    <td><%=scenarioitem.getId() %></td> <!-- DB에서 자동으로 가져옴 -->
	    <tr>
	    	        
	    <td width=8% colspan="2">시나리오 제목 </td>
        <td><%=scenarioitem.getScenario_name() %></td>
	    </tr>
	    
	    <tr>	        
	    <td width=8% colspan="2">해당 자산 </td>
        <td colspan = "3"><%=scenarioitem.getAsset_name() %>
      	</td>
	    </tr>
	    
	    <tr>	        
	    <td width=8% colspan="2">침해사고수준 </td>
        <td colspan = "3"><%=scenarioitem.getInfringement_level() %></td>
	    </tr>
	    
	    <tr>	        
	    <td width=8% colspan="2">초기조건: </td>
        <td colspan = "3"><%=scenarioitem.getScenario_condition() %></td>
	    </tr>
	    
	    <tr>
	    <td width=8% colspan="2">시나리오 요약: </td>
	    <td><%=scenarioitem.getScenario_sum() %></td>
	    </tr>
	    
	    <tr>
	    <td width=8% colspan="2">시나리오 내용: </td>
	    <td><%=scenarioitem.getScenario_content() %></td>
	    </tr>
	    
	    
	    </tbody> 
	</table>
	<div id="crud_button">
	<input type="button" style = "margin-right:10px" value="시나리오 평가 화면으로" class="btn btn-primary pull-left" onclick="javascript:location.href='scenarioEva.jsp'"/>
		
	  <form method="post" action="scenarioEvaDelete.jsp?id=<%=id %>" class="form-inline mt-3"  style="float:right;">
	  	<input type = "hidden" name = "id" value = "<%= id %>">
      <button type = "button" style = "margin-left:10px" value = "평가 삭제" onclick="confrim_event()" data-toggle="modal" class="btn btn-primary pull-right">삭제</button>
      </form>
      
      <script>
      function confrim_event(){
    	  if (confirm("정말 삭제하시겠습니까??") == true){ //확인
    		  location.href="scenarioEvaDelete.jsp?id=<%=id %>";   	  
    	      document.form.submit();
    	  } else{   //취소
    	      return;
    	  }
      }    	  
      </script>
       


      <form method="get" action="" class="form-inline mt-3">
      <button type = "button" style = "margin-left:10px" value = "평가 수정" onclick="javascript:location.href='scenarioEvaReg.jsp?id=<%=id %>'" data-toggle="modal" class="btn btn-primary pull-right">수정</button>
      </form>

	    
	    </div>
	</div>
    
</body>

<!--  
	    <tr>
	    
	     
	    <td colspan="5">
	    	
	    	<input type="button" value="시나리오 목록으로" onclick="javascript:location.href='scenario_step1.jsp'" class = "btn btn-primary pull-right"/></a>
	        
	                    <!-- <a class="btn btn-default" onclick="sendData()"> 등록 </a>
	                    <a class="btn btn-default" type="reset"> reset </a>
	                    <a class="btn btn-default" onclick="javascript:location.href='list.jsp'">글 목록으로...</a> -->
	    <!--  
	    </td>
	    </tr>
	    
	    -->
</html>