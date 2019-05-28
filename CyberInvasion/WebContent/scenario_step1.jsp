<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width", initial-scale="1">
  <script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <link rel="stylesheet" href="css/bootstrap.css">
<title>취약점 진단 프로그램</title>
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
         <li ><a href="asset_list.jsp">자산 리스트</a></li>
         <li ive"><a href="control_item_list.jsp">통제항목 리스트</a></li>
         <li><a href="asset_eva.jsp" onclick="return eva_button()">자산 평가</a></li>
         <li><a href="sec_eva.jsp">보안성 평가 결과</a></li>
         <li><a href="emergency_step.jsp">비상사건 관리</a></li>   
         <li class="active"><a href="scenario.jsp">시나리오 리스트</a></li>
         <li><a href="scenario_eva.jsp">시나리오 평가</a></li>
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
    <div class="container">
    <h3>1일차</h3>
   <table class="table table-bordered">
       <thead>
         <tr>
         <th width=3% rowspan="2" style="background-color:#eeeeee; text-align:center;">단계</th>
                
        <th width=12% style = "background-color : #eeeeee; text-align:center;">단계별 수행 내용</th>
        <th width=5% style = "background-color : #eeeeee; text-align:center;">수행자</th>
        </tr>
        </thead>
       <tbody>
       
       <tr>           
        <td><input type="text" placeholder="단계를 입력하세요 " name="subject" class="form-control"/></td>
        <td><textarea cols="10" placeholder="단계별 수행내용을 입력하세요. " name="content" class="form-control"></textarea></td>
       <td><input type="text" placeholder="수행자를 입력하세요 " name="subject" class="form-control"/></td>
       </tr>
       
       <tr>           
        <td><input type="text" placeholder="단계를 입력하세요 " name="subject" class="form-control"/></td>
        <td><textarea cols="10" placeholder="단계별 수행내용을 입력하세요. " name="content" class="form-control"></textarea></td>
       <td><input type="text" placeholder="수행자를 입력하세요 " name="subject" class="form-control"/></td>
       </tr>
       
       <tr>           
        <td><input type="text" placeholder="단계를 입력하세요 " name="subject" class="form-control"/></td>
        <td><textarea cols="10" placeholder="단계별 수행내용을 입력하세요. " name="content" class="form-control"></textarea></td>
       <td><input type="text" placeholder="수행자를 입력하세요 " name="subject" class="form-control"/></td>
       </tr>
       
       <tr>

       <td colspan="3">
          <input type="button" value="단계 추가하기" class = "btn btn-primary pull-right"/>
                       <!-- <a class="btn btn-default" onclick="sendData()"> 등록 </a>
                       <a class="btn btn-default" type="reset"> reset </a>
                       <a class="btn btn-default" onclick="javascript:location.href='list.jsp'">글 목록으로...</a> -->
       </td>
       </tr>
       
       <tr>
       <td colspan="3">
          <input type="button" value="이전 일자" class = "btn btn-primary pull-right"/>
           <input type="button" value="다음 일자" class="btn btn-primary pull-left" />
                       <!-- <a class="btn btn-default" onclick="sendData()"> 등록 </a>
                       <a class="btn btn-default" type="reset"> reset </a>
                       <a class="btn btn-default" onclick="javascript:location.href='list.jsp'">글 목록으로...</a> -->
       </td>
       </tr>
       
       </tbody>
   </table>
   
   <!-- 
   </div>
   <div id="lastday" style="padding-left:10px;margin:10px; margin-left:280px;">
         <!-- <button class = "btn btn-primary pull-right" onclick="location.href='asset_eva_select.jsp';"  type="button">평가완료</button> -->
   
   <!--  
      <input type="button" value="이전 일자" class="btn btn-primary pull-left"/>   
   </div>
   <div id="nextday" style="padding-left:10px;margin:10px; margin-right:280px;">
      <button class = "btn btn-primary pull-right" type="submit">다음 일자</button>   
   </div>
   
    -->
   
   
   <p> 시나리오 수행 완료 조건 <input type = "text" placeholder="수행완료 조건을 입력하세요 " name="subject" class="form-control"/>
         <!-- <button class = "btn btn-primary pull-right" onclick="location.href='asset_eva_select.jsp';"  type="button">평가완료</button> -->
   <p>
   <button class = "btn btn-primary pull-right" type="submit" onclick="javascript:location.href='scenario.jsp'" style="">등록</button>
   </p>   
   
   <!--
   <div id="crud">
         <button class = "btn btn-primary pull-right" onclick="location.href='asset_eva_select.jsp';"  type="button">평가완료</button>
      <button class = "btn btn-primary pull-right" type="submit" onclick="javascript:location.href='scenario.jsp'">등록</button>
   </div>
   
   -->    
</body>
</html>