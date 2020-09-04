<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeptInsertForm.jsp</title>
</head>
<body>
	<%@include file="/common/header.jsp"%>
	<form action="deptInsert" method="post">
		id<input name="department_id"><br>
		name<input name="department_name"><br>
		지역 <select name="location_id">
			<option value="">음슴
		<c:forEach items="${locationList}" var="loc">
			<option value="${loc.location_id}"> ${loc.city}
			</c:forEach>
		</select><br>
		매니저<select name="manager_id">
		<option value="">음슴
		<c:forEach items="${empList}" var="emp">
			<option value="${emp.employee_id}"> ${emp.first_name} ${emp.last_name}
			</c:forEach>
		</select><br>
		<button>등록</button>
	</form>
</body>
</html>