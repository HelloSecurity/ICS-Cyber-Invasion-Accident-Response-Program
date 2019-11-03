<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="evaDAO" class="eva.EvaDAO" />
<jsp:useBean id="assetDAO" class="asset.AssetDAO" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 <link rel="stylesheet" href="css/bootstrap.css">
<!-- 부트스트립 css 추가하기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<!-- 커스텀 css 추가하기 -->
<link rel="stylesheet" href="./css/custom.css">
<title>취약점 진단 프로그램</title>
</head>
<style>
	#mainfooter{
		position:absolute;
		bottom:0;
		width:100%;
		height:70px;
	}

	#dataaction{
		text-align:left;
	}
	td{
		valign:middle;
		padding:10px;
		border: 1px solid #bebebe;
		
	}
	th{
		padding:5px;
	}
		.btn-primary{
			background-color:#848484;
			border-color:#848484
		}
</style>
</style>
<body>
<script src="./js/jquery.min.js"></script>
	<!-- 파퍼 자바스크립트 추가하기 -->
	<script src="./js/popper.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>
	<% // 로그인여부 확인
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
				<li class="active"><a href="asset_eva.jsp" onclick="return eva_button()">자산
						평가</a></li>
				<li><a href="sec_eva.jsp">보안성 평가 결과</a></li>
				<li><a href="emergency_case.jsp">비상사건 관리</a></li>
		<!-- 	<li><a href="scenario.jsp">시나리오 리스트</a></li> -->
				<li><a href="scenario_eva.jsp">시나리오 관리</a></li>
				<li><a href="infringement.jsp">침해대응 훈련</a></li>
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
		<script>
	    function rowSpan(tableId, columnNo){
	      	   var temp = document.getElementById(tableId);
	      	   var rows = temp.getElementsByTagName("TR");
	      	   var previous = -1;
	      	   for (var i = 1; i < rows.length; i++) {
	      	   	   if (i > 1){
	      	   	   	   var compare = (previous < 0) ? (i - 1) : previous ;
	      	   	   	   var preCol = rows[ compare ].getElementsByTagName("TD")[columnNo];
	      	   	   	   var curCol = rows[i].getElementsByTagName("TD")[columnNo];
	      	   	   	   if (preCol.innerHTML == curCol.innerHTML){
	      	   	   	   	   preCol.rowSpan = preCol.rowSpan + 1; 
	      	   	   	   	   curCol.style.display = 'none';
	      	   	   	   	   previous = compare;
	      	   	   	   }else{
	      	   	   	   	   previous = -1;
	      	   	   	   }
	      	   	   }
	      	   }
	      }
	    </script>
	<article id="article">
		<div id="check" style="margin: 10px; padding: 5px;  padding-right: 30px;text-align: right;">
			<form action="" method="post" name="formm">
				<select name="select_asset" id="select_asset">
					<c:forEach var="data" items="${evaDAO.getAssetlist() }">
						<option value="${data }">${data }</option>
					</c:forEach>
				</select> <input type="submit" value="선택">
			</form>
			<%
				String[] sels = request.getParameterValues("select_asset");
				String sel = "";
				if (sels != null) {
					for (int i = 0; i < sels.length; i++)
						sel += sels[i] + " ";
				}

				String asset_name = sel;

				request.setAttribute("str", asset_name);

				Connection Conn = null;

				try {
					String dbURL = "jdbc:mysql://icsdatabase2.csqmh3rbxyia.ap-northeast-2.rds.amazonaws.com:3306/icsdatabase?serverTimezone=UTC";
					String dbID = "icsdatabase";
					String dbPassword = "icsdatabase";
					Class.forName("com.mysql.cj.jdbc.Driver");
					Conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
					String sql = "SELECT * from assettable where asset_name = '" + asset_name + "'";
					PreparedStatement pstmt = Conn.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();

					rs.next();
					int priority = rs.getInt("priority");
					request.setAttribute("PRIORITY", priority);

				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
			선택한 자산 : ${str } <br> 자산우선순위 : ${PRIORITY } <br>


		</div>

		<c:if test="${str != '' }">
			<form name=form1 id="myForm" action="asset_eva_select.jsp"
				method=post>
				<div id="evaluation_table" style="height: 700px; padding-left: 50px;  padding-right: 50px; margin: 5px; overflow: scroll;">
					<input type="hidden" name="asset_name" value="${str }" /> 
					<input type="hidden" id="real_data" name="real_data" />
					<table class="evaluation_table" id="asset_eva_table" style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th width=5 style="background-color: #eeeeee; text-align: center;"></th>
								<th width=2% style="background-color: #eeeeee; text-align: center;">No.</th>
								<th width=6% colspan=2 style="background-color: #eeeeee; text-align: center;">통제분야</th>
								<th width=6% style="background-color: #eeeeee; text-align: center;">항목번호</th>
								<th width=3% style="background-color: #eeeeee; text-align: center;">통제항목</th>
								<th width=250 style="background-color: #eeeeee; text-align: center;">점검항목</th>
								<th width=10% style="background-color: #eeeeee; text-align: center;">평가결과</th>
								<th width=7% style="background-color: #eeeeee; text-align: center;">항목중요도</th>
								<th	style="background-color: #eeeeee; text-align: center; display: none;">근거자료(관리적)</th>
								<th	style="background-color: #eeeeee; text-align: center; display: none;">근거자료(기술적)</th>
								<th
									style="background-color: #eeeeee; text-align: center; display: none;">점검방법</th>
								<th
									style="background-color: #eeeeee; text-align: center; display: none;">보안조치사항</th>
							</tr>
						</thead>

						<tbody>

							<c:forEach var="data" items="${evaDAO.getControlItem() }">
								<!-- evaDAO는 DB에서 테이블의 값들을 가져오게 하는 자바빈즈. getControlItem은 db테이블의 값을 저장한 배열 -->

								<tr>
									<td><input id="checkbox" name="checkBox" type="checkbox"></td>
									<td><c:out value="${data.id}" /></td>
									<td valign=top><c:out value="${data.no}" /></td>
									<td valign=top><c:out value="${data.control_field}" /></td>
									<td><c:out value="${data.control_item_no}" /></td>
									<td><c:out value="${data.control_item}" /></td>
									<td id="dataaction"><c:out value="${data.check_item}" /></td>
									<td><select id="select">
											<option value="N">N</option>
											<option value="Y">Y</option>
									</select></td>
									<td><c:out value="${data.importance}" /></td>
									<td style="display: none;"><c:out
											value="${data.management}" /></td>
									<td style="display: none;"><c:out value="${data.physics}" /></td>
									<td style="display: none;"><c:out value="${data.method}" /></td>
									<td style="display: none;"><c:out value="${data.action}" /></td>
								</tr>

							</c:forEach>

						</tbody>

					</table>
			<script>rowSpan("asset_eva_table",2),rowSpan("asset_eva_table",3),rowSpan("asset_eva_table",4), rowSpan("asset_eva_table",5)</script>
					
				</div>
				<div id="selectBtn" style="padding-left: 10px; margin: 10px;"
					align="right">
					<!-- <button class = "btn btn-primary pull-right" onclick="location.href='asset_eva_select.jsp';"  type="button">평가완료</button> -->
					<button class="btn btn-primary pull-right" type="submit" onclick="eva_end()">평가완료</button>

					<!-- 원래 sec_eva.jsp임 -->
				</div>
				<script type="text/javascript">
					function eva_end() {
						return confirm("자산 평가가 완료되었습니다.")
					}
				</script>



				<script>
					$(document)
							.ready(
									function() {
										$('#selectBtn')
												.click(
														function() {

															var tdArr = new Array();
															var checkbox = $("input[name=checkBox]:checked");
															var checklen = $("input[name=checkBox]:checked").length;

															//each는 각각에 대해서 반복문을 돌린다.
															checkbox
																	.each(function(
																			i) {
																		var tr = checkbox
																				.parent()
																				.parent()
																				.eq(
																						i);
																		var td = tr
																				.children();

																		var id = td
																				.eq(
																						1)
																				.text();
																		var no = td
																				.eq(
																						2)
																				.text();
																		var control_field = td
																				.eq(
																						3)
																				.text();
																		var control_item_no = td
																				.eq(
																						4)
																				.text();
																		var control_item = td
																				.eq(
																						5)
																				.text();
																		var check_item = td
																				.eq(
																						6)
																				.text();
																		var result = $(
																				this)
																				.closest(
																						"tr")
																				.find(
																						"option:selected")
																				.val();

																		var importance = td
																				.eq(
																						8)
																				.text();
																		var management = td
																				.eq(
																						9)
																				.text();
																		var physics = td
																				.eq(
																						10)
																				.text();
																		var method = td
																				.eq(
																						11)
																				.text();
																		var action = td
																				.eq(
																						12)
																				.text();

																		var json_obj = {
																			'id' : id,
																			'no' : no,
																			'control_field' : control_field,
																			'control_item_no' : control_item_no,
																			'control_item' : control_item,
																			'check_item' : check_item,
																			'result' : result,
																			'importance' : importance,
																			'management' : management,
																			'physics' : physics,
																			'method' : method,
																			'action' : action
																		};
																		//배열에 json 객체 저장
																		tdArr
																				.push(json_obj);

																	});
															var json_str = JSON
																	.stringify(tdArr);
															// alert(json_str);

															//hidden으로 설정 된 input 태그에 json 문자열 세팅
															$('#real_data')
																	.val(
																			json_str);

														});

									});
				</script>
			</form>

		</c:if>

	</article>

		<footer id="mainfooter">
		<span>ㅤㅤ ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ COPYRIGHT ⓒ
			2019 HelloSecurity. All Rights Reserved</span>
	</footer>
</body>
</html>
