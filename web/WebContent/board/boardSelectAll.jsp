<%@page import="board.BoardVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/common/header.jsp" %>
<h3 class="page_title">회원 전체 조회</h3>
	<table id="members" border="1">
		<thead>
			<tr>
				<th>no</th>
				<th>작성자</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>파일명</th>
				<th>이미지</th>
			</tr>
		</thead>
		<tbody>

<c:forEach items="${list}" var="boa">
			<tr>
				<td><a href="boardSelect.jsp">${boa.no}</a></td>
				<td>${boa.poster}</td>
				<td>${boa.subject}</td>
				<td>${boa.contents}</td>
				<td>${boa.lastpost}</td>
				<td>${boa.views}</td>
				<td><a href="download.do?filename=${boa.filename}">${boa.filename }</a></td>
				<td><c:if test="${not empty boa.filename }">
					<img src="../images/${boa.filename}" style ="width:50px">	</c:if></td>
			</tr>
</c:forEach>	
		</tbody>
	</table>
</body>
</html>