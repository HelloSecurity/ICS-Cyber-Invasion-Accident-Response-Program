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
   // 세션의 로그인여부 확인
   String userID=null;
   if(session.getAttribute("userID")!=null){
      userID=(String)session.getAttribute("userID");
   }
   if(userID==null){ //로그인 안 됐을 경우
      PrintWriter script=response.getWriter();
      script.println("<script>");
      script.println("alert('로그인을 해주세요.')");
      script.println("location.href='login.jsp'");
      script.println("</script>");
      script.close();
      return;
   }
   %>
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
   ArrayList<ScenarioItem> list = dao.getScenariolist(keyField, keyWord);
   int num=1;
   String db_list2="SELECT * FROM scenarioitem WHERE id="+id;
 System.out.println(db_list2);

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


    
       
  <section class="container">
      <div class ="row">
         <table name="AssetTable" class="table table-striped" style="text-align:center; border:1px solid #dddddd">
             <thead>
                <tr>
        <th width=8%  style="background-color:#eeeeee; text-align:center;">시나리오 번호</th>
                  
       <th width=16% style="background-color:#eeeeee; text-align:center;">시나리오 제목 </th>
          
       <th width=8% style="background-color:#eeeeee; text-align:center;">해당 자산 </th>
       
        <th width=15% style="background-color:#eeeeee; text-align:center;">침해사고수준 </td>
       
            
      <th width=10% style="background-color:#eeeeee; text-align:center;">초기조건 </td>
       

       <th width=20% style="background-color:#eeeeee; text-align:center;">시나리오 요약 </td>
       
       <th width=40% style="background-color:#eeeeee; text-align:center;">시나리오 내용 </td>
            <tbody>
             <% //DB연동을 위함
                       try {
               			String dbURL ="jdbc:mysql://127.0.0.1:3306/sys?serverTimezone=UTC";
            	        String dbID = "root";
            	        String dbPassword = "password";
            			Class.forName("com.mysql.cj.jdbc.Driver");
                           Conn= DriverManager.getConnection(dbURL, dbID, dbPassword);
                          stmt=Conn.createStatement();
                  
                          %>
               <%
                       rs=stmt.executeQuery(db_list2);
                 
                       while(rs.next())
                       {
                       %>
                    <tr>
                       <td><%=rs.getString(1) %></td>
                        <td><%=rs.getString(2) %></td>
                       <td><%=rs.getString(3) %></td>
                       <td><%=rs.getString(4) %></td>
                         <td><%=rs.getString(5) %></td>
                        <td><%=rs.getString(6) %></td>
                         <td><%=rs.getString(7) %></td>
                       
                      <%
                 
                }
             
                       }
             catch(SQLException e)
             {
             out.println(e);
             }
             catch(Exception e1)
             {
             out.println(e1);
             }
                   %>
                
             </tbody>   
       
   </table>
   <div>
   
   
   </div>
   </div>
   </div>
    
</body>
</html>