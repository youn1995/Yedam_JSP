<%@page import="java.util.ArrayList"%>
<%@page import="member.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<% ArrayList<MemberVo> list = (ArrayList<MemberVo>) request.getAttribute("list"); 
for(MemberVo mem: list) { %>
			<tr>
				<td><a href="memberSelect.jsp"><%=mem.getId()%></a></td>
				<td><%=mem.getPw()%></td>
				<td><%=mem.getJob()%></td>
				<td><%=mem.getGender()%></td>
				<td><%=mem.getMailyn()%></td>
				<td><%=mem.getReason()%></td>
				<td><%=mem.getHobby()%></td>
				<td><%=mem.getRegdate()%></td>
			</tr>
<% } %>			
		</tbody>
	</table>
</body>
</html>