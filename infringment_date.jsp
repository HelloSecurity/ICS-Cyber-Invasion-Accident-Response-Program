<%@ page language="java" import="java.sql.*, java.lang.*, java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="scenario.ScenarioItem"%>
<%@ page import="scenario.ScenarioDAO"%>
<%@ page import="infringementAction.InfringementDAO"%>
<%@ page import="infringementAction.InfringementItem"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="dao" class="infringementAction.InfringementDAO" />


<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	// 세션의 로그인여부 확인
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) { //로그인 안 됐을 경우
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.css">
<title>취약점 진단 프로그램</title>
<%
	//DB에 저장된 AssetTable의 속성들을 getParameter 함수를 통해 불러옴 
	Connection Conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	String id = request.getParameter("id");
	String training_type = request.getParameter("training_type");
	String training_schedule = request.getParameter("training_schedule");
	String training_place = request.getParameter("training_place");
	String training_division = request.getParameter("training_division");
	String scenario_no = request.getParameter("scenario_no");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	InfringementDAO d = new InfringementDAO();
	ArrayList<InfringementItem> list = d.getInfringementlist(keyField, keyWord);
	int num = 1;
	String db_list2 = "SELECT * FROM infringementitem WHERE id=" + id;
	System.out.println(db_list2);
%>

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
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">ICS 취약점 진단 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="asset_list.jsp">자산 리스트</a></li>
				<li><a href="control_item_list.jsp">통제항목 리스트</a></li>
				<li><a href="asset_eva.jsp" onclick="return eva_button()">자산
						평가</a></li>
				<li><a href="sec_eva.jsp">보안성 평가 결과</a></li>
				<li><a href="emergency_case.jsp">비상사건 관리</a></li>
				<li><a href="scenario.jsp">시나리오 리스트</a></li>
				<li><a href="scenario_eva.jsp">시나리오 평가</a></li>
				<li class="active"><a href="infringement.jsp">침해대응 훈련</a></li>
			</ul>
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
		</div>
	</nav>




	<section class="container">
		<div class="row">
			<table name="Infringement_Table" class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th width=8%
							style="background-color: #eeeeee; text-align: center;">No.</th>

						<th width=16%
							style="background-color: #eeeeee; text-align: center;">훈련번호
						</th>

						<th width=15%
							style="background-color: #eeeeee; text-align: center;">훈련종류
						</th>
						<th width=8%
							style="background-color: #eeeeee; text-align: center;">훈련일정</th>


						<th width=10%
							style="background-color: #eeeeee; text-align: center;">훈련장소
						</th>


						<th width=20%
							style="background-color: #eeeeee; text-align: center;">시나리오
							번호</th>
					</tr>
				</thead>

				<tbody>
					<%
						//DB연동을 위함
						try {
							 String dbURL = "jdbc:mysql://icsdatabase.csqmh3rbxyia.ap-northeast-2.rds.amazonaws.com:3306/icsdatabase?serverTimezone=UTC";
								String dbID = "icsdatabase";
								String dbPassword = "icsdatabase";
							Class.forName("com.mysql.cj.jdbc.Driver");
							Conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
							stmt = Conn.createStatement();
					%>
					<%
						rs = stmt.executeQuery(db_list2);

							while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getString(1)%></td>
						<td><%=rs.getString(2)%></td>
						<td><%=rs.getString(3)%></td>
						<td><%=rs.getString(4)%></td>
						<td><%=rs.getString(5)%></td>
						<td><%=rs.getString(6)%></td>

						<%
							}

							} catch (SQLException e) {
								out.println(e);
							} catch (Exception e1) {
								out.println(e1);
							}
						%>
					
				</tbody>
			</table>
		</div>
		<div>
			<%
				//DB연동을 위함
				try {
					 String dbURL = "jdbc:mysql://icsdatabase.csqmh3rbxyia.ap-northeast-2.rds.amazonaws.com:3306/icsdatabase?serverTimezone=UTC";
						String dbID = "icsdatabase";
						String dbPassword = "icsdatabase";
					Class.forName("com.mysql.cj.jdbc.Driver");
					Conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
					stmt = Conn.createStatement();
					ResultSet rs2 = stmt.executeQuery("SELECT * FROM infringementitem WHERE id=" + id);
			%>
			<%
				for (int i = 1; i <= 1; i++) {
			%>
			<form method="post" action="InfringementUpdAction.jsp"
				class="form-inline mt-3" style="float: right;">
				<a href="#infringemnet_upd"
					onsubmit="return InfringementUpdAction()" data-toggle="modal"
					class="btn btn-primary mx-1 mx-2" value=<%=i%>>수정</a>ㅤ
			</form>
			<form method="post" action="./infringementAction.jsp"
				class="form-inline mt-3" style="float: right;">
				<a href="#infringement_reg2" data-toggle="modal"
					class="btn btn-primary mx-1 mx-2" value="<%=i%>">일자별 수행내용 등록</a>ㅤ
			</form>

			<%
				}
			%>

		</div>
		<div class="modal fade" id="infringement_reg2" tabindex="-1"
			role="dialog" aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog">

				<div class="modal-content">

					<div class="modal-header">

						<h3>일자별 훈련내용 등록</h3>
						<br>
						</thead>
						<tbody>
							<form action="./infringmentAction.jsp" method="get">
								<div class="form-row">
									<div>
										<label style="padding-left: 14px">일자별 수행내용 </label>
										<textarea name="scenario_sum" cols="70"
											placeholder="내용을 입력하세요. " name="content" class="form-control">
										</textarea>
									</div>
									<br> <br>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>

									<button type="submit" class="btn btn-primary"
										onclick="return test_checkbox()">저장하기</button>
								</div>
							</form>
						</tbody>
					</div>
				</div>
			</div>
		</div>
		<head>


<div class="modal fade" id="infringement_upd" tabindex="-1"
	role="dialog" aria-labelledby="modal" aria-hidden="true">
	<div class="modal-dialog">

		<div class="modal-content">

			<div class="modal-header">

				<h3>시나리오 수정</h3>
		</head>
		<%
			while (rs2.next()) {
		%>
		<form action="./updatedb.jsp" name="update" method="post"
			onsubmit="return ScenarioUpdAction()">
			<input type="hidden" name="Token" value="67q82a6k3ldd03kds946s33">
			<div class="form-row">
				<div class="form-group col-sm-6">
					<label>시나리오 번호</label> <input type="text" name="id"
						class="form-control" maxlength="10" value="<%=id%>"> <label>시나리오
						제목 </label> <input type="text" id="scenario_name" name="scenario_name"
						class="form-control" maxlength="20"
						value=<%=rs2.getString("scenario_name")%>>

				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-sm-6">
					<label>해당 자산 </label> <input type="text" name="asset_name"
						class="form-control" value="<%=rs2.getString("asset_name")%>">
				</div>

				<div class="form-group col-sm-6">
					<label>침해사고수준 </label> <select name="infringement_level"
						value="<%=rs2.getString("infringement_level")%>">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
					</select>
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-sm-6">

					<label>초기조건: </label> <input type="text" placeholder="내용을 입력하세요. "
						name="scenario_condition" class="form-control"
						value="<%=rs2.getString("scenario_condition")%>" />
				</div>
				<div class="form-row">
					<label>시나리오 요약: </label>
					<textarea name="scenario_sum" cols="10" placeholder="내용을 입력하세요. "
						name="content" class="form-control"> <%=rs2.getString("scenario_sum")%></textarea>
				</div>


				<div class="form-row">
					<label>시나리오 내용: </label>
					<textarea cols="50" rows="30" name="scenario_content"
						class="form-control"> <%=rs2.getString("scenario_content")%></textarea>
				</div>

				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>

				<input type="submit" value="수정" class="btn btn-primary"></input>
			</div>
		</form>

	</section>
	<%
		}
			Conn.close();
		} catch (Exception e) {
			out.println("데이터베이스에 문제가 있습니다.");
			out.println(e.getMessage());
			e.getStackTrace();
		}
	%>
</body>