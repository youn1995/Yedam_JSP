<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>string object 연습</h3>
	<div id = "result"></div>
	<script>
		var url = "/review/member/member/memberInsert.jsp"
		var filename = url.split("/");
		var results = filename[(filename.length)-1];
		result.innerHTML = results.split(".")[0];
		
		result.innerHTML += "<br>"+results;
		
		var urlIndex = url.lastIndexOf("/");
		result.innerHTML += "<br>"+url.substring(urlIndex+1);
		
	</script>
</body>
</html>