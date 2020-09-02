<%@page import="board.BoardVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			</tr>
		</thead>
		<tbody>
		<% ArrayList<BoardVo> list = (ArrayList<BoardVo>) request.getAttribute("list"); 
for(BoardVo boa: list) { %>
			<tr>
				<td><a href="boardSelect.jsp"><%=boa.getNo()%></a></td>
				<td><%=boa.getPoster()%></td>
				<td><%=boa.getSubject()%></td>
				<td><%=boa.getContents()%></td>
				<td><%=boa.getLastpost()%></td>
				<td><%=boa.getViews()%></td>
				<td><%=boa.getFilename()%></td>
			</tr>
<% } %>			
		</tbody>
	</table>
</body>
</html>