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
         <li ><a href="asset_list.jsp">�ڻ� ����Ʈ</a></li>
         <li ive"><a href="control_item_list.jsp">�����׸� ����Ʈ</a></li>
         <li><a href="asset_eva.jsp" onclick="return eva_button()">�ڻ� ��</a></li>
         <li><a href="sec_eva.jsp">���ȼ� �� ���</a></li>
         <li><a href="emergency_step.jsp">����� ����</a></li>   
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
    <div class="container">
    <h3>1����</h3>
   <table class="table table-bordered">
       <thead>
         <tr>
         <th width=3% rowspan="2" style="background-color:#eeeeee; text-align:center;">�ܰ�</th>
                
        <th width=12% style = "background-color : #eeeeee; text-align:center;">�ܰ躰 ���� ����</th>
        <th width=5% style = "background-color : #eeeeee; text-align:center;">������</th>
        </tr>
        </thead>
       <tbody>
       
       <tr>           
        <td><input type="text" placeholder="�ܰ踦 �Է��ϼ��� " name="subject" class="form-control"/></td>
        <td><textarea cols="10" placeholder="�ܰ躰 ���೻���� �Է��ϼ���. " name="content" class="form-control"></textarea></td>
       <td><input type="text" placeholder="�����ڸ� �Է��ϼ��� " name="subject" class="form-control"/></td>
       </tr>
       
       <tr>           
        <td><input type="text" placeholder="�ܰ踦 �Է��ϼ��� " name="subject" class="form-control"/></td>
        <td><textarea cols="10" placeholder="�ܰ躰 ���೻���� �Է��ϼ���. " name="content" class="form-control"></textarea></td>
       <td><input type="text" placeholder="�����ڸ� �Է��ϼ��� " name="subject" class="form-control"/></td>
       </tr>
       
       <tr>           
        <td><input type="text" placeholder="�ܰ踦 �Է��ϼ��� " name="subject" class="form-control"/></td>
        <td><textarea cols="10" placeholder="�ܰ躰 ���೻���� �Է��ϼ���. " name="content" class="form-control"></textarea></td>
       <td><input type="text" placeholder="�����ڸ� �Է��ϼ��� " name="subject" class="form-control"/></td>
       </tr>
       
       <tr>

       <td colspan="3">
          <input type="button" value="�ܰ� �߰��ϱ�" class = "btn btn-primary pull-right"/>
                       <!-- <a class="btn btn-default" onclick="sendData()"> ��� </a>
                       <a class="btn btn-default" type="reset"> reset </a>
                       <a class="btn btn-default" onclick="javascript:location.href='list.jsp'">�� �������...</a> -->
       </td>
       </tr>
       
       <tr>
       <td colspan="3">
          <input type="button" value="���� ����" class = "btn btn-primary pull-right"/>
           <input type="button" value="���� ����" class="btn btn-primary pull-left" />
                       <!-- <a class="btn btn-default" onclick="sendData()"> ��� </a>
                       <a class="btn btn-default" type="reset"> reset </a>
                       <a class="btn btn-default" onclick="javascript:location.href='list.jsp'">�� �������...</a> -->
       </td>
       </tr>
       
       </tbody>
   </table>
   
   <!-- 
   </div>
   <div id="lastday" style="padding-left:10px;margin:10px; margin-left:280px;">
         <!-- <button class = "btn btn-primary pull-right" onclick="location.href='asset_eva_select.jsp';"  type="button">�򰡿Ϸ�</button> -->
   
   <!--  
      <input type="button" value="���� ����" class="btn btn-primary pull-left"/>   
   </div>
   <div id="nextday" style="padding-left:10px;margin:10px; margin-right:280px;">
      <button class = "btn btn-primary pull-right" type="submit">���� ����</button>   
   </div>
   
    -->
   
   
   <p> �ó����� ���� �Ϸ� ���� <input type = "text" placeholder="����Ϸ� ������ �Է��ϼ��� " name="subject" class="form-control"/>
         <!-- <button class = "btn btn-primary pull-right" onclick="location.href='asset_eva_select.jsp';"  type="button">�򰡿Ϸ�</button> -->
   <p>
   <button class = "btn btn-primary pull-right" type="submit" onclick="javascript:location.href='scenario.jsp'" style="">���</button>
   </p>   
   
   <!--
   <div id="crud">
         <button class = "btn btn-primary pull-right" onclick="location.href='asset_eva_select.jsp';"  type="button">�򰡿Ϸ�</button>
      <button class = "btn btn-primary pull-right" type="submit" onclick="javascript:location.href='scenario.jsp'">���</button>
   </div>
   
   -->    
</body>
</html>