<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../menu.jsp"%>
	<h3 class="page_title">게시글조회</h3>
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
				<th>게시글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일짜</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><a href="boardSelect.jsp">111</a></td>
				<td>안녕하세요 반갑습니다</td>
				<td>프로그래머</td>
				<td>2020/08/20</td>
				<td>3</td>
			</tr>
			<tr>
				<td><a href="boardSelect.jsp">111</a></td>
				<td>안녕하세요 반갑습니다</td>
				<td>프로그래머</td>
				<td>2020/08/20</td>
				<td>3</td>
			</tr>
			<tr>
				<td><a href="boardSelect.jsp">111</a></td>
				<td>안녕하세요 반갑습니다</td>
				<td>프로그래머</td>
				<td>2020/08/20</td>
				<td>3</td>
			</tr>
		</tbody>
	</table>
</body>
</html>