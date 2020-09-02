<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage="true"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error.jsp</title>
</head>
<body>
	this is error. welcome to error.<br>
	에러내용: <%=exception.getMessage()%><br>
	에러타입: <%=exception.getClass().getName() %>
</body>
</html>