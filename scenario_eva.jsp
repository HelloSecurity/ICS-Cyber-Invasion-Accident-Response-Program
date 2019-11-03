<%@ page language="java" import="java.sql.*, java.lang.*, java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8" %>
<%@ page import="scenario.ScenarioItem" %>
<%@ page import="scenario.ScenarioEvaItem" %>
<%@ page import="scenario.ScenarioDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
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
   alert("평가할 시나리오 제목을 눌러주세요.");   
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
      String userID = null;
      if (session.getAttribute("userID") != null) {
         userID = (String) session.getAttribute("userID");
      }
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
            <li><a href="emergency_case.jsp">비상사건 관리</a></li>            
 <!-- <li><a href="scenario.jsp">시나리오 리스트</a></li>-->
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
   <br>
   <div id = "search" style="padding-bottom : 15px; margin-right:400px;" align="right">
       <input type = "text" placeholder = "시나리오명 입력">
       <button>검색</button>
    </div>
      <style>
          .btn-primary{
			background-color:#848484;
			border-color:#848484
		}
      </style>
                          
    <section class="container">
    
    
    <div class ="row">
         <table name="Control_Item_Table" class="table table-striped" style="text-align:center; border:1px solid #dddddd">
         <!-- table table striped는 짝수 홀수 번갈아가면서 색이 다른 속성 -->
         
         <thead>
         <tr>         
         <th width=3% style="background-color:#eeeeee; text-align:center;">번호</th>                
         <th width=12% style = "background-color : #eeeeee; text-align:center;">시나리오 명</th>
         <th width=5% style = "background-color : #eeeeee; text-align:center;">침해사고 수준</th>
         <th width=5% style = "background-color : #eeeeee; text-align:center;">평가 결과</th>
         </tr>
         </thead>
        
        <tbody>
           <%
           int pageNumber = 1;
             if (request.getParameter("pageNumber") != null)  {
                 pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
                 
              }
              
              ScenarioDAO scenario = new ScenarioDAO();
              ArrayList<ScenarioEvaItem> list = scenario.getList(pageNumber);
              for( int i =0; i < list.size(); i++) {
                 
          %>
          
         
           <tr>           
           <td><%=list.get(i).getId() %></td>
           <%
           // 평가 결과가 없는 경우
           if(list.get(i).getAccuracy()==null) {
           %>
           
           <td><strong><font color="blue"><a href="scenarioEvaReg.jsp?id=<%=list.get(i).getId()%>"><%=list.get(i).getScenario_name() %></a></font></strong></td>
           <td><%=list.get(i).getInfringement_level()%></td>
           <td><img src="images/circle.png" width="30" height="28" style="text-align:center;"> 평가 전</td>
           <%
           } else { // 평가 결과가 있는 경우
           %>
            <td><strong><font color="blue"><a href="scenarioEvaComplete.jsp?id=<%=list.get(i).getId()%>"><%=list.get(i).getScenario_name() %></a></font></strong></td>
            <td><%=list.get(i).getInfringement_level()%></td>
          
         
            <td><img src="images/check.png" width="30" height="35" style="text-align:center;"> 평가 완료 </td>      
           
           	<%
           }
           %>
        
           </tr>

          <%                         
              }
             %>

       
        </tbody>
       </table>
    </div>
    </section>
      <div id="crud" style="padding:10px; float:right; margin-right:360px;" align="right" >
         <!-- <button class = "btn btn-primary pull-right" onclick="location.href='asset_eva_select.jsp';"  type="button">평가완료</button> -->
		    <%
		 for(int i=1; i<= 1; i++){
		
		
		%>                           
		
		             <form method="post" action="./ScenarioAction.jsp" class="form-inline mt-3"  style="float:right;">
		                 <a href="#scenario_reg" data-toggle="modal" class="btn btn-primary mx-1 mx-2" value="<%=i %>">시나리오 등록</a>ㅤ
		                 
		               </form>
		
		          <%
		  }
		   %>
               </div>
         
         
        <div class="modal fade" id="scenario_reg" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
            <div class="modal-dialog">

        <div class="modal-content">

          <div class="modal-header">
     
           <h3>시나리오 등록</h3>
       </thead>
       <tbody>
      <form action="./ScenarioAction.jsp" method="get">
        <div class="form-row">
         <div class="form-group col-sm-6">
       <label>시나리오 번호</label>
               <input type="text" name="id" class="form-control"  "maxlength="20">
       </div>
                       <div class="form-group col-sm-6">
       
       <label>시나리오 제목 </label>
         <input type="text" name="scenario_name" class="form-control" placeholder="제목을 입력하세요. "maxlength="20">
        
              </div>
              
            <div class="form-row">
        <div class="form-group col-sm-6">
        
       <label>해당 자산 </label>
       <input type="text" placeholder="내용을 입력하세요." name="asset_name" class="form-control"/>
       </div>       
      
        <div class="form-group col-sm-6">
       <label>침해사고수준 </label>
        <select name="infringement_level" >
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
            </select>
         </div>
         </div>
             
         <div class="form-row">
                         <div class="form-group col-sm-6">
         
       <label>초기 조건 </label>
        <input type="text" placeholder="내용을 입력하세요. " name="scenario_condition" class="form-control"/>
           </div>
                 <div class="form-row">
       <label>시나리오 요약</label>
       <textarea name="scenario_sum" cols="10" placeholder="내용을 입력하세요. " name="content" class="form-control"></textarea>
 
       </div>
       
       <br>
       <div class="form-row">
       <label>시나리오 내용: </label>
       <textarea cols="50" rows="30" placeholder="내용을 입력하세요. " name="scenario_content" class="form-control"></textarea>
       </div>
        
     
      <br>
        <button style="float:right; margin-right:3px" type="button" class="btn btn-secondary mx-1" data-dismiss="modal">취소</button>
        <button style="float:right;" type="submit" class="btn btn-primary mx-1" onclick="return test_checkbox()">등록하기</button>
       
            </form>
   </div>
   </div>           

   </div></div>
   
    
      <div id="crud" style="padding-left:10px;margin:10px; float:right; margin-right:265px;"  align="right" >
         <!-- <button class = "btn btn-primary pull-right" onclick="location.href='asset_eva_select.jsp';"  type="button">평가완료</button> -->
      <!--  <button class = "btn btn-primary pull-right" type="submit">평가하기</button> -->
   </div>
   
   <div style="position:absolute; right:0px; left:0px; bottom:0px;">
	<footer id="mainfooter">
            <span>COPYRIGHT ⓒ 2019  HelloSecurity. All Rights Reserved</span></footer>
   </div>
   
     
     
    
</body>
</html>
    
    