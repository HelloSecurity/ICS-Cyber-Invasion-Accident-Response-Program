<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width", initial-scale="1">
  <script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <link rel="stylesheet" href="css/bootstrap.css">
<title>����� ���� ���α׷�</title>
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
      <a class="navbar-brand" href="main.jsp">ICS ����� ���� �� ����Ʈ</a>
   </div>
   <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
         <li><a href="main.jsp">����</a></li>
         <li><a href="asset_list.jsp">�ڻ� ����Ʈ</a></li>
         <li><a href="control_item_list.jsp">�����׸� ����Ʈ</a></li>
         <li><a href="asset_eva.jsp" onclick="return eva_button()">�ڻ� ��</a></li>
         <li><a href="sec_eva.jsp">���ȼ� �� ���</a></li>
         <li><a href="emergency_case.jsp">����� ����</a></li>   
         <li class="active"><a href="scenario.jsp">�ó����� ����Ʈ</a></li>
         <li><a href="scenario_eva.jsp">�ó����� ��</a></li>
         <li><a href="breach_corr.jsp">ħ�ش��� �Ʒ�</a></li>   
      </ul>
      <ul class="nav navbar-nav navbar-right">
         <li class="dropdown">
            <a href="#" class="dropdown-toggle"
            data-toggle="dropdown" role="button" aria-haspopup="true"
            aria-expanded="false">�����ϱ�<span class="caret"></span>
            </a>
		    <ul class="dropdown-menu">
			<li class="active"><a href="login.jsp">�α���</a></li>
			<li><a href="join.jsp">ȸ������</a></li>
		    </ul>
	     </li>
      </ul>
    </div>     
    </nav>
    <div id = "search" style="padding-bottom : 15px; margin-right:265px;" align="right">
    	<input type = "text" placeholder = "�˻��� �Է�">
    	<button>�˻�</button>
    </div>
    <section class="container">
    <div class ="row">
         <table name="Control_Item_Table" class="table table-striped" style="text-align:center; border:1px solid #dddddd">
         
         <thead>
         <tr>
         <th width=3% style="background-color:#eeeeee; text-align:center;">��ȣ</th>
                
    	 <th width=12% style = "background-color : #eeeeee; text-align:center;">�ó����� ��</th>
    	 <th width=5% style = "background-color : #eeeeee; text-align:center;">ħ�ػ�� ����</th>
    	 </tr>
    	 </thead>
    	 
    	 <tbody>
    	 <tr>
    	 <td>1</td>
    	 <td>����ö�� ��Ŀ �������� ����</td>
    	 <td>3</td>
    	 </tr>
    	 
    	 <tr>
    	 <td>2</td>
    	 <td>DDos �������� ���� ���� ����� ����</td>
    	 <td>3</td>
    	 </tr>
    	 
    	 <tr>
    	 <td>3</td>
    	 <td>���б� ������ ��������� ��Ŀ</td>
    	 <td>1</td>
    	 </tr>
    	 
    	 <tr>
    	 <td>4</td>
    	 <td>�� �и� �������� ���� �Ǽ��ڵ� ����</td>
    	 <td>3</td>
    	 </tr>
    	 
    	 <tr>
    	 <td>5</td>
    	 <td>���� �º� ����� ���� ���� ����</td>
    	 <td>2</td>
    	 </tr>
    	 
    	 <tr>
    	 <td>6</td>
    	 <td><a href="eunji_scenario.jsp">�ڹ� ������Ʈ ������� �븰 �Ǽ��ڵ� ����</a></td> 
    	 <td>2</td>
    	 </tr>
    	 
    	 
    	 
    	 </tbody>
    	</table>
    </div>
    </section>
    
    
    
   	<div id="crud" style="padding:10px;margin:10px; float:right; margin-right:265px;"  align="right" >
         <!-- <button class = "btn btn-primary pull-right" onclick="location.href='asset_eva_select.jsp';"  type="button">�򰡿Ϸ�</button> -->
		<button class = "btn btn-primary mx-1 mx-2 pull-right" type="submit" style = "margin : 3px">����</button>
		<button class = "btn btn-primary mx-1 mx-2 pull-right" type="submit" style = "margin : 3px">����</button>
		<button class = "btn btn-primary mx-1 mx-2 pull-right" type="submit" style = "margin : 3px" onclick="javascript:location.href='scenario_new.jsp'">���</button>
	</div>	
     
    
</body>
</html>