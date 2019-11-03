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
	<title>취약점 진단 프로그램</title>
	
	 <link rel="stylesheet" href="css/bootstrap.css">
	<!-- 부트스트립 css 추가하기 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<!-- 커스텀 css 추가하기 -->
	<link rel="stylesheet" href="./css/custom.css">
	<style>
			.btn{
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
        script.println("location.href='emergencyCase.jsp'");
        script.println("</script>");
        script.close();
         
      }
           
      EmergencyItem emergencyitem = new EmergencyDAO().getEmergency_content(id);
      
                
   %>
	<style>
			.btn{
				background-color:#848484;
				border-color:#848484
			}
	</style>
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
				<li><a href="asset_eva.jsp" onclick="return eva_button()">자산 평가</a></li>
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
  
  
  <br><br>
    <div style = "" class="container" >
   <table id = "emergency_item" class="table table-striped"
				style="border: 1px solid #dddddd">
       
       <tbody>
       
       <tr>           
       <td width=15% colspan="2"><strong>사건 번호</strong></td>
       <td colspan = "3"><%=emergencyitem.getId() %></td> <!-- DB에서 자동으로 가져옴 -->
       </tr>
  
       <tr>                
       <td width=15% colspan="2"><strong>사건 제목</strong> </td>
       <td colspan = "3"><%=emergencyitem.getIncident_name() %></td>
       </tr>
       
       <tr>                
       <td width=15% colspan="2"><strong>사이버 공격 경로 </strong></td>
       <td colspan = "3"><%=emergencyitem.getCyberattackpath() %></td>
       </tr>
       
       <tr>           
       <td width=15% colspan="2"><strong>발생 국가</strong> </td>
        <td colspan = "3"><%=emergencyitem.getCountry() %></td>
       </tr>
       
       <tr>           
       <td width=15% colspan="2"><strong>발생 기관</strong> </td>
        <td colspan = "3"><%=emergencyitem.getAgency() %></td>
       </tr>
       
       <tr>           
       <td width=15% colspan="2"><strong>발생 연도</strong> </td>
        <td colspan = "3"><%=emergencyitem.getYear() %></td>
       </tr>
       
       <tr>           
       <td width=15% colspan="2"><strong>사건 수준</strong> </td>
        <td colspan = "3"><%=emergencyitem.getDamage_level() %></td>
       </tr>
               
       
       <tr>
       <td width=15% colspan="2"><strong>사건 요약</strong> </td>
       <td colspan = "3"><%=emergencyitem.getIncident_sum() %></td>
       </tr>
       
       <tr>
       <td width=15% colspan="2"><strong>사건 내용</strong> </td>
       <td colspan = "3"><%=emergencyitem.getIncident_content() %></td>
       </tr>
       </tbody> 
   </table>
   
   <div id = "crud">
   <%
   for (int j =1; j<=1; j++) {
   
   %>
          <input type="button" value="비상사건 목록으로" class="btn btn-primary pull-left" onclick="javascript:location.href='emergency_case.jsp'"/>
          <form method="post" action="./emergencyDelAction.jsp"
            class="form-inline mt-3" style="float: right;">
            <a onclick="return confirm('정말로 삭제하시겠습니까?')"
            href="emergencyDelAction.jsp?id=<%=id%>" data-toggle="modal" class="btn btn-primary mx-1 mx-2"
               value="<%=j%>">삭제</a> </form>
               
      <form method="post" action="./emergencyUpdAction.jsp" class="form-inline mt-3"  style="float:right;">
         <a href="#emergency_update" data-toggle="modal" class="btn btn-primary mx-1 mx-2" value="<%=j%>" >수정</a>ㅤ
         </form>      
      <% } %>
      
      </div>
      
      <div class="modal fade" id="emergency_update" tabindex="-1"
      role="dialog" aria-labelledby="modal" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h3>비상사건 수정하기</h3>
               <br>               
               <form action="./emergencyUpdAction.jsp" method="post">
               <input type="hidden" name="id" value="<%=id%>">
               <div class="form-row">
                      <div class="form-group col-sm-12" style = "float:left">
                        <label>발생연도</label>
                        <input type="text" name="year"  value ="<%= emergencyitem.getYear() %>"class="form-control" maxlength="5">
                        
                      </div>
                    </div>

                    <div class="form-row">
                      <div class="form-group col-sm-12">
                      <label>발생 국가</label>
                        <input type="text" name="country"  value ="<%= emergencyitem.getCountry() %>"class="form-control" maxlength="5">
                      </div>
                    </div>
      
                    <div class="form-row">
                     <div class="form-group col-sm-6">
                     <label>발생 도시</label>
                     <input type="text" name="city"  value ="<%= emergencyitem.getCity() %>" class="form-control" maxlength="20">
                     </div>
                     
                     <div class="form-group col-sm-6">
                     <label>발생 기관</label>
                     <input type="text" name="agency"  value ="<%= emergencyitem.getAgency() %>"class="form-control" maxlength="20">
                     </div>
             
                    </div>
              
                    <div class="form-row">
                      <div class="form-group col-sm-12">
                        <label>사건명</label>
                        <input type="text" name="incident_name"  value ="<%= emergencyitem.getIncident_name() %>"class="form-control" maxlength="20">
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
                        <label>사건 요약</label>
                        <textarea cols="50" rows="9"
                        name="incident_sum" class="form-control"><%= emergencyitem.getIncident_sum()%></textarea>
                      </div>
                    </div>
                    
                    <div class="form-row">
                      <div class="form-group col-sm-12">
                        <label>사건 내용</label>
                        <textarea cols="50" rows="9"
                        name="incident_content" class="form-control"><%= emergencyitem.getIncident_content()%></textarea>
                      </div>
                    </div>
      
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                      <button type="submit" class="btn btn-primary" data-target="#attack_reg">수정하기</button>
                    </div>
               </form>               
            </div>
         </div>
      </div>
   </div>
      
      
   
   
</div>
<footer id ="mainfooter">
   <span>
   2019 HelloSecurity. All Rights Reserved
   </span>
</footer>
      

</body>
</html>

    
</body>