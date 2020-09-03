<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eltest.jsp</title>
</head>
<body>
	<h3>과와와일</h3>
	<c:forEach items="${fruit}" var="temp">
		<div>${temp}</div>
	</c:forEach>
	<hr> 첫번째 과일 ${fruit[0] }
	<br> 두번째 사람 이름 ${user[1].getName()}
	<br> content : ${board.content}
	<br> 사람쥐 이름 ${login.name}
	<br>
	<!-- private일경우 실제로는 필드명으로 접근하는게 아니라 겟메소드를 부름 -->
	list 첫번째회원의 이름 ${list[0].name}
</body>
</html>