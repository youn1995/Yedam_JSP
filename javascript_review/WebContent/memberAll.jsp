<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="menu.jsp"%>
	<h3 class="page_title">회원 전체 조회</h3>
	<div>
	<ul class="search">
		<li>메일수신여부</li>
		<li>성별</li>
		<li><button type="button">검색</button></li>
	</ul>
	</div>
	<table id="members" border="1">
		<thead>
			<tr>
				<th>id</th>
				<th>pw</th>
				<th>job</th>
				<th>성별</th>
				<th>메일수신여부</th>
				<th>가입동기</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><a href="memberSelect.jsp">Eve11</a></td>
				<td>Jackson</td>
				<td>프로그래머</td>
				<td>남</td>
				<td>Y</td>
				<td>모름</td>
			</tr>
			<tr>
				<td><a href="memberSelect.jsp">Eve111</a></td>
				<td>Jackson11</td>
				<td>프로그래머</td>
				<td>남</td>
				<td>Y</td>
				<td>모름</td>
			</tr>
			<tr>
				<td><a href="memberSelect.jsp">Eve1111</a></td>
				<td>Jackson11</td>
				<td>프로그래머</td>
				<td>남</td>
				<td>Y</td>
				<td>모름</td>
			</tr>
		</tbody>
	</table>
</body>
</html>