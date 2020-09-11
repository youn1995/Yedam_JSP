<%@page import="dept.DeptVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deptSelectAllPage.jsp</title>
	<style>
		.pagination li {
			display : inline-block;
			border : 1px solid gray;
		}
		.pagination .active {
			border : 1px solid gray;
			background-color : yellow;
		}
	</style>
</head>
<body>
<%@include file="/common/header.jsp" %>

<form name="searchFrm">
	<input type="hidden" name="p" value="1">
	<input name="department_name" value="${param.department_name}">
	<button>검색</button>
</form>

	<table border="1">
<% ArrayList<DeptVo> list = (ArrayList<DeptVo>)request.getAttribute("list"); 
for(DeptVo dept: list) { 

%>
		<tr><td><a href="deptSelect?department_id=<%=dept.getDepartment_id()%>"><%=dept.getDepartment_id()%></a></td>
		<td><%=dept.getDepartment_name() %></td></tr>
<% } %>
	</table>

<my:paging paging="${paging}" jsfunc="gopage"></my:paging>
<script>
	function gopage(p){
		serachFrm.p.value = p;
		searchFrm.submit();
		//location.href="deptSelectAllPage?p=" + p;
	}
</script>
</body>
</html>