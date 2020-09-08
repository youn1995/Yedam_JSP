<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${error}
<form action="${pageContext.request.contextPath}/memberSearch.do">
	<input type = "hidden" name="dos" value="search">
	id: <input name="id">
	<button>검색</button>
</form>
<a href="${pageContext.request.contextPath}/memberList.do">전체검색</a>
</body>
</html>