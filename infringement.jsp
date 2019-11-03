<%@ page language="java" import="java.sql.*, java.lang.*, java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="scenario.ScenarioItem"%>
<%@ page import="scenario.ScenarioDAO"%>
<%@ page import="infringementAction.InfringementDAO"%>
<%@ page import="infringementAction.InfringementItem"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="sdao" class="scenario.ScenarioDAO" />

<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	//DB에 저장된 AssetTable의 속성들을 getParameter 함수를 통해 불러옴 
	Connection Conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	int id = 0;
	String training_type = request.getParameter("training_type");
	String training_schedule = request.getParameter("training_schedule");
	String training_place = request.getParameter("training_place");
	String training_division = request.getParameter("training_division");
	String scenario_no = request.getParameter("scenario_no");
	String date = request.getParameter("date");
	String name = request.getParameter("name");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	InfringementDAO d = new InfringementDAO();
	//ArrayList<InfringementItem> list2 = d.getInfringementlist(keyField, keyWord);
	int num = 1;
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<script src="https://code.jquery.com/jquery-3.1.1.min.js">
	
</script>
<link rel="stylesheet" href="css/bootstrap.css">
<title>취약점 진단 프로그램</title>
<!-- 부트스트립 css 추가하기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<!-- 커스텀 css 추가하기 -->
<link rel="stylesheet" href="./css/custom.css">
</head>

