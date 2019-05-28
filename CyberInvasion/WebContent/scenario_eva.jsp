<%@ page language="java" import="java.sql.*, java.lang.*, java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8" %>
 <%@ page import="scenario.ScenarioItem" %>
 
<%@ page import="java.io.PrintWriter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:useBean id="dao" class="scenario.ScenarioDAO" />
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width", initial-scale="1">
  <script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <link rel="stylesheet" href="css/bootstrap.css">
<title>취약점 진단 프로그램</title>
<%
    //DB에 저장된 AssetTable의 속성들을 getParameter 함수를 통해 불러옴 
   Connection Conn=null;
   Statement stmt=null;
   ResultSet rs=null;
   
   String id=request.getParameter("id");
   String scenario_name=request.getParameter("scenario_name");
   String scenario_condition=request.getParameter("scenario_condition");   
   String asset_name=request.getParameter("asset_name");
   String infringement_level=request.getParameter("infringement_level");
   String scenario_sum=request.getParameter("scenario_sum");
   String scenario_content=request.getParameter("scenario_content");
//   String db_list="select * from scenarioitem";
   String keyField = request.getParameter("keyField");
   String keyWord = request.getParameter("keyWord");
 //  ArrayList<ScenarioItem> list = dao.getScenariolist(keyField, keyWord);
   int num=1;
 %>
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
         <li><a href="scenario.jsp">시나리오 리스트</a></li>
         <li class="active"><a href="scenario_eva.jsp">시나리오 평가</a></li>
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
         <th width=3% style="background-color:#eeeeee; text-align:center;"></th>
         <th width=3% style="background-color:#eeeeee; text-align:center;">번호</th>
                
        <th width=12% style = "background-color : #eeeeee; text-align:center;">시나리오 명</th>
        <th width=5% style = "background-color : #eeeeee; text-align:center;">침해사고 수준</th>
        <th width=5% style = "background-color : #eeeeee; text-align:center;">평가완료 유무</th>
        </tr>
        </thead>
        
        <tbody>
        
        <tr>
        <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
        <td>1</td>
        <td>지하철이 해커 공격으로 마비</td>
        <td>3</td>
        <td>Y</td>
        </tr>
        
        <tr>
        <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
        <td>2</td>
        <td>DDos 공격으로 인한 농협 전산망 마비</td>
        <td>3</td>
        <td>N</td>
        </tr>
        
       
        
        <tr>
        <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
        <td>3</td>
        <td>대학교 교수로 위장취업한 해커</td>
        <td>1</td>
        <td>Y</td>
        </tr>
        
        <tr>
        <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
        <td>4</td>
        <td>망 분리 미흡으로 인한 악성코드 감염</td>
        <td>3</td>
        <td>N</td>
        </tr>
        
        <tr>
        <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
        <td>5</td>
        <td><a href="scenario_eva_complete.jsp">무선 태블릿 반출로 인한 정보 유출</a></td>
        <td>2</td>
        <td>Y</td>
        </tr>
        
        <tr>
        <td><input id = "checkbox" name = "checkBox" type="checkbox"></td>
        <td>6</td>
        <td><a href="scenario_eva_detail.jsp">자바 업데이트 취약점을 노린 악성코드 감염</a></td> 
        <td>2</td>
        <td>Y</td>
        </tr>
        
        </tbody>
       </table>
    </div>
    </section>
    
    
      <div id="crud" style="padding-left:10px;margin:10px; float:right; margin-right:265px;"  align="right" >
         <!-- <button class = "btn btn-primary pull-right" onclick="location.href='asset_eva_select.jsp';"  type="button">평가완료</button> -->
      <button class = "btn btn-primary pull-right" type="submit">평가하기</button>
   </div>   
     
    
</body>
</html>