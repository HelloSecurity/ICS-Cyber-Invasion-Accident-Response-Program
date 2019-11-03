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
</head>
<style>
    .btn-primary{
			background-color:#848484;
			border-color:#848484
		}
	.a{
	width:100px;
	text-align:center;
	vertical-align:middle;
	}
 </style>
<body>

	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="./js/jquery.min.js"></script>
	<!-- 파퍼 자바스크립트 추가하기 -->
	<script src="./js/popper.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>
	
	<%
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
    
    <!-- <form action="./emergencyRegAction.jsp" method="post"> -->
    <form action="./emergencyReg_Attack.jsp" method="post">
    <div class = "container1" style="width:60%; padding:10px; margin:10px auto;">    
    <table class="table table-bordered" style="border:1px solid black">
	    <thead>
	        <h3>비상사건 등록하기</h3>
	    </thead>
	    <tbody>
	    
	    <tr>	        
	    <td class="a"><strong>발생 연도</strong></td>
	    <td><input type="text" placeholder="연도를 입력하세요. " name="year" class="form-control"/></td> <!-- DB에서 자동으로 가져옴 -->
	    <tr>	        
	    <td  class="a"><strong>발생 국가</strong> </td>
        <td><input type="text" placeholder="발생 국가를 입력하세요. " name="country" class="form-control"/></td>
	    </tr>
	    
	    <tr>	        
	    <td  class="a"><strong>발생 도시</strong> </td>
        <td><input type="text" placeholder="발생 도시를 입력하세요. " name="city" class="form-control"/></td>
	    </tr>
	    
	    <tr>	        
	    <td  class="a"><strong>발생 기관</strong></td>
	    <td><input type="text" placeholder="기관을 입력하세요. " name="agency" class="form-control"/></td> <!-- DB에서 자동으로 가져옴 -->
	    <tr>
	    
	    <tr>	        
	    <td  class="a"><strong>사건명</strong></td>
	    <td><input type="text" placeholder="사건명을 입력하세요. " name="incident_name" class="form-control"/></td> <!-- DB에서 자동으로 가져옴 -->
	    <tr>
	    
	    <tr>	        
	    <td class="a"><strong>사이버공격 피해수준</strong> </td>
        <td><select name = "damage_level">
            <option value="상">상</option>
              <option value="중">중</option>
           <option value="하">하</option>
                        </select>
      	</td>
	    </tr>
	    
	    <tr>	        
	    <td class="a"><strong>사건 개요</strong></td>
	    <td><textarea cols="50" rows="9" placeholder="개요를 입력하세요. " name="incident_sum" class="form-control"></textarea></td> <!-- DB에서 자동으로 가져옴 -->
	    <tr>
	    
	    
	    <tr>	        
	    <td class="a"><strong>사건 내용</strong> </td>
        <td><textarea cols="50" rows="9" placeholder="내용을 입력하세요. " name="incident_content" class="form-control"></textarea></td>
	    </tr>
	   
	     
	    <tr>
	    <td colspan="2">
	    	<button type="submit" value="다음" class = "btn btn-primary pull-right" onclick="javascript:location.href='emergencyReg_Attack.jsp'">다음</button>
	        <input type="button" value="비상사건 목록으로" class="btn btn-primary pull-left" onclick="javascript:location.href='emergencyCase.jsp'"/>
	                    <!-- <a class="btn btn-default" onclick="sendData()"> 등록 </a>
	                    <a class="btn btn-default" type="reset"> reset </a>
	                    <a class="btn btn-default" onclick="javascript:location.href='list.jsp'">글 목록으로...</a> -->
	    </td>
	    </tr>
	    </tbody>
	</table>
	</div>
	</form>
	
	<footer id="mainfooter">
            <span> COPYRIGHT ⓒ 2019  HelloSecurity. All Rights Reserved</span></footer>
	
	
   
</body>
</html>