<%@ page language="java" import="java.sql.*, java.lang.*, java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="asset.AssetDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	//DB에 저장된 AssetTable의 속성들을 getParameter 함수를 통해 불러옴 
	Connection Conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	String asset_name = request.getParameter("asset_name");
	String priority = request.getParameter("priority");
	String[] asset_properties = request.getParameterValues("asset_property");
	// var tAccount_manage=document.getElementById('account_manage');

	String asset_type = request.getParameter("asset_type");
	String inter_face = request.getParameter("inter_face");
	String protocol = request.getParameter("protocol");
	String os_type = request.getParameter("os_type");
	String usages = request.getParameter("usages");
	String db_list = "select * from AssetTable";
	int num = 1;
%>
<jsp:useBean id="listDAO" class="asset.AssetDAO" />
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
</head>
<body>
	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="./js/jquery.min.js"></script>
	<!-- 파퍼 자바스크립트 추가하기 -->
	<script src="./js/popper.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>
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
			<a class="navbar-brand" href="main.jsp">ICS 취약점 진단 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="asset_list.jsp">자산 리스트</a></li>
				<li><a href="asset_eva.jsp" onclick="return eva_button()">자산
						평가</a></li>
				<script type="text/javascript">
					function eva_button() {
						return confirm("평가할 자산을 선택해주세요.")
					};
					function test_checkbox() {
						var flag = false;
						//checkbox 접근 후 체크된 개수 파악
						var values = document
								.getElementByName("asset_priority");
						alert(values.length);
						for (var i = 0; i < values.length; i++) {
							if (values[i].checked) {
								alert(values[i].value);
							}
						}
						return flag;
					}
				</script>
				<li><a href="sec_eva.jsp">보안성 평가 결과</a></li>
			</ul>
			<%
				//로그인 여부에 따라 달라지는 탭 구현 위한 코드
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
	<%
		//DB연동을 위함
		try {
			String dbURL = "jdbc:mysql://127.0.0.1:3306/ics3?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "0805";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			stmt = Conn.createStatement();
	%>

	<section class="container">
		<div class="row">
			<table name="AssetTable" class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th rowspan="2"
							style="background-color: #eeeeee; text-align: center;"></th>
						<th width=5% rowspan="2"
							style="background-color: #eeeeee; text-align: center;">번호</th>
						<th width=18% rowspan="2"
							style="background-color: #eeeeee; text-align: center;">자산명</th>
						<th width=7% rowspan="2"
							style="background-color: #eeeeee; text-align: center;">우선순위</th>
						<th width=27% colspan="4" scope="colgroup" id="type"
							style="background-color: #eeeeee; text-align: center;">자산속성</th>
						<th width=5% rowspan="2"
							style="background-color: #eeeeee; text-align: center;">유형</th>
						<th colspan="2" scope="colgroup" id="type"
							style="background-color: #eeeeee; text-align: center;">통신</th>
						<th rowspan="2"
							style="background-color: #eeeeee; text-align: center;">OS</th>
						<th width=15% rowspan="2"
							style="background-color: #eeeeee; text-align: center;">장치용도</th>
					</tr>

					<tr>
						<th scope="row" id="asset_manage"
							style="background-color: #eeeeee; text-align: center;">계정관리</th>
						<th scope="row" id="asset_manage"
							style="background-color: #eeeeee; text-align: center;">암호화</th>
						<th scope="row" id="asset_manage"
							style="background-color: #eeeeee; text-align: center;">로그기록</th>
						<th width=10% scope="row" id="asset_manage"
							style="background-color: #eeeeee; text-align: center;">외부매체연결성</th>

						<th width=8% scope="row" id="asset_manage"
							style="background-color: #eeeeee; text-align: center;">인터페이스</th>
						<th width=7% scope="row" id="asset_manage"
							style="background-color: #eeeeee; text-align: center;">프로토콜</th>


					</tr>
				</thead>
				<tbody>
					<%
						rs = stmt.executeQuery(db_list);
							while (rs.next()) {
					%>
					<tr>
						<td><input id="checkbox" type="checkbox"
							onClick="fn_allChecked();" name="chkObject" value="<%="r_id"%>"></td>
						<td><%=rs.getString(1)%></td>
						<td><%=rs.getString(2)%></td>
						<td><%=rs.getString(3)%></td>
						<td>
							<%
								if (rs.getBoolean("account_manage") == true) {
											out.println("O");
										} else {
											out.println("X");
										}
							%>
						</td>
						<td>
							<%
								if (rs.getBoolean("logging") == true) {
											out.println("O");
										} else {
											out.println("X");
										}
							%>
						</td>
						<td>
							<%
								if (rs.getBoolean("encryption") == true) {
											out.println("O");
										} else {
											out.println("X");
										}
							%>
						</td>
						<td>
							<%
								if (rs.getBoolean("external_connect") == true) {
											out.println("O");
										} else {
											out.println("X");

										}
										System.out.println(rs.getBoolean("external_connect"));
							%>
						</td>
						<td><%=rs.getString(8)%></td>
						<td><%=rs.getString(9)%></td>
						<td><%=rs.getString(10)%></td>
						<td><%=rs.getString(11)%></td>
						<td><%=rs.getString(12)%></td>
					</tr>


					<%
						// System.out.println(rs.getBoolean("account_manage"));

								num++;
							}
							rs.close();
							stmt.close();
							Conn.close();
						} catch (SQLException e) {
							out.println(e);
						} catch (Exception e1) {
							out.println(e1);
						}

						if (num == 1) {
					%>
					<tr>
						<td colspan="3">저장된 데이터가 없습니다.</td>
					</tr>
					<%
						}
					%>

				</tbody>
			</table>
			<%
				for (int i = 1; i <= 1; i++) {
			%>
			<form method="get" action="./updAction.jsp" class="form-inline mt-3"
				style="float: right;">
				<a onclick="fn_delRow('chkObject')"
					class="btn btn-primary mx-1 mx-2" href="#" value="<%=i%>">삭제</a>
			</form>
			<form method="get" action="./updAction.jsp" class="form-inline mt-3"
				style="float: right;">
				<a href="#asset_upd" data-toggle="modal"
					class="btn btn-primary mx-1 mx-2" value="<%=i%>">수정</a>ㅤ
			</form>

			<form method="get" action="./regAction.jsp" class="form-inline mt-3"
				style="float: right;">
				<a href="#asset_reg" data-toggle="modal"
					class="btn btn-primary mx-1 mx-2" value="<%=i%>">추가</a>ㅤ
			</form>

			<%
				}
			%>
		
	</section>



	<div class="modal fade" id="asset_reg" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">

		<div class="modal-dialog">

			<div class="modal-content">

				<div class="modal-header">

					<h5 class="modal-title" id="modal">자산 등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="./regAction.jsp" method="post">
						<div class="form-row">
							<div class="form-group col-sm-6">
								<label>자산명</label> <input type="text" name="asset_name"
									class="form-control" maxlength="20">
							</div>
							<div class="form-group col-sm-6">
								<label>자산 우선순위</label> <select name="priority"
									class="form-control">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
								</select>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>자산 속성</label> <input type=checkbox id="account_manage"
									value="계정관리" maxlength="50" name="asset_property">계정관리
								<input type=checkbox id="encryption" value="암호화" maxlength="50"
									name="asset_property">암호화ㅤ <input type=checkbox
									id="logging" value="로그기록" maxlength="50" name="asset_property">로그기록ㅤ
								<input type=checkbox id="external_connect" value="외부매체연결성"
									maxlength="50" name="asset_property">외부매체연결성
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-6">
								<label>유형</label> <input type="text" name="asset_type"
									class="form-control" maxlength="20">
							</div>
							<div class="form-group col-sm-6">
								<label>인터페이스</label> <input type="text" name="inter_face"
									class="form-control" maxlength="20">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-4">
								<label>프로토콜</label> <input type="text" name="protocol"
									class="form-control" maxlength="20">
							</div>
							<div class="form-group col-sm-4">
								<label>os 종류</label> <input type="text" name="os_type"
									class="form-control" maxlength="20">
							</div>
							<div class="form-group col-sm-4">
								<label>사용 용도</label> <input type="text" name="usages"
									class="form-control" maxlength="20">
							</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary"
								onclick="return test_checkbox()">등록하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="asset_upd" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">자산 수정</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="./updAction.jsp" method="post">
						<div class="form-row">
							<div class="form-group col-sm-6">
								<label>자산명</label> <input type="text" name="asset_name"
									class="form-control" maxlength="20" value="${data.asset_name }">
								<td>${data.asset_name}</td>
							</div>
							<div class="form-group col-sm-6">
								<label>자산 우선순위</label> <select name="priority"
									class="form-control">
									<option value="<%=priority%>"></option>
								</select>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>자산 속성</label>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-6">
								<label>유형</label> <input type="text" name="asset_type"
									class="form-control" maxlength="20" value="<%="asset_type"%>">
							</div>
							<div class="form-group col-sm-6">
								<label>인터페이스</label> <input type="text" name="inter_face"
									class="form-control" maxlength="20" value="<%="inter_face"%>">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-4">
								<label>프로토콜</label> <input type="text" name="protocol"
									class="form-control" maxlength="20" value=<%="protocol"%>>
							</div>
							<div class="form-group col-sm-4">
								<label>os 종류</label> <input type="text" name="os_type"
									class="form-control" maxlength="20" value="<%="os_type"%>">
							</div>
							<div class="form-group col-sm-4">
								<label>사용 용도</label> <input type="text" name="usages"
									class="form-control" maxlength="20" value="<%="re_usages"%>">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary">수정하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		function fn_delRow(chkObjNm) {

			if ($("input[name=" + chkObjNm + "]").is(":checked")) {

				if (confirm("삭제 하시겠습니까?")) {

					for (var i = $("[name='" + chkObjNm + "']:checked").length - 1; i > -1; i--) {

						$("[name='" + chkObjNm + "']:checked").eq(i).closest(
								"tr").remove();

					}

				}

			} else {

				alert("선택된 데이터가 없습니다.");

			}

		}
	</script>



	<footer id="mainfooter">
		<span>ㅤㅤ ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ COPYRIGHT ⓒ
			2018 HelloSecurity. All Rights Reserved</span>
	</footer>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>