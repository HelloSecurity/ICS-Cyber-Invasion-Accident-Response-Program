<%@ page language="java" import="java.sql.*, java.lang.*, java.util.*" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<%@ page import="scenario.ScenarioItem" %>
<%@ page import="scenario.ScenarioDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import = "java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dao" class="scenario.ScenarioDAO" />
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width", initial-scale="1">
  <script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>����� ���� ���α׷�</title>

<script>
   $(document).ready(function(){   
   alert("�� �� �ó����� ������ �����ּ���.");   
   });

</script>

 <link rel="stylesheet" href="css/bootstrap.css">
<!-- ��Ʈ��Ʈ�� css �߰��ϱ� -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<!-- Ŀ���� css �߰��ϱ� -->
<link rel="stylesheet" href="./css/custom.css">
</head>
<body>
<!-- �������� �ڹٽ�ũ��Ʈ �߰��ϱ� -->
	<script src="./js/jquery.min.js"></script>
	<!-- ���� �ڹٽ�ũ��Ʈ �߰��ϱ� -->
	<script src="./js/popper.js"></script>
	<!-- ��Ʈ��Ʈ�� �ڹٽ�ũ��Ʈ �߰��ϱ� -->
	<script src="./js/bootstrap.min.js"></script>
	
	<% // �α��ο��� Ȯ��
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
        script.println("alert('��ȿ���� ���� �� �Դϴ�..')");
        script.println("location.href='scenarioEva.jsp'");
        script.println("</script>");
        script.close();
         
      }       
      ScenarioItem scenarioitem = new ScenarioDAO().getScenario_content(id);
           
      
   %>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">ICS ����� ���� �� ����Ʈ</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">����</a></li>
				<li><a href="asset_list.jsp">�ڻ� ����Ʈ</a></li>
				<li><a href="asset_eva.jsp" onclick="return eva_button()">�ڻ�
						��</a></li>
				<li><a href="sec_eva.jsp">���ȼ� �� ���</a></li>
				<li><a href="emergencyCase.jsp">����� ����</a></li>
			 <!-- <li><a href="scenario.jsp">�ó����� ����Ʈ</a></li>-->
         <li><a href="scenario_eva.jsp">�ó����� ����</a></li>
				<li><a href="infringement.jsp">ħ�ش��� �Ʒ�</a></li>
			</ul>
			<%
				//�α��� ���ο� ���� �޶����� �� ���� ���� �ڵ�
				if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">�����ϱ�<span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">�α���</a></li>
						<li><a href="join.jsp">ȸ������</a></li>
					</ul></li>
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">ȸ������<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">�α׾ƿ�</a></li>
					</ul></li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
    
    
    <div class = scenario_evaluationdiv class="container" style="margin-left:265px; margin-right:265px; padding: 10px">
	<table name="eva_result" class="table table-striped" style="text-align:center; border:1px solid #dddddd">
         
         
    	 <thead>
         <tr>
         <th width=17% colspan="5" style="background-color:#eeeeee; text-align:center;">�� ���</th>
    	 </tr>
    	 </thead>
    	 
    	 <thead>
         <tr>
         <th width=3% style="background-color:#eeeeee; text-align:center;">��Ȯ��</th>
         <th width=3% style="background-color:#eeeeee; text-align:center;">�������ɼ�</th>
         <th width=3% style="background-color:#eeeeee; text-align:center;">������</th>
         <th width=3% style="background-color:#eeeeee; text-align:center;">ȿ����</th>
         <th width=3% style="background-color:#eeeeee; text-align:center;">���ü�</th>
    	 </tr>
    	 </thead>
    	 
    	 <tbody>
    	 <tr>
    	 <td><%=scenarioitem.getAccuracy()%></td>
    	 <td><%=scenarioitem.getFeasibility() %></td>
    	 <td><%=scenarioitem.getEfficiency()%></td>  	 
    	 <td><%=scenarioitem.getComplete()%></td>
    	 <td><%=scenarioitem.getVisibility() %></td>    	 
    	 </tr>
    	
    	 </tbody>
    </table>
    </div>
    <div class="container">
	<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
	    
	    <tbody>
	    
	    <tr>	        
	    <td width=8% colspan="2">�ó����� ��ȣ</td>
	    <td><%=scenarioitem.getId() %></td> <!-- DB���� �ڵ����� ������ -->
	    <tr>
	    	        
	    <td width=8% colspan="2">�ó����� ���� </td>
        <td><%=scenarioitem.getScenario_name() %></td>
	    </tr>
	    
	    <tr>	        
	    <td width=8% colspan="2">�ش� �ڻ� </td>
        <td colspan = "3"><%=scenarioitem.getAsset_name() %>
      	</td>
	    </tr>
	    
	    <tr>	        
	    <td width=8% colspan="2">ħ�ػ����� </td>
        <td colspan = "3"><%=scenarioitem.getInfringement_level() %></td>
	    </tr>
	    
	    <tr>	        
	    <td width=8% colspan="2">�ʱ�����: </td>
        <td colspan = "3"><%=scenarioitem.getScenario_condition() %></td>
	    </tr>
	    
	    <tr>
	    <td width=8% colspan="2">�ó����� ���: </td>
	    <td><%=scenarioitem.getScenario_sum() %></td>
	    </tr>
	    
	    <tr>
	    <td width=8% colspan="2">�ó����� ����: </td>
	    <td><%=scenarioitem.getScenario_content() %></td>
	    </tr>
	    
	    
	    </tbody> 
	</table>
	<div id="crud_button">
	<input type="button" style = "margin-right:10px" value="�ó����� �� ȭ������" class="btn btn-primary pull-left" onclick="javascript:location.href='scenarioEva.jsp'"/>
		
	  <form method="post" action="scenarioEvaDelete.jsp?id=<%=id %>" class="form-inline mt-3"  style="float:right;">
	  	<input type = "hidden" name = "id" value = "<%= id %>">
      <button type = "button" style = "margin-left:10px" value = "�� ����" onclick="confrim_event()" data-toggle="modal" class="btn btn-primary pull-right">����</button>
      </form>
      
      <script>
      function confrim_event(){
    	  if (confirm("���� �����Ͻðڽ��ϱ�??") == true){ //Ȯ��
    		  location.href="scenarioEvaDelete.jsp?id=<%=id %>";   	  
    	      document.form.submit();
    	  } else{   //���
    	      return;
    	  }
      }    	  
      </script>
       


      <form method="get" action="" class="form-inline mt-3">
      <button type = "button" style = "margin-left:10px" value = "�� ����" onclick="javascript:location.href='scenarioEvaReg.jsp?id=<%=id %>'" data-toggle="modal" class="btn btn-primary pull-right">����</button>
      </form>

	    
	    </div>
	</div>
    
</body>

<!--  
	    <tr>
	    
	     
	    <td colspan="5">
	    	
	    	<input type="button" value="�ó����� �������" onclick="javascript:location.href='scenario_step1.jsp'" class = "btn btn-primary pull-right"/></a>
	        
	                    <!-- <a class="btn btn-default" onclick="sendData()"> ��� </a>
	                    <a class="btn btn-default" type="reset"> reset </a>
	                    <a class="btn btn-default" onclick="javascript:location.href='list.jsp'">�� �������...</a> -->
	    <!--  
	    </td>
	    </tr>
	    
	    -->
</html>