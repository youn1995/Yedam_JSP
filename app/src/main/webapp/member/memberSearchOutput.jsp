<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberSearchOutput.jsp</title>
</head>
<body>
<c:if test="${error != null}"><div>${error}</div>	</c:if>
<c:if test="${error == null}">	<div><span class="label">아이디: </span><span> ${memVo.id} </span></div>
	<div><span class="label">비번: </span><span> ${memVo.pw} </span></div>
	<div><span class="label">직업: </span><span> ${memVo.job} </span></div>
	<div><span class="label">성별: </span><span> ${memVo.gender} </span></div>
	<div><span class="label">메일수신여부: </span><span> ${memVo.mailyn} </span></div>
	<div><span class="label">가입동기: </span><span> ${memVo.reason} </span></div>
	<div><span class="label">가입일짜: </span><span> ${memVo.regdate} </span></div>
	 </c:if>	


</body>
</html>