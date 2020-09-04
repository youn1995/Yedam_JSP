<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>empSelectAll.jsp</title>
</head>
<body>
<%@include file="/common/header.jsp"%>
<h3>전체 직원 목록</h3>
<div>
	<table border="1">
	<thead>
		<tr>
			<th>사번</th>
			<th>이름</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>고용일짜</th>
			<th>직책</th>
			<th>급여</th>
			<th>커미션</th>
			<th>매니저</th>
			<th>부서</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${list}" var="emp">
		<tr>
			<td><a href="empUpdateServ?employee_id=${emp.employee_id}">${emp.employee_id}</a></td>
			<td>${emp.first_name} ${emp.last_name}</td>
			<td>${emp.email}</td>
			<td>${emp.phone_number}</td>
			<td>${emp.hire_date}</td>
			<td>${emp.job_id}</td>
			<td>${emp.salary}</td>
			<td>${emp.commission_pct}</td>
			<td>${emp.manager_id}</td>
			<td>${emp.department_id}</td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
</div>

</body>
</html>