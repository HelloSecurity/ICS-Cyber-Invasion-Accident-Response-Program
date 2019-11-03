<%@ page language="java" import="java.sql.*, java.lang.*, java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8" %>
<%@ page import="emergency.EmergencyItem" %>
<%@ page import="emergency.EmergencyDAO" %>
<%@ page import="emergency.CyberAttackDAO" %>
<%@ page import="emergency.CyberAttackItem" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="dao" class="emergency.CyberAttackDAO" />

<%
    request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="listDAO" class="asset.AssetDAO" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
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

<body>

<!-- 제이쿼리 자바스크립트 추가하기 -->
<script src="./js/jquery.min.js"></script>
<!-- 파퍼 자바스크립트 추가하기 -->
<script src="./js/popper.js"></script>
<!-- 부트스트랩 자바스크립트 추가하기 -->
<script src="./js/bootstrap.min.js"></script>

<style>
    .btn-primary{
			background-color:#848484;
			border-color:#848484
		}
 </style>

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
				<li><a href="asset_eva.jsp" onclick="return eva_button()">자산
						평가</a></li>
				<li><a href="sec_eva.jsp">보안성 평가 결과</a></li>
				<li class="active"><a href="emergency_case.jsp">비상사건 관리</a></li>
				<!-- <li><a href="scenario.jsp">시나리오 리스트</a></li>-->
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
            aria-expanded="false">접속하기<span class="caret"></span></a>
         <ul class="dropdown-menu">
            <li><a href="login.jsp">로그인</a></li>
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
   
         
   <br><br>
   <div id = "search" style="padding-bottom : 15px; margin-right:370px;" align="right">
       <input type = "text" placeholder = "사건명 입력">
       <button>검색</button>
    </div> 
          
    <section class="container">
    <div class ="row">
         <table name="Control_Item_Table" class="table table-striped" style="text-align:center; border:1px solid #dddddd">
         
         <thead>
         <tr>
         <th width=2%  style="background-color:#eeeeee; text-align:center;">번호</th>      
        <th width=9% style = "background-color : #eeeeee; text-align:center;">사건명</th>
        <th width=11% style = "background-color : #eeeeee; text-align:center;">개요</th>
        <th width=4% style = "background-color : #eeeeee; text-align:center;">사건 피해 수준</th>
        </tr>
        </thead>
        
        <tbody>
        <%
           int pageNumber = 1;
           if (request.getParameter("pageNumber") != null)  {
                pageNumber = Integer.parseInt(request.getParameter("pageNumber"));               
              }              
              EmergencyDAO emergency = new EmergencyDAO();
              ArrayList<EmergencyItem> list = emergency.getList(pageNumber);
              for( int i =0; i < list.size(); i++) {
                 
          %>
          
          
          
        <tr>
        <td><%=list.get(i).getId() %></td>
        <td><strong><font color="blue"><a href="emergencyView.jsp?id=<%=list.get(i).getId()%>"><%=list.get(i).getIncident_name() %></a></font></strong></td>
        <td><%=list.get(i).getIncident_sum() %></td>
        <td><%=list.get(i).getDamage_level() %></td>
       <!--
       <form method="get" action="./regAction.jsp" class="form-inline mt-3"  style="float:right;">
             <a href="#attack_reg" data-toggle="modal" class="btn btn-primary btn-sm" value="<%=i %>">사이버 공격경로 등록</a>ㅤ
             </form></td>
        </tr>
          -->
        <% } %>
        
        
       <!-- ArrayList<EmergencyItem> list = emergency.getList(pageNumber);  -->
        

        
        </tbody>
       </table>
    </div>
    
   
   <form method="post" action="./emergencyRegAction.jsp" class="form-inline mt-3"  style="float:right;">
   ㅤ<input type="button" id="id_check" onclick="location.href='emergencyReg.jsp'"class="btn btn-primary mx-1 mx-2" value="비상사건 등록" style="float:right"> 
   </form>
   <!--  
   <form method="post" action="./emergencyRegAction.jsp" class="form-inline mt-3"  style="float:right;">
   <a href="#emergency_reg" data-toggle="modal" class="btn btn-primary mx-1 mx-2">추가</a>ㅤ
   </form>
    
   <div class="modal fade" id="emergency_reg" tabindex="-1"
      role="dialog" aria-labelledby="modal" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h3>비상사건 등록</h3>
               <br>               
               <form action="./emergencyRegAction.jsp" method="post">
               <div class="form-row">
                      <div class="form-group col-sm-12" style = "float:left">
                        <label>발생연도</label>
                        <input type="text" name="year" class="form-control" maxlength="5">
                        
                      </div>
                    </div>

                    <div class="form-row">
                      <div class="form-group col-sm-12">
                      <label>발생 국가</label>
                        <input type="text" name="country" class="form-control" maxlength="5">
                      </div>
                    </div>
      
                    <div class="form-row">
                     <div class="form-group col-sm-6">
                     <label>발생 도시</label>
                     <input type="text" name="city" class="form-control" maxlength="20">
                     </div>
                     
                     <div class="form-group col-sm-6">
                     <label>발생 기관</label>
                     <input type="text" name="agency" class="form-control" maxlength="20">
                     </div>
             
                    </div>
              
                    <div class="form-row">
                      <div class="form-group col-sm-12">
                        <label>사건명</label>
                        <input type="text" name="incident_name" class="form-control" maxlength="20">
                      </div>
                    </div>
                    
                    <div class="form-row" style = "border : 20px">
                      <div class="form-group col-sm-12" style = "margin-right : 20px">
                        <label>사이버공격 피해수준</label>
                        <select name = "damage_level">
                           <option value="상">상</option>
                           <option value="중">중</option>
                           <option value="하">하</option>
                        </select>
                      </div>
                    </div>
              
                    <div class="form-row">
                      <div class="form-group col-sm-12">
                        <label>사건 개요</label>
                        <textarea cols="50" rows="9" placeholder="내용을 입력하세요. " name="incident_sum" class="form-control"></textarea>
                      </div>
                    </div>
                    
                    <div class="form-row">
                      <div class="form-group col-sm-12">
                        <label>사건 내용</label>
                        <textarea cols="50" rows="9" placeholder="내용을 입력하세요. " name="incident_content" class="form-control"></textarea>
                      </div>
                    </div>
      
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                      <button type="submit" class="btn btn-primary" data-target="#attack_reg">등록하기</button>
                    </div>
               </form>               
            </div>
         </div>
      </div>
   </div>


    
    <div class="modal fade" id="attack_reg" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
        <div class="modal-header">
           <h5 class="modal-title" id="modal">사이버 공격 경로</h5>
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
           <span aria-hidden="true">&times;</span>
           </button>
        </div>

         
          <div class="modal-body">
            <form action="./regAction.jsp" method="post">
              
              <div class="form-row">
                <div class="form-group col-sm-6" style = "margin-bottom:13px">
                  <h4>1.운영적 보안조치</h4>
                  <h4></h4> 
                  <div class = "check_div" id = "checkdiv">
                  
             
             
             <table class="table table-striped" style="text-align:center; padding: 10px;border:1px solid #dddddd">
                  <thead>
                 <h4>1.2 시스템 및 정보의 무결성</h4>
                 </thead>
                 <tbody>

                  <thead>
                  <tr>
                  <th  style="background-color:#eeeeee; text-align:center;"></th>
                  <th  style="background-color:#eeeeee; text-align:center;">번호</th>                         
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
                 <td>악성코드 유입 방지</td>
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
                
                <div class="form-group col-sm-6" style = "margin-bottom:13px">
                  <h4>2.관리적 보안 조치</h4>
                  <div class = "check_div" id = "checkdiv">
                  <table class="table table-striped" style="text-align:center; padding: 10px;border:1px solid #dddddd">
                  <thead>
                 <h4>2.1 시스템 및 서비스 획득</h4>
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
             </tbody>
             </table>
              </div>
              </div>


              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="submit" class="btn btn-primary" onclick="return test_checkbox()">등록하기</button>
              </div>

            </form>

          </div>

        </div>

      </div>

    </div>
    
    -->
                      
              </section>
          
            <footer id="mainfooter">
            <span>ㅤㅤ ㅤㅤ COPYRIGHT ⓒ 2019  HelloSecurity. All Rights Reserved</span></footer>
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="js/bootstrap.js"></script>

</body>