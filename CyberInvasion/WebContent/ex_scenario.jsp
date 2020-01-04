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
         <li ><a href="control_item_list.jsp">�����׸� ����Ʈ</a></li>
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
    <div class="container">
   <table class="table table-bordered">
       
       <tbody>
       
       <tr>           
       <td width=8% colspan="2">�ó����� ��ȣ</td>
       <td>7</td> <!-- DB���� �ڵ����� ������ -->
       <tr>
                  
       <td width=8% colspan="2">�ó����� ���� </td>
        <td>�ڹ� ������Ʈ ������� �븰 �Ǽ��ڵ� ����</td>
       </tr>
       
       <tr>           
       <td width=8% colspan="2">�ش� �ڻ� </td>
        <td colspan = "3">�ͺ��������������Ʈ��
         </td>
       </tr>
       
       <tr>           
       <td width=8% colspan="2">ħ�ػ����� </td>
        <td colspan = "3">2</td>
       </tr>
       
       <tr>           
       <td width=8% colspan="2">�ʱ�����: </td>
        <td colspan = "3">Java 6�� ������Ʈ ���� ����</td>
       </tr>
       
       <tr>
       <td width=8% colspan="2">�ó����� ���: </td>
       <td>�����ڴ� ��ũ�� ����� �����Ѵٴ� ���� �̿��Ͽ� ��ũ���� ��� ��� ������ �Ѵٴ� �̸����� ���� ��ũ�� Ŭ���ϵ��� �Ͽ���. �������� �Ǽ��ڵ��
       Java ������Ʈ�� �Ͽ��� Java �������� �������� �ʴ� ������� ���, �ڹ� ���� ����ڽ��� ���ø��� ���� ����Ǿ���.</td>
       </tr>
       
       <tr>
       <td width=8% colspan="2">�ó����� ����: </td>
       <td>��ũ�� ���� ���忡 ����� �̸����� Ȯ���Ͽ���. �̸��� ���� �߿��� ��ũ�� ģ���� ���� ��� ��� �����ϰ� �ִٴ� ������ ��� ���ϵ� �־���. ��ũ�� ����� �����Ѵ�. �״� �ָ����� ����� �ϴµ�, �ش� ��ũ�� ���� ������ ����Ʈ���� ��� ���� ���õ� �Ǹ� ǰ���� ã�� �� ������. 
       �״� �̹� 8�� �׷������� ���������� �����ϱ� ���� Ƽ���� �����ϰ�, ����Ʈ�� �̸����� �ѷ������� �װ� �ʿ�� �ϴ� ��ǰ�� ���ٰ� �� �������� â�� ���� �� ���� ��ȣ ��� �����ϰ� �������� ���ư� ���� �����ߴ�.
      ������, ģ�� ���� �̸��Ͽ� ���Ե� ����Ʈ ��ũ�� �¶��� ���� ����Ʈ�� ���� ������� �ʾҴٴ� ��, �� �̸����� ģ�� ���� ���� ������ �ƴϾ��ٴ� ���̴�.
      ��ũ�� �̸��� ��ũ �ּҸ� Ŭ���� ���� �ڹ� ������� �븰 �Ǽ� �ڵ尡 �Բ� �ٿ�ε尡 �ƴ�. �� �Ǽ��ڵ尡 ����Ǹ� ��ǻ�Ͱ� ���ͳݿ� ����� ���� ������ ���� ����. ��ũ�� ��ǻ�Ϳ� �� �ڹ��� ���,
      ������Ʈ ������ ��ġ�ϸ� ������ ��ġ�� �� ������ �ڵ����� �������� �ʴ´�. ��ũ�� ������ ��ġ�ߴ� Java 6�� ��ǻ�Ϳ� �����־���, �����ڰ� Java Update 29�� ���� ������ �븰
      �Ǽ��ڵ带 ��ũ�� ��ǻ�Ϳ� ������Ŵ���ν� �ڹ� ���� ����ڽ��� ���ø��� ���� �Ǽ��ڵ带 ������״�.</td>
       </tr>
        
       <tr>
       <td colspan="5">
          
          <input type="button" value="�ش� �ó����� �ܰ躰 Ȱ�� ����ϱ�" onclick="javascript:location.href='scenario_step1.jsp'" class = "btn btn-primary pull-right"/></a>
           
                       <!-- <a class="btn btn-default" onclick="sendData()"> ��� </a>
                       <a class="btn btn-default" type="reset"> reset </a>
                       <a class="btn btn-default" onclick="javascript:location.href='list.jsp'">�� �������...</a> -->
       </td>
       </tr>
       </tbody> 
   </table>
   <div>
          <input type="button" value="�ó����� �������" class="btn btn-primary pull-left" onclick="javascript:location.href='scenario.jsp'"/>
       </div>
   </div>
    
</body>
