<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width", initial-scale="1">
  <script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <link rel="stylesheet" href="css/bootstrap.css">
<title>취약점 진단 프로그램</title>
</head>
<body>
   <nav class="navbar navbar-default">
   <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed"
      data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
      aria-expanded="false">
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>            
      </button>
      <a class="navbar-brand" href="main.jsp">ICS 취약점 진단 웹 사이트</a>
   </div>
   <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
         <li><a href="main.jsp">메인</a></li>
         <li><a href="asset_list.jsp">자산 리스트</a></li>
         <li><a href="control_item_list.jsp">통제항목 리스트</a></li>
         <li><a href="asset_eva.jsp" onclick="return eva_button()">자산 평가</a></li>
         <li><a href="sec_eva.jsp">보안성 평가 결과</a></li>
         <li><a href="emergency_case.jsp">비상사건 관리</a></li>   
         <li class="active"><a href="scenario.jsp">시나리오 리스트</a></li>
         <li><a href="scenario_eva.jsp">시나리오 평가</a></li>
         <li><a href="breach_corr.jsp">침해대응 훈련</a></li>   
      </ul>
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
    </div>     
    </nav>
    <div id = "search" style="padding-bottom : 15px; margin-right:265px;" align="right">
    	<input type = "text" placeholder = "검색어 입력">
    	<button>검색</button>
    </div>
    <section class="container">
    <div class ="row">
         <table name="Control_Item_Table" class="table table-striped" style="text-align:center; border:1px solid #dddddd">
         
         <thead>
         <tr>
         <th width=3% style="background-color:#eeeeee; text-align:center;">번호</th>
                
    	 <th width=12% style = "background-color : #eeeeee; text-align:center;">시나리오 명</th>
    	 <th width=5% style = "background-color : #eeeeee; text-align:center;">침해사고 수준</th>
    	 </tr>
    	 </thead>
    	 
    	 <tbody>
    	 <tr>
    	 <td>1</td>
    	 <td>지하철이 해커 공격으로 마비</td>
    	 <td>3</td>
    	 </tr>
    	 
    	 <tr>
    	 <td>2</td>
    	 <td>DDos 공격으로 인한 농협 전산망 마비</td>
    	 <td>3</td>
    	 </tr>
    	 
    	 <tr>
    	 <td>3</td>
    	 <td>대학교 교수로 위장취업한 해커</td>
    	 <td>1</td>
    	 </tr>
    	 
    	 <tr>
    	 <td>4</td>
    	 <td>망 분리 미흡으로 인한 악성코드 감염</td>
    	 <td>3</td>
    	 </tr>
    	 
    	 <tr>
    	 <td>5</td>
    	 <td>무선 태블릿 반출로 인한 정보 유출</td>
    	 <td>2</td>
    	 </tr>
    	 
    	 <tr>
    	 <td>6</td>
    	 <td><a href="eunji_scenario.jsp">자바 업데이트 취약점을 노린 악성코드 감염</a></td> 
    	 <td>2</td>
    	 </tr>
    	 
    	 
    	 
    	 </tbody>
    	</table>
    </div>
    </section>
    
    
    
   	<div id="crud" style="padding:10px;margin:10px; float:right; margin-right:265px;"  align="right" >
         <!-- <button class = "btn btn-primary pull-right" onclick="location.href='asset_eva_select.jsp';"  type="button">평가완료</button> -->
		<button class = "btn btn-primary mx-1 mx-2 pull-right" type="submit" style = "margin : 3px">삭제</button>
		<button class = "btn btn-primary mx-1 mx-2 pull-right" type="submit" style = "margin : 3px">수정</button>
		<button class = "btn btn-primary mx-1 mx-2 pull-right" type="submit" style = "margin : 3px" onclick="javascript:location.href='scenario_new.jsp'">등록</button>
	</div>	
     
    
</body>
</html>