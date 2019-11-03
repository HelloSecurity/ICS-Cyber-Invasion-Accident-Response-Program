<%@ page language="java" import="java.sql.*, java.lang.*, java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="infringementAction.InfringementDAO"%>
<%@ page import="infringementAction.InfringementItem"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="sdao" class="scenario.ScenarioDAO" />

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width" , initial-scale="1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<title>취약점 진단 프로그램</title>
	<!-- 부트스트립 css 추가하기 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<!-- 커스텀 css 추가하기 -->
	<link rel="stylesheet" href="./css/custom.css">
	
	<style>
	.table{
		width:70%;
	}
	.container{
		width:1200px;
		align:center;
		margin-right:auto;
		margin-left:auto;
		padding-right:0px;
		padding-left:0px;
	}
	
		table{
		width:70%;
		margin:auto;
		}
		
	#dataaction{
		text-align:left;
	}
	</style>
</head>
<body>
	<!-- 로그인이 된 사람들의 세션을 만들어 준다. 
		 회원값이 있는 사람들은 userID에 정보가 담기게 되고
		 아닌 사람은 null값을 가지게 된다.
	-->

	<%
		// 로그인여부 확인
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int id = 0;
		if (request.getParameter("id") != null) {
			id = Integer.parseInt(request.getParameter("id"));
		}

		if (id == 0) {

			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다..')");
			script.println("location.href='infringement.jsp'");
			script.println("</script>");
			script.close();

		}

		InfringementItem infringementitem = new InfringementDAO().getInfringementdata_content(id);
	%>
	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="./js/jquery.min.js"></script>
	<!-- 파퍼 자바스크립트 추가하기 -->
	<script src="./js/popper.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>

	<nav class="navbar navbar-default">
		<div class="naver-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">

				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>

			</button>
			<a class="navbar-brand" href="main.jsp">산업제어시스템 사이버 침해사고 대응체계 프로그램</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="asset_list.jsp">자산 리스트</a></li>
				<li><a href="asset_eva.jsp" onclick="return eva_button()">자산
						평가</a></li>
				<li><a href="sec_eva.jsp">보안성 평가 결과</a></li>
				<li><a href="emergency_case.jsp">비상사건 관리</a></li>
				<!-- <li><a href="scenario.jsp">시나리오 리스트</a></li>-->
                <li><a href="scenario_eva.jsp">시나리오 관리</a></li>
				<li class="active"><a href="infringement.jsp">침해대응 훈련</a></li>
			</ul>
			<!-- 접속하기는 로그인안한 사람만 보여주게하기 -->
			<%
				if (userID == null) {
			%>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>

					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>

			<%
				} else {
			%>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	<br>
	<div class="container" style="margin-left: auto; margin-right: auto;">
		<table width="600px" name="eva_result" class="table table-striped" style="align:center; padding-right:0; padding-left:0; margin-right:auto; margin-left:auto; text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th width=10% colspan="3"
						style="background-color: #eeeeee; text-align: center;">침해대응 훈련 일정</th>
				</tr>
			</thead>
			<thead>
				<tr>
					<th width=3% style="background-color: #eeeeee; text-align: center;">시나리오번호</th>
					<th width=3% style="background-color: #eeeeee; text-align: center;">훈련번호</th>
					<th width=20%
						style="background-color: #eeeeee; text-align: center;">훈련명</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td style="vertical-align: middle;"><%=infringementitem.getScenario_no()%></td>
					<td style="vertical-align: middle;"><%=infringementitem.getId()%></td>
					<td style="vertical-align: middle;"><%=infringementitem.getName()%></td>
				</tr>

			</tbody>
		</table>
	</div>
	
	<div class="container">
		<table class="table table-striped"	style="margin-left: auto; margin-right: auto; text-align: center; border: 1px solid #dddddd">
			<tbody>

				<tr>
					<td width=12% colspan="2"><strong>훈련종류</strong></td>
					<td style="vertical-align: middle;"><%=infringementitem.getTraining_type()%></td>
					<!-- DB에서 자동으로 가져옴 -->
				<tr>

					<td width=12% colspan="2"><strong>훈련일정</strong></td>
					<td style="vertical-align: middle;"><%=infringementitem.getTraining_schedule()%></td>
				</tr>

				<tr>
					<td width=12% colspan="2"><strong>훈련장소</strong></td>
					<td style="vertical-align: middle;" colspan="3"><%=infringementitem.getTraining_place()%>
					</td>
				</tr>

				<tr>
					<td width=12% colspan="2"><strong>훈련부서</strong></td>
					<td style="vertical-align: middle;" colspan="3"><%=infringementitem.getTraining_division()%></td>
				</tr>

				<tr>
					<td width=12% colspan="2"><strong>일자별<br> 수행내용</strong></td>
					<td id="dataaction" style="vertical-align: middle;" colspan="3"><%=infringementitem.getDate().replace("\r\n","<br>")%></td>
				</tr>
			</tbody>
		</table>
		
		<div id="crud" style="padding: 10px; margin: 10px; float: right; margin-right: 160px;	align="middle">
			<!-- <button class = "btn btn-primary pull-right" onclick="location.href='asset_eva_select.jsp';"  type="button">평가완료</button> -->
			<%
				for (int i = 1; i <= 1; i++) {
			%>
			<form method="post" action="./updAction.jsp" class="form-inline mt-3"
				style="float: left;">
				<a href="#asset_upd" data-toggle="modal"
					class="btn btn-primary mx-1 mx-2"
					onclick="javascript:location.href='infringement.jsp'"
					value="<%=i%>">침해대응훈련 목록으로</a>ㅤ
			</form>
			<form method="post" action="./infringementDelAction.jsp"
				class="form-inline mt-3" style="float: right;">
				<a onclick="return confirm('정말로 삭제하시겠습니까?')"
				href="infringementDelAction.jsp?id=<%=id%>" data-toggle="modal" class="btn btn-primary mx-1 mx-2"
					value="<%=i%>">삭제</a>ㅤ
			</form>
			<form method="post" action="./infringementDetailAction.jsp"
				class="form-inline mt-3" style="float: right;">
				<a href="#infringement_data_reg" data-toggle="modal"
					class="btn btn-primary mx-1 mx-2" value="<%=i%>">수정</a>ㅤ
			</form>
			<%
				}
			%>
		</div>
	</div>

	</section>
	<div class="modal fade" id="infringement_data_reg" tabindex="-1"
		role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">

			<div class="modal-content">

				<div class="modal-header">

					<h3>침해대응 훈련 수정하기</h3>
					<br>
					<tbody>
						<form action="./infringementDetailAction.jsp" method="get">
							<input type="hidden" name="id" value="<%=id%>">
							<div class="form-group col-sm-6">
							<label>시나리오 번호</label> <select name="scenario_no" value="<%= infringementitem.getScenario_no() %>"
										id="scenario_no">
										<option value="0">----선택----</option>
										<c:forEach var="data" items="${sdao.getScenarioIdlist() }">
											<option value="${data }">${data }</option>
										</c:forEach>
									</select>
								</div>
								<div class="form-group col-sm-6">
									<label>훈련종류 </label> <select name="training_type" value="<%= infringementitem.getTraining_type() %>">
										<option value="0">----선택----</option>
										<option value="도상훈련">도상훈련</option>
										<option value="실전훈련">실전훈련</option>
									</select>
								</div>
								<div>

									<label>훈련명 </label> <input type="text" value="<%= infringementitem.getName() %>"
										placeholder="산업제어시스템 기반 취약점 분석 도구" name="name" required
										class="form-control" />
								</div>
								<br>
								<div class="form-group col-sm-6">

									<label>훈련부서 </label> <input type="text"
										placeholder="ex)한국원자력안전기술원" name="training_division" value="<%= infringementitem.getTraining_division() %>"required
										class="form-control" />
								</div>
								<div class="form-group col-sm-6">
									<label>훈련일정 </label> <input type="text"
										name="training_schedule" class="form-control" value="<%= infringementitem.getTraining_schedule() %>"
										placeholder="ex)2019.03.14 ~ 2019.03.29  " required
										maxlength="40">
								</div>
								<div>
									<label style="padding-left: 14px">훈련장소 </label> <input
										type="text" name="training_place" class="form-control" value="<%= infringementitem.getTraining_place() %>"
										placeholder="ex)실제 발전소와 동일하게 설계된 시뮬레이터 주제어실 " required>
								</div>
								<br>
							<div class="form-row">
								<div>
									<label style="padding-left: 14px">일자별 훈련내용 </label>
									<textarea wrap="hard" cols=30 rows=30 name="date"  placeholder="1일차) 사고신고 및 초동대응 &#13;&#10;&#13;&#10;2일차) 증거확보 및 보존&#13;&#10;     ▶증거자료 백업 &#13;&#10;&#13;&#10; 3일차) 사고조사&#13;&#10;     ▶공격유형별 사고조사&#13;&#10;     ▶사고원인 규명 및 공격근원지 추적&#13;&#10;             ※필요시 과학기술부 합동조사팀 연계 조사&#13;&#10;     ▶범죄여부 판단(실무기관->과학기술정보보호센터->과기부)&#13;&#10;             ※필요시 과학기술부장관이 국가정보원장에 수사요청" autofocus class="form-control"><%=infringementitem.getDate()%></textarea>
								</div>
								<br> <br>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">취소</button>

								<button type="submit" class="btn btn-primary"
									onclick="return test_checkbox()">수정하기</button>
							</div>
						</form>
					</tbody>
				</div>
			</div>
		</div>
	</div>
	<footer id="mainfooter">
		<span>ㅤㅤ ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ COPYRIGHT ⓒ
			2018 HelloSecurity. All Rights Reserved</span>
	</footer>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
