<%@ page language="java" import="java.sql.*, java.lang.*, java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8" %>
<%@ page import="emergency.EmergencyItem" %>
<%@ page import="emergency.EmergencyDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:useBean id="dao" class="emergency.EmergencyDAO" />
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width", initial-scale="1">
  <script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <link rel="stylesheet" href="css/bootstrap.css">
<title>취약점 진단 프로그램</title>
<style type="text/css">
#check_div {vertical-align: top;}
</style>
<!-- 부트스트립 css 추가하기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<!-- 커스텀 css 추가하기 -->
<link rel="stylesheet" href="./css/custom.css">
<style>
    .btn-primary{
			background-color:#848484;
			border-color:#848484
		}
 </style>
</head>

<body>

	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="./js/jquery.min.js"></script>
	<!-- 파퍼 자바스크립트 추가하기 -->
	<script src="./js/popper.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>
	
	<%
	
	request.setCharacterEncoding("UTF-8");
	
	String userID = null;
    if (session.getAttribute("userID") != null) {
       userID = (String) session.getAttribute("userID");
    }	
	
    String city = request.getParameter("city");
    String country = request.getParameter("country");
    String agency = request.getParameter("agency");
    String year = request.getParameter("year");
    String incident_name = request.getParameter("incident_name");
    String incident_sum = request.getParameter("incident_sum");
    String incident_content = request.getParameter("incident_content");
    String damage_level = request.getParameter("damage_level");
	
	%>
	
   	<nav class="navbar navbar-default">
   	<div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed"
      data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
      aria-expanded="false">
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>            
      </button>
      <a class="navbar-brand" href="main.jsp">산업제어시스템 사이버 침해사고 대응체계 프로그램</a>
   	</div>
   	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
         <li><a href="main.jsp">메인</a></li>
         <li><a href="asset_list.jsp">자산 리스트</a></li>
         <li><a href="asset_eva.jsp" onclick="return eva_button()">자산 평가</a></li>
         <li><a href="sec_eva.jsp">보안성 평가 결과</a></li>
         <li class="active"><a href="emergency_case.jsp">비상사건 관리</a></li>           
         <li><a href="scenario_eva.jsp">시나리오 관리</a></li>
         <li><a href="infringement.jsp">침해대응 훈련</a></li>
             
      </ul>
      
      <%
         //로그인 여부에 따라 달라지는 탭 구현 위한 코드
         if (userID == null) {
      %>
      
      <ul class="nav navbar-nav navbar-right">
         <li class="dropdown">
            <a href="#" class="dropdown-toggle"
            data-toggle="dropdown" role="button" aria-haspopup="true"
            aria-expanded="false">접속하기<span class="caret"></span>
            </a>
		    <ul class="dropdown-menu">
			<li class="active"><a href="login.jsp">로그인</a></li>
			<li><a href="join.jsp">회원가입</a></li>
		    </ul>
	     </li>
      </ul>
      
      <%
         } else { 
      %>
      
      <ul class = "nav navbar-nav navbar-right">
         <li class="dropdown">
            <a href="#" class="dropdown-toggle"
            data-toggle="dropdown" role="button" aria-haspopup="true"
            aria-expanded="false">회원관리<span class="caret"></span></a>
            <ul class="dropdown-menu">
               <li><a href="logoutAction.jsp">로그아웃</a></li>
            </ul>
         </li>
         <%
            }
         %>
      </ul>     
    </div>     
    </nav>
    
    <form action="./emergencyRegAction.jsp" method="post">
    <input type="hidden" name="agency" value="<%= agency %>">
    <input type="hidden" name="country" value="<%= country %>">
    <input type="hidden" name="year" value="<%= year %>">
    <input type="hidden" name="city" value="<%= city %>">
    <input type="hidden" name="damage_level" value="<%= damage_level %>">
    <input type="hidden" name="incident_name" value="<%= incident_name %>">
    <input type="hidden" name="incident_sum" value="<%= incident_sum %>">
    <input type="hidden" name="incident_content" value="<%= incident_content %>">
    <input type="hidden" id="real_data" name="real_data"/>
    
 
	<div class = "container2" style="width:1200px; float:center; margin-left:350px; margin-right:30px;padding:10px">
             <div class="form-row">
                <div class="form-group col-sm-6" style = "margin:0 auto;width:500px; ">
                <h3> [사이버 공격경로 등록]</h3>
                <br>
                  <h5>1.운영적 보안조치</h5>
                  <h5></h5> 
                  <div class = "check_div" id = "checkdiv">
                  <table class="table table-striped" align="center"style="text-align:center; padding: 10px;border:1px solid #dddddd">
                  <thead>
                 <h5>1.1 인적보안</h5>
                 </thead>
                 <tbody>

                  <thead>
                  <tr>
                  <th  style="background-color:#eeeeee; text-align:center;"></th>
                  <th  style="background-color:#eeeeee; text-align:center;">번호</th>                         
                 <th   style = "background-color : #eeeeee; text-align:center;">통제항목명</th>                 
                 </tr>
                 </thead>
                 
                 <tbody>              
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td>1.1.1</td>
                 <td>사용자승인</td>
                 </tr>
                 
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td>1.1.2</td>
                 <td>업무종료 혹은 이전</td>
                 </tr>
             </tbody>
             </table>
             
             <table class="table table-striped" style="text-align:center; padding: 10px;border:1px solid #dddddd">
                  <thead>
                 <h5>1.2 시스템 및 정보의 무결성</h5>
                 </thead>
                 <tbody>

                  <thead>
                  <tr>
                  <th style="background-color:#eeeeee; text-align:center;"></th>
                  <th style="background-color:#eeeeee; text-align:center;">번호</th>                         
                 <th  style = "background-color : #eeeeee; text-align:center;">통제항목명</th>                 
                 </tr>
                 </thead>
                 
                 <tbody>              
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td>1.2.1</td>
                 <td>결함 제거</td>
                 </tr>
                 
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td>1.2.2</td>
                 <td>악성코드 유입 방지</td>
                 </tr>
                 
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td>1.2.3</td>
                 <td>모니터링 도구 및 기술</td>
                 </tr>
                 
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td>1.2.4</td>
                 <td>보안 경고</td>
                 </tr>
                 
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td>1.2.5</td>
                 <td>보안기능 확인</td>
                 </tr>
                 
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td>1.2.6</td>
                 <td>소프트웨어 및 정보의 무결성</td>
                 </tr>
                 
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td>1.2.7</td>
                 <td>정보의 입력 제한</td>
                 </tr>
                 
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td>1.2.4</td>
                 <td>에러에 대한 조치</td>
                 </tr>
              </tbody>
               </table>    
                  </div>
                  
                  
                </div>
                <br><br><br><br>
                <div class="form-group col-sm-6" style = "margin:0 auto;width:500px;">
                  <h4>2.관리적 보안 조치</h4>
                  <div class = "check_div" id = "checkdiv">
                  <table class="table table-striped" style="text-align:center; padding: 10px;border:1px solid #dddddd">
                  <thead>
                 <h5>2.1 시스템 및 서비스 획득</h5>
                 </thead>
                 <tbody>

                  <thead>
                  <tr>
                  <th style="background-color:#eeeeee; text-align:center;"></th>
                  <th  style="background-color:#eeeeee; text-align:center;">번호</th>                         
                 <th style = "background-color : #eeeeee; text-align:center;">통제항목명</th>                 
                 </tr>
                 </thead>
                 
                 <tbody>              
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td>2.1.1</td>
                 <td>공급망 통제</td>
                 </tr>
                 
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td>2.1.2</td>
                 <td>신뢰성 확보</td>
                 </tr>
                 
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td>2.1.3</td>
                 <td>보안 설계 적용</td>
                 </tr>
                 
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td>2.1.4</td>
                 <td>개발자 보안 테스트</td>
                 </tr>
                 
                 <tr>
                 <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
                 <td>2.1.5</td>
                 <td>인수테스트</td>
                 </tr>
                 
                 <tr>
                 <td colspan="3">
                 <button id = "selectBtn" class = "btn btn-primary pull-right" type="submit">등록하기</button>
                 </td>
                 </tr>
             </tbody>
             </table>
              </div>
              </div>
              
               <!-- 
              <div id="selectBtn" style="padding-left:10px;margin:10px;" >
              <button id = "selectBtn" class = "btn btn-primary pull-right" type="submit">등록하기</button>
              </div>
               --> 
              <script>
       
		       $(document).ready(function () { 
		         $('#selectBtn').click(function(){
		           
		            var tdArr = new Array();
		            var checkbox = $("input[name=checkBox]:checked");
		            var checklen = $("input[name=checkBox]:checked").length;
		            
		            
		               //each는 가각에 대해서 반복문을 돌린다.
		                 checkbox.each(function(i){
		               var tr = checkbox.parent().parent().eq(i);
		               var td = tr.children();
		              
		               //var control_item_no=td.eq(1).text();
		               var control_item = td.eq(2).text();       
		               
		               var json_obj = {	                     
		                      //'control_item_no' : control_item_no,
		                      'control_item' : control_item,
		                   };
		             //배열에 json 객체 저장
		               tdArr.push(json_obj);
		            
		                     });
		                  var json_str = JSON.stringify(tdArr);
		                // alert(json_str);
		                 		                 
		               //hidden으로 설정 된 input 태그에 json 문자열 세팅
		               $('#real_data').val(json_str);           
		               
		               });
		               
		            });
       
       </script>

              
	</div>
	</div>
	
	</form>
	<div style="position:absolute; right:0px; left:0px; bottom:0px;">
	<footer id="mainfooter">
            <span>COPYRIGHT ⓒ 2019  HelloSecurity. All Rights Reserved</span></footer>
   </div>
</body>
</html>