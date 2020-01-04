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
         <li><a href="asset_list.jsp">자산 리스트</a></li>
         <li ><a href="control_item_list.jsp">통제항목 리스트</a></li>
         <li><a href="asset_eva.jsp" onclick="return eva_button()">자산 평가</a></li>
         <li><a href="sec_eva.jsp">보안성 평가 결과</a></li>
         <li><a href="emergency_case.jsp">비상사건 관리</a></li>   
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
   <table class="table table-bordered">
       
       <tbody>
       
       <tr>           
       <td width=8% colspan="2">시나리오 번호</td>
       <td>7</td> <!-- DB에서 자동으로 가져옴 -->
       <tr>
                  
       <td width=8% colspan="2">시나리오 제목 </td>
        <td>자바 업데이트 취약점을 노린 악성코드 감염</td>
       </tr>
       
       <tr>           
       <td width=8% colspan="2">해당 자산 </td>
        <td colspan = "3">터빈계통유지보수노트북
         </td>
       </tr>
       
       <tr>           
       <td width=8% colspan="2">침해사고수준 </td>
        <td colspan = "3">2</td>
       </tr>
       
       <tr>           
       <td width=8% colspan="2">초기조건: </td>
        <td colspan = "3">Java 6이 업데이트 되지 않음</td>
       </tr>
       
       <tr>
       <td width=8% colspan="2">시나리오 요약: </td>
       <td>공격자는 마크가 등산을 좋아한다는 것을 이용하여 마크에게 등산 장비 세일을 한다는 이메일을 보내 링크를 클릭하도록 하였다. 공격자의 악성코드는
       Java 업데이트를 하여도 Java 구버전은 삭제되지 않는 취약점을 노려, 자바 보안 샌드박스의 감시망을 피해 실행되었다.</td>
       </tr>
       
       <tr>
       <td width=8% colspan="2">시나리오 내용: </td>
       <td>마크는 제지 공장에 출근해 이메일을 확인하였다. 이메일 내용 중에는 마크의 친구인 짐이 등산 장비를 세일하고 있다는 내용이 담긴 메일도 있었다. 마크는 등산을 좋아한다. 그는 주말마다 등산을 하는데, 해당 링크를 통해 접속한 사이트에서 등산 장비와 관련된 판매 품목을 찾을 수 없었다. 
       그는 이번 8월 그랜드테톤 국립공원을 예약하기 위한 티켓을 예약하고, 사이트를 이리저리 둘러봤지만 그가 필요로 하는 물품은 없다고 웹 브라우저의 창을 닫은 후 개인 보호 장비를 착용하고 공장으로 돌아가 일을 시작했다.
      하지만, 친구 짐의 이메일에 포함된 사이트 링크가 온라인 상점 사이트에 직접 연결되지 않았다는 것, 그 이메일은 친구 짐이 보낸 메일이 아니었다는 것이다.
      마크가 이메일 링크 주소를 클릭한 순간 자바 취약점을 노린 악성 코드가 함께 다운로드가 됐다. 이 악성코드가 실행되면 컴퓨터가 인터넷에 연결돼 미터 프리터 쉘을 연다. 마크에 컴퓨터에 깔린 자바의 경우,
      업데이트 버전을 설치하면 이전에 설치된 구 버전은 자동으로 삭제되지 않는다. 마크가 이전에 설치했던 Java 6이 컴퓨터에 남아있었고, 공격자가 Java Update 29의 보안 결함을 노린
      악성코드를 마크의 컴퓨터에 감염시킴으로써 자바 보안 샌드박스의 감시망을 피해 악성코드를 실행시켰다.</td>
       </tr>
        
       <tr>
       <td colspan="5">
          
          <input type="button" value="해당 시나리오 단계별 활동 등록하기" onclick="javascript:location.href='scenario_step1.jsp'" class = "btn btn-primary pull-right"/></a>
           
                       <!-- <a class="btn btn-default" onclick="sendData()"> 등록 </a>
                       <a class="btn btn-default" type="reset"> reset </a>
                       <a class="btn btn-default" onclick="javascript:location.href='list.jsp'">글 목록으로...</a> -->
       </td>
       </tr>
       </tbody> 
   </table>
   <div>
          <input type="button" value="시나리오 목록으로" class="btn btn-primary pull-left" onclick="javascript:location.href='scenario.jsp'"/>
       </div>
   </div>
    
</body>
