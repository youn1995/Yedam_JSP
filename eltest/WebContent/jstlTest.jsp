<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstlTest.jsp</title>
</head>
<body>
숫자포맷: ${price} <br>
<fmt:formatNumber value="${price}" pattern="00,000.0"/> <br>
<fmt:formatNumber value="${price}" type="number"/> <br>
<fmt:formatNumber value="${price}" type="currency" currencySymbol="\"/> <br>
<hr>
스트링숫자포맷: ${priceStr}
<fmt:formatNumber value="${priceStr}" pattern="00,000.0"/> <br>
<hr>
${today}<br>
<fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/><br>
<fmt:formatDate value="${today}" pattern="E"/>요일입니다.<br>
${todayStr}<br>
<fmt:parseDate value="${todayStr}" pattern="yyyy/MM/dd" var="parseToday"/>
<fmt:formatDate value="${parseToday}" pattern="E"/>요일입니다.<br>
<hr>
미리 정의된 날짜 형식 : <fmt:formatDate value="${today}" dateStyle="short"/><br>
미리 정의된 날짜 형식 : <fmt:formatDate value="${today}" dateStyle="long"/><br>
미리 정의된 날짜 형식 : <fmt:formatDate value="${today}" timeStyle="short"/><br>
미리 정의된 날짜 형식 : <fmt:formatDate value="${today}" timeStyle="long"/><br>
미리 정의된 날짜 형식 : <fmt:formatDate value="${today}" pattern="MM/dd hh:mm"/><br>
미리 정의된 날짜 형식 : <fmt:formatDate value="${today}" type="both"/><br>
<hr>
<%
	Date birth = new Date();
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	String birthStr=format.format(birth);
	out.print(birth + "<br>");
	out.print(birthStr);

%>
</body>
</html>