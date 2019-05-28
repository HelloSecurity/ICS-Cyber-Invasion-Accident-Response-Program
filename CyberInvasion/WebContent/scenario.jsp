<%@ page language="java" import="java.sql.*, java.lang.*, java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8" %>
 <%@ page import="scenario.ScenarioItem" %>
 
<%@ page import="java.io.PrintWriter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:useBean id="dao" class="scenario.ScenarioDAO" />


<%
    request.setCharacterEncoding("UTF-8");
%>



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
   ArrayList<ScenarioItem> list = dao.getScenariolist(keyField, keyWord);
   int num=1;
 %>
 <html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width", initial-scale="1">
  <script src = "https://code.jquery.com/jquery-3.1.1.min.js">
  
  </script>
  <link rel="stylesheet" href="css/bootstrap.css">
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
<script>
function searchCheck(frm){
    //검색
   
    if(frm.keyWord.value ==""){
        alert("검색 단어를 입력하세요.");
        frm.keyWord.focus();
        return;
    }
    frm.submit();      
}
</script>

<% // 로그인여부 확인
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
          <% //로그인 여부에 따라 달라지는 탭 구현 위한 코드
         if(userID==null){
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
         }else{
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
      </ul>
            <%
         }
      
      %>
      </div>
   </nav> 
          <% 
                       try {
               			String dbURL ="jdbc:mysql://127.0.0.1:3306/sys?serverTimezone=UTC&useSSL=false";
            	        String dbID = "root";
            	        String dbPassword = "password";
            			Class.forName("com.mysql.cj.jdbc.Driver");
                           Conn= DriverManager.getConnection(dbURL, dbID, dbPassword);
                          stmt=Conn.createStatement();
                       
                          %>


    <div id = "search" style="padding-bottom : 15px; margin-right:265px;" align="right">
       <tr>  
        <td colspan="7"> <br/>
            <form name="search" method ="post">
            <select name="keyField">
                <option value="0"> ----선택----</option>
                <option value="id">번호</option>
                <option value="scenario_name">시나리오 명</option>
                <option value="infringement_level">침해사고 수준</option>  
            </select>
            <input type="text" name="keyWord" value=3 />
            <input type="button" value="검색" onclick="searchCheck(form)" />
           
            </form>
           
        </td>      
    </tr>
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
          <%
    for(ScenarioItem scenarioItem : list){
    %>
        <tbody>
      
        <tr>
         <td><%=scenarioItem.getId() %></td>
        <td><a href="scenario_eva_detail.jsp?id=<%=scenarioItem.getId() %>" ><%=scenarioItem.getScenario_name() %></td>
        <td><%=scenarioItem.getInfringement_level() %></td>
       <%
                  // System.out.println(rs.getBoolean("account_manage"));

                   //num++;
                   }
             
               %>  
                              <%
                  // System.out.println(rs.getBoolean("account_manage"));

                   //num++;
                   
                   //rs.close();
                 //  stmt.close();
                 //  Conn.close();
                   }
                   catch(SQLException e)
                   {
                   System.out.println(e);
                   }
                   catch(Exception e1)
                   {
                   System.out.println(e1);
                   }
                  
                   %>
                          
             </tbody>   
        
       </table>
    </div>
    </section>
    
    
    
      <div id="crud" style="padding:10px;margin:10px; float:right; margin-right:265px;"  align="right" >
         <!-- <button class = "btn btn-primary pull-right" onclick="location.href='asset_eva_select.jsp';"  type="button">평가완료</button> -->
    <%
 for(int i=1; i<= 1; i++){


%>            <form method="get" action="./updAction.jsp" class="form-inline mt-3"  style="float:right;">       
             <a onclick="fn_delRow('chkObject')"class="btn btn-primary mx-1 mx-2" href="#" value="<%=i %>" >삭제</a>        
             </form>
                   <form method="get" action="./updAction.jsp" class="form-inline mt-3"  style="float:right;">
                  <a href="#scenario_upd"  data-toggle="modal" class="btn btn-primary mx-1 mx-2" value="<%=i %>">수정</a>ㅤ
               </form>

             <form method="get" action="./ScenarioAction.jsp" class="form-inline mt-3"  style="float:right;">
                 <a href="#scenario_reg" data-toggle="modal" class="btn btn-primary mx-1 mx-2" value="<%=i %>">추가</a>ㅤ
               </form>

          <%
  }
%>
               </div>
         
                        <div class="modal fade" id="scenario_reg" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
            <div class="modal-dialog">

        <div class="modal-content">

          <div class="modal-header">
     
           <h3>시나리오 등록하기</h3>
       </thead>
       <tbody>
      <form action="./ScenarioAction.jsp" method="post">
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
         
       <label>초기조건: </label>
        <input type="text" placeholder="내용을 입력하세요. " name="scenario_condition" class="form-control"/>
           </div>
                 <div class="form-row">
       <label>시나리오 요약: </label>
       <textarea name="scenario_sum" cols="10" placeholder="내용을 입력하세요. " name="content" class="form-control"></textarea>
 
       </div>
       
       
       <div class="form-row">
       <label>시나리오 내용: </label>
       <textarea cols="50" rows="30" placeholder="내용을 입력하세요. " name="scenario_content" class="form-control"></textarea>
       </div>
        
     
      
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>

                <button type="submit" class="btn btn-primary" onclick="return test_checkbox()">등록하기</button>
       
            </form>
     
    
</body>