<body>

	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="./js/jquery.min.js"></script>
	<!-- 파퍼 자바스크립트 추가하기 -->
	<script src="./js/popper.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>
	<script>
		function searchCheck(frm) {
			//검색

			if (frm.keyWord.value == "") {
				alert("검색 단어를 입력하세요.");
				frm.keyWord.focus();
				return;
			}
			frm.submit();
		}
	</script>
    
    <style>
    .btn-primary{
			background-color:#848484;
			border-color:#848484
		}
    </style>
	<%
		// 로그인여부 확인
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
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
			<%
				//로그인 여부에 따라 달라지는 탭 구현 위한 코드
				if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>
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
	<%
		try {

	         String dbURL = "jdbc:mysql://icsdatabase2.csqmh3rbxyia.ap-northeast-2.rds.amazonaws.com:3306/icsdatabase?serverTimezone=UTC";			
	         String dbID = "icsdatabase";
			String dbPassword = "icsdatabase";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			stmt = Conn.createStatement();
	%>

	<div id="search" style="padding-bottom: 15px; margin-right: 370px;"
		align="right">
		<tr>
			<td colspan="7"><br />
				<form name="search" method="post">
					<select name="keyField">
						<option value="0">----선택----</option>
						<option value="id">번호</option>
						<option value="training_type">훈련종류</option>
					</select> <input type="text" name="keyWord" /> <input type="button"
						value="검색" onclick="searchCheck(form)" />

				</form></td>
		</tr>
	</div>
	<section class="container">
		<div class="row">
			<table name="Infringement_Table" class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">

				<thead>
					<tr>
						<th width=5% rowspan="2"
							style="background-color: #eeeeee; text-align: center;">훈련번호</th>
						<th width=15% rowspan="2"
							style="background-color: #eeeeee; text-align: center;">훈련명</th>
						<th width=12% rowspan="2"
							style="background-color: #eeeeee; text-align: center;">훈련종류</th>
						<th width=12% rowspan="2"
							style="background-color: #eeeeee; text-align: center;">훈련일정</th>
						<th width=5% rowspan="2"
							style="background-color: #eeeeee; text-align: center;">시나리오 번호</th>
					</tr>
				</thead>
				<tbody>
					<%
						int pageNumber = 1;
							if (request.getParameter("pageNumber") != null) {
								pageNumber = Integer.parseInt(request.getParameter("pageNumber"));

							}
							ArrayList<InfringementItem> list = d.getList(pageNumber);
							for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
				
						<td style="vertical-align: middle;"><%=list.get(i).getId()%></td>
						<td style="vertical-align: middle;"><a
							href="infringement_detail.jsp?id=<%=list.get(i).getId()%>"><%=list.get(i).getName()%></a></td>
						<td style="vertical-align: middle;"><%=list.get(i).getTraining_type()%></td>
						<td style="vertical-align: middle;"><%=list.get(i).getTraining_schedule()%></td>
						<td style="vertical-align: middle;"><%=list.get(i).getScenario_no()%></td>
						<%
							// System.out.println(rs.getBoolean("account_manage"));

									//num++;
								}
						%>
						<%
							// System.out.println(rs.getBoolean("account_manage"));

								//num++;

								//rs.close();
								//  stmt.close();
								//  Conn.close();
							} catch (SQLException e) {
								System.out.println(e);
							} catch (Exception e1) {
								System.out.println(e1);
							}
						%>
					
				</tbody>

			</table>
		</div>
	</section>





	<div id="crud"
		style="padding: 10px; margin: 10px; float: right; margin-right: 150px;"
		align="right">
		<!-- <button class = "btn btn-primary pull-right" onclick="location.href='asset_eva_select.jsp';"  type="button">평가완료</button> -->
		<%
			for (int i = 1; i <= 1; i++) {
		%>
		
		<form method="post" action="./infringementAction.jsp"
			class="form-inline mt-3" style="float: right; margin-right:200px;">
			<a href="#infringement_reg" data-toggle="modal"
				class="btn btn-primary mx-1 mx-2" value="<%=i%>">추가</a>ㅤ
		</form>
		
		<%
			}
		%>
	</div>
	<div class="modal fade" id="infringement_reg" tabindex="-1"
		role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">

			<div class="modal-content">

				<div class="modal-header">

					<h3>침해대응훈련 등록</h3>
					<br>
					<tbody>
						<form action="./infringementAction.jsp" method="get">
							<div class="form-row">
								<div class="form-group col-sm-6">
									<label>시나리오 번호</label> <select name="scenario_no"
										id="scenario_no">
										<option value="0">----선택----</option>
										<c:forEach var="data" items="${sdao.getScenarioIdlist() }">
											<option value="${data }">${data }</option>
										</c:forEach>
									</select>
								</div>
								<div class="form-group col-sm-6">
									<label>훈련종류 </label> <select name="training_type">
										<option value="0">----선택----</option>
										<option value="도상훈련">도상훈련</option>
										<option value="실전훈련">실전훈련</option>
									</select>
								</div>
								<div>

									<label>훈련명 </label> <input type="text"
										placeholder="산업제어시스템 기반 취약점 분석 도구" name="name" required
										class="form-control" />
								</div>
								<br>
								<div class="form-group col-sm-6">

									<label>훈련부서 </label> <input type="text"
										placeholder="ex)한국원자력안전기술원" name="training_division" required
										class="form-control" />
								</div>
								<div class="form-group col-sm-6">
									<label>훈련일정 </label> <input type="text"
										name="training_schedule" class="form-control"
										placeholder="ex)2019.03.14 ~ 2019.03.29  " required
										maxlength="40">
								</div>
								<div>
									<label style="padding-left: 14px">훈련장소 </label> <input
										type="text" name="training_place" class="form-control"
										placeholder="ex)실제 발전소와 동일하게 설계된 시뮬레이터 주제어실 " required>
								</div>
								<br>
								<div>
									<label style="padding-left: 14px">일자별 훈련내용 </label>
									<textarea wrap="hard" cols=30 rows=25 name="date" placeholder="1일차) 사고신고 및 초동대응 &#13;&#10;&#13;&#10;2일차) 증거확보 및 보존&#13;&#10;     ▶증거자료 백업 &#13;&#10;&#13;&#10; 3일차) 사고조사&#13;&#10;     ▶공격유형별 사고조사&#13;&#10;     ▶사고원인 규명 및 공격근원지 추적&#13;&#10;             ※필요시 과학기술부 합동조사팀 연계 조사&#13;&#10;     ▶범죄여부 판단(실무기관->과학기술정보보호센터->과기부)&#13;&#10;             ※필요시 과학기술부장관이 국가정보원장에 수사요청"
										autofocus class="form-control"></textarea>
								</div>

								<br> <br>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">취소</button>

								<button type="submit" class="btn btn-primary"
									onclick="return test_checkbox()">등록하기</button>
							</div>
						</form>
					</tbody>
				</div>
			</div>
		</div>
	</div>
</body>
<style>
	#mainfooter{
		position:absolute;
		bottom:0;
		width:100%;
		height:70px;
	}
</style>
               <footer id="mainfooter">
               <span>COPYRIGHT ⓒ 2019 HelloSecurity. All Rights Reserved</span></footer>

</html>