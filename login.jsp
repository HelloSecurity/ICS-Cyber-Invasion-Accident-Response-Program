<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta name="viewport" content="width=device-width", initial-scale="1">
   <link rel="stylesheet" href="css/bootstrap.css">
   <title>취약점 진단 프로그램</title>
</head>
<style>
   #mainfooter{
      position:absolute;
      bottom:0;
      width:100%;
      height:70px;
   }
</style>
<!-- 부트스트립 css 추가하기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<!-- 커스텀 css 추가하기 -->
<link rel="stylesheet" href="./css/custom.css">
</head>
<!-- 제이쿼리 자바스크립트 추가하기 -->
<script src="./js/jquery.min.js"></script>
<!-- 파퍼 자바스크립트 추가하기 -->
<script src="./js/popper.js"></script>
<!-- 부트스트랩 자바스크립트 추가하기 -->
<script src="./js/bootstrap.min.js"></script>
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
       <a class="navbar-brand" href="main.jsp">산업제어시스템 사이버 침해사고 대응체계 프로그램</a>
   </div>
   <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
         <li class="active"><a href="main.jsp">메인</a></li>
         <li><a href="asset_list.jsp">자산 리스트</a></li>
        <li><a href="asset_eva.jsp" onclick="return eva_button()">자산 평가</a></li>
          <script type="text/javascript">
            function eva_button() {
                return confirm("평가할 자산을 선택해주세요.")           }
          </script>        
          <li><a href="sec_eva.jsp">보안성 평가 결과</a></li>   
         <li><a href="emergency_case.jsp">비상사건 관리</a></li>   
 <!-- <li><a href="scenario.jsp">시나리오 리스트</a></li>-->
         <li><a href="scenario_eva.jsp">시나리오 관리</a></li>
         <li><a href="infringement.jsp">침해대응 훈련</a></li>   
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
         <li class="dropdown">
            <a href="#" class="dropdown-toggle"
            data-toggle="dropdown" role="button" aria-haspopup="true"
            aria-expanded="false">접속하기<span class="caret"></span></a>
         <ul class="dropdown-menu">
      <li class="active"><a href="login.jsp">로그인</a></li>
      <li><a href="join.jsp">회원가입</a></li>
      </ul>
      </li>
      </ul>
      </div>
   </nav>
   <style>
      .login_view {
         position:absolute;
          height: 600px;
          text-align:center;
          top:70%;
          left:70%;
          margin:100px 100px 100px 100px; background-color:white;
          border:1px solid gray; padding:20px; border-radius: 10px;
      }
      .inp_chk{
         float:left;
         display:inline-block;
         position:relative;
         margin-bottom:-1px;
      }
      .login_append .txt_find{
         float:right;

      }
      body{background-color:#5a5a5a;}

   </style>
      
   <div class="container">
      <div class="col-lg-4">
      
         <div align="center" class="login_view"  jsname="f2d3ae" style="padding-top:20px;">
            <form method="post" action="loginAction.jsp">
               <img src="images/logo.png" width="400" height="100" style="text-align:center;"><br /><br />
               <div class="form-group">
                  <input type="text" class="form-control" placeholder="ID" name="userID" maxlength="30"> 
               </div>
               
               <div class="form-group">
                  <input type="password" class="form-control" placeholder="Password" name="userPassword" maxlength="20">
                  
               </div><br>
               <input type="submit" style="height:40pt; border:1px solid gray; background-color:gray; font-size:27px" class="btn btn-primary form-control" value="Login"> <br />
               <br>
               <img src="images/login.png" width="400" height="60" style="text-align:center; border-radius:5px;"><br><br>
               <img src="images/login1.png" width="400" height="60" style="text-align:center; border-radius:5px;"><br /><br />
               <br />
            
               <div class="login_append">
                  <div class="inp_chk">
                     <td align="left"><input type="checkbox" name="save">  로그인 상태 유지</td>
                  </div>
                  <span class="txt_find">
                     <td colspan="2" align="right"> 아이디 /비밀번호 찾기</td>                  
                  </span>
               </div>
            </form>
         
         </div>
      </div>
   </div>
   <style>
   div{
      margin:0;
   }
      .login_append{
         overflow:hidden;
         padding: 15px 0 0;
      }
   </style>
   <footer id="mainfooter">
   <span>ㅤㅤ ㅤㅤCOPYRIGHT ⓒ 2019 HelloSecurity. All Rights Reserved</span></footer>

   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="js/bootstrap.js"></script>

</body>

</html>