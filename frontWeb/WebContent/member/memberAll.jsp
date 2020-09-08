
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
				<th>취미</th>
				<th>가입일짜</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach items="${list}" var="mem">
				<tr>
					<td><a href="memberSelect.jsp">${mem.id}</a></td>
					<td>${mem.pw}</td>
					<td>${mem.job}</td>
					<td>${mem.gender}</td>
					<td>${mem.mailyn}<c:if test="${mem.mailyn.equals('Y')}"><button type="button">메일전송</button></c:if></td>
					<td>${mem.reason}</td>
					<td>${mem.hobby}</td>
					<td>
					<fmt:parseDate value="${mem.regdate}" pattern="yyyy-MM-dd HH:mm:ss" var="parseToday"/>
					<fmt:formatDate value="${parseToday}" pattern="MM-dd"/>
					</td>
				</tr>

			</c:forEach>
		</tbody>
	</table>
</body>
</html>