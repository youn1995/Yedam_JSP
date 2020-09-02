<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
</head>
<body>
<%@include file="/common/header.jsp" %>
<%=request.getAttribute("errormsg")%>
<form method="post" name="frm" id="frm" action="login">
			<div>
				<label for="id">Id: </label> <input type="text" id="id" name="id">
			</div>
			<div>
				<label for="pw">Password: </label> <input type="password" id="pw"
					name="pw">
			</div>
			<div>
				<input type="submit">
				<input type="reset" value="취소">
			</div>
		</form>
</body>
</html>