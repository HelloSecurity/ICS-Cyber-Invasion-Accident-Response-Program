<%@ page language="java" contentType="application/vnd.ms-excel;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- DAO 호출 -->
<jsp:useBean id="ResultDAO" class="result.ResultDAO" />
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>취약점 진단 프로그램</title>
</head>
<body>
<% 
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");

String today = formatter.format(new java.util.Date());

String file_name = "ICSVAP_"+today;

String ExcelName  = new String(file_name.getBytes("8859_1"),"euc-kr")+".xls";
response.setContentType("application/vnd.ms-excel");

response.setHeader("Content-Disposition", "attachment; filename="+ExcelName);
%>
		<!-- 표 삽입 -->
		<div class="row">
			<div style="text-align: right;">
			</div>
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd; overflow: scroll;">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">우선순위</th>
						<th style="background-color: #eeeeee; text-align: center;">통제분야</th>
						<th style="background-color: #eeeeee; text-align: center;">No.</th>
						<th style="background-color: #eeeeee; text-align: center;">통제항목</th>
						<th style="background-color: #eeeeee; text-align: center;">점검항목</th>
						<th style="background-color: #eeeeee; text-align: center;">근거자료(관리적)</th>
						<th style="background-color: #eeeeee; text-align: center;">근거자료(물리적)</th>
						<th style="background-color: #eeeeee; text-align: center;">점검방법</th>
						<th style="background-color: #eeeeee; text-align: center;">평가결과</th>
						<th style="background-color: #eeeeee; text-align: center;">보안조치사항</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="data" items="${ResultDAO.getResult() }">
						<tr>
							<!-- jstl -->
							<td>${data.finalPriority}</td>
							<td>${data.control_field}</td>
							<td>${data.control_item}</td>
							<td>${data.control_item_no}</td>
							<td>${data.check_item}</td>
							<td>${data.management}</td>
							<td>${data.physics}</td>
							<td>${data.method}</td>
							<td>${data.result}</td>
							<td>${data.action}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>