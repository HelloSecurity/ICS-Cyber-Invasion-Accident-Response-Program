<%@ page language="java" import="java.sql.*, java.lang.*, java.util.*" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<%@ page import="scenario.ScenarioItem" %>
<%@ page import="scenario.ScenarioDAO" %>
<%@ page import="scenario.ScenarioEvaItem" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import = "java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dao" class="scenario.ScenarioDAO" />
<html>
<head>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width", initial-scale="1">
  <script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>����� ���� ���α׷�</title>

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
      
      
      ScenarioEvaItem scenarioitem = new ScenarioDAO().getScenario_content(id);
      
           
      
   %>

	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">�������ý��� ���̹� ħ�ػ�� ����ü�� ���α׷�</a>
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
		<!-- 	<li><a href="scenario.jsp">�ó����� ����Ʈ</a></li> -->
				<li class="active"><a href="scenario_eva.jsp">�ó����� ����</a></li>
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

    <style>
    .table{
    	width:90%;
    	margin:auto;
    	border: 1px solid #444444;
    }
    .btn-primary{
			background-color:#848484;
			border-color:#848484
		}
    </style>
    <br>
    
        <div class="container">
	<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
	    
	    <tbody>	    
	    <tr>	        
	    <td width=12% colspan="2"><strong>�ó����� ��ȣ</strong></td>
	    <td><%=scenarioitem.getId() %></td> <!-- DB���� �ڵ����� ������ -->
	    </tr>
	    
	    <tr>	        
	    <td width=12% colspan="2"><strong>�ó����� ����</strong> </td>
        <td><%=scenarioitem.getScenario_name() %></td>
	    </tr>
	    
	    <tr>	        
	    <td width=12% colspan="2"><strong>�ش� �ڻ�</strong> </td>
        <td colspan = "3"><%=scenarioitem.getAsset_name() %></td>
	    </tr>
	    
	    <tr>	        
	    <td width=12% colspan="2"><strong>ħ�ػ�����</strong> </td>
        <td colspan = "3"><%=scenarioitem.getInfringement_level() %></td>
	    </tr>
	    
	    <tr>	        
	    <td width=12% colspan="2"><strong>�ʱ� ����</strong> </td>
        <td colspan = "3"><%=scenarioitem.getScenario_condition() %></td>
	    </tr>
	    <tr>
	    <td width=12% colspan="2"><strong>�ó����� ���</strong> </td>
	    <td><%=scenarioitem.getScenario_sum() %></td>
	    </tr>
	    
	    <tr>
	    <td width=12% colspan="2"><strong>�ó����� ����</strong></td>
	    <td><%=scenarioitem.getScenario_content() %></td>
	    </tr>	    
	    </tbody> 
	</table>
	
	
	<div>
	

	
	</div>
	</div>
	</div>
	<%
				for (int i = 1; i <= 1; i++) {
			%>
			<br>
    		<form method="get" action="./regAction.jsp" class="form-inline mt-3" style="float:right; margin-right:300px">
				<a href="#scenario_eva" data-toggle="modal" class="btn btn-primary mx-1 mx-2" value="<%=i%>">���ϱ�</a>��
			</form>
				<%
				}
			%>
			<div class="modal fade" id="scenario_eva" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog">
			<div class="modal-content">
				<div class="scenario_table" style = "display:inline; float:left; width:70%">    
			<form name = "scenario_evaluation" id = "evaluation" action = "scenarioEvaRegAction.jsp" method = post>
			<%request.setAttribute("ID", id); %>
			<%-- �Խù� ID action.jsp�� �ѱ��--%>
	 		<input type="hidden" name="id" value="<%= id %>">      
			<table name="scenario_evaluation" class="table table-striped" style="width:500px; text-align:center; border:2px solid #dddddd">
	         <style>
	         tbody>td{
	         background-color:#eeeeee;}
	         a{
	         margin-right:10px;
	         }
	         </style>
    	 <thead>
         <tr>
         <th width=3% colspan="2" style="background-color:#eeeeee; text-align:center;">���ϱ�</th>           	 
    	 </tr>
    	 </thead>
    	 
    	   	 
    	 <tbody style="background-color:#eeeeee">
    	 <tr>
    	 <td>��Ȯ��</td>
    	 <td><input type="radio" name="accuracy" value="��">��
			<input type="radio" name="accuracy" value="��">��
			<input type="radio" name="accuracy" value="��">��
    	 </td>
    	 </tr>
    	 
    	 <tr>
    	 <td>�������ɼ�</td>
    	 <td><input type="radio" name="feasibility" value="��">��
			<input type="radio" name="feasibility" value="��">��
			<input type="radio" name="feasibility" value="��">��
    	 </td>
    	 </tr>
    	 
    	 <tr>
    	 <td>ȿ����</td>
    	 <td><input type="radio" name="efficiency" value="��">��
			<input type="radio" name="efficiency" value="��">��
			<input type="radio" name="efficiency" value="��">��
    	 </td>
    	 </tr>
    	 
    	 <tr>
    	 <td>������</td>
    	 <td><input type="radio" name="complete" value="��">��
			<input type="radio" name="complete" value="��">��
			<input type="radio" name="complete" value="��">��
    	 </td>
    	 </tr>
    	 
    	 <tr>
    	 <td>���ü�</td>
    	 <td><input type="radio" name="visibility" value="��">��
		<input type="radio" name="visibility" value="��">��
		<input type="radio" name="visibility" value="��">��
		</td>
    	 </tr>
    	 
    	
    	 <tr>
    	<td width=3% colspan="2" style=" text-align:center;">
    	<button id = evaluate_btn class = "btn btn-primary pull-right" type="submit" onclick="doAssessment()">�򰡿Ϸ�</button>
    	</td>
    	</tr>
    	 
    	</tbody>
    </table>
    
    </form>
    </div>
    
	</div>
</body>
</html>