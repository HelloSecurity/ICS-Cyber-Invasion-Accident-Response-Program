<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1,shrink-to-fit=no" >

<title>취약점 진단 프로그램</title>
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
<%--
String url = request.getRequestURL().toString();
if(url.startsWith("http://")&&(url.indexOf("localhost")<0&&url.indexOf("test")<0)){
	url=url.replaceAll("http://","https://");
	response.sendRedirect(url);
}
--%>
<%
   String userID=null;
   if(session.getAttribute("userID")!=null){
      userID=(String)session.getAttribute("userID");
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
         <li class="active"><a href="main.jsp">메인</a></li>
         <li><a href="asset_list.jsp">자산 리스트</a></li>
 <li><a href="asset_eva.jsp" onclick="return eva_button()">자산 평가</a></li>
          <script type="text/javascript">
         function eva_button() {
             return confirm("평가할 자산을 선택해주세요.")           }
       </script>         <li><a href="sec_eva.jsp">보안성 평가 결과</a></li>   
         <li><a href="emergency_case.jsp">비상사건 관리</a></li>   
 <!-- <li><a href="scenario.jsp">시나리오 리스트</a></li>-->
         <li><a href="scenario_eva.jsp">시나리오 관리</a></li>
         <li><a href="infringement.jsp">침해대응 훈련</a></li>   
      </ul>
      <%
         if(userID==null){
      %>
         <ul class="nav navbar-nav navbar-right">
         <li class="dropdown">
            <a href="#" class="dropdown-toggle"
            data-toggle="dropdown" role="button" aria-haspopup="true"
            aria-expanded="false">접속하기<span class="caret"></span></a>
         <ul class="dropdown-menu">
            <li><a href="login.jsp">로그인</a></li>
            <li><a href="join.jsp">회원가입</a></li>
         </ul>
         </li>
         </ul>
      <%
         } else{
      %>
      <ul class="nav navbar-nav navbar-right">
         <li class="dropdown">
            <a href="#" class="dropdown-toggle"
            data-toggle="dropdown" role="button" aria-haspopup="true"
            aria-expanded="false">회원관리<span class="caret"></span></a>
         <ul class="dropdown-menu">
            <li><a href="logoutAction.jsp">로그아웃</a></li>
            
         </ul>
         </li>
         </ul>
         <% 
         } 
         %>
      
      </div>
   </nav>
      <section id="features">
               <div class="container">
               <br><br><br>
                  <header>
                       <%
         if(userID!=null){
      %>
				[${userID }]님 반갑습니다.     
				                <%
         }
                       %>             
                     <h3>Welcome! this is</h3>
                     <h2><strong>Industry Control System</strong> Cyber Emergency Response System Program</h2>
                  </header>
                  <div class="row aln-center">
                     <div class="col-4 col-6-medium col-12-small">

                        <!-- Feature -->
                           <section id="section1">
                              <header>
                                 <h3>Introduction</h3>
                              </header>
                              <p>
                             ▷ 국내외 산업제어시스템(ICS)을 대상으로 한 사이버공격은 점차 지능화되고 그 횟수가 증가하고 있음<br>
         ▷ 하지만 ICS는 대부분 취약점 체크리스트 기반의 점검에 초점을 맞추고 있기 때문에 실제 사이버공격 발생시 대응능력을 강화하기 위한 훈련은 부족함. 또한, ICS는 대부분 폐쇄망으로 구성되어 있어 사회 공학적 공격이 발생할 소지가 높음 <br>
          ▷ 본 프로젝트는 미국 원자력산업협회의 NEI 08-09를 기반으로 한 운영적 취약점을 진단 후 해당 취약점을 활용한 비상사건 시나리오 개발 및 시나리오를 통한 훈련 프로그램을 구축하는 것이 목표</p>
                           </section>

                     </div>
                     
                     <div class="col-4 col-6-medium col-12-small">

                        <!-- Feature -->
                           <section id="section2">
                              <header>
                                 <h3>Advantage & Feature</h3>
                              </header>
                              <p>
                                          ▷ 산업제어시스템에 특화된 보안 통제항목 및 자산 구성 관리<br>
			▷ 사이버 침해사고에 대응하기 위한 체계적인 훈련 체계 프로그램<br>
			▷ 기존 산업제어시스템에 발생했던 사이버 비상사건의 발생 원인 및 상황 등에 대해 관리 가능<br>
			▷ 도출된 취약점을 통해 비상사건 시나리오 등록 및 ISO 9126 품질특성 기준을 통해 시나리오 평가 가능 <br>
			▷ 비상사건 시나리오 및 침해대응 훈련 일자별 활동 등록 등과 같이 보다 구체적인 내용 명시 가능<br>
                              
                              ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ
                              ㅤㅤ
                              
                              </p>
                           </section>

                     </div>
                     <div class="col-4 col-6-medium col-12-small">

                        <!-- Feature -->
                           <section id="section3">
                              <header>
                                 <h3>Proposal Background</h3>
                              </header>
                              <p>
                              ▷ ICS 대상 해킹 위협 증가 : 국가기반시설 산업제어시스템을 대상으로 한 사이버 위협(스턱스넷 등)이 지속적으로 보고되고 있으며, 이러한 사이버 공격으로 인해 시스템 본연의 기능을 유지하지 못할 경우, 사회적으로 큰 혼란이 야기됨<br>
          ▷사이버 보안훈련 법제화 : ‘방사능 방재법’에 의하면, 2016년부터 사이버 보안 훈련을 반드시 수행해야 함 <br>
 ▷ 훈련 시나리오 개발 및 적정성 평가 기준 부족 : 사이버 보안훈련 계획 수립 시 우선적으로 훈련 시나리오를 개발하고, 규제기관은 이에 대한 적정성 평가를 수행해야 하나, 훈련 시나리오 평가를 위한 가이드라인과 기준 부족
                           </section>
               <br><br><br>

                     </div>
                  </div>
                  <hr>
                  <div class="col-12">
                        <a href="main.jsp" class="button icon fa-file">Back to Top</a>
                     </div>
               </div>
            <footer id="mainfooter">            <span>ㅤㅤ ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ COPYRIGHT ⓒ 2019 HelloSecurity. All Rights Reserved</span></footer>
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="js/bootstrap.js"></script>

</body>
</html>