<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../common.css">
</head>
<body>
	<ul class="menu">
		<li><a href="../member/memberInsert.jsp">회원등록</a></li>
		<li><a href="../member/memberSelect.jsp">회원조회</a></li>
		<li><a href="../member/memberAll.jsp">회원전체조회</a></li>
		<li><a href="../board/boardInsert.jsp">게시글등록</a></li>
		<li><a href="../board/boardSelect.jsp">게시글조회</a></li>
		<li><a href="../board/boardAll.jsp">게시글전체조회</a></li>
	</ul>
	<br>
	<div id ="divPageName" class="page_title"></div>
	<script>
	window.onlo
		url = location.pathname;
		var pageName = url.substring(url.lastIndexOf("/")+1);
		
		divPageName.innerHTML = pageName;
		
		lis = document.querySelectorAll(".menu li");
		if(pageName == "memberInsert.jsp") {
			lis[0].className = "menuActive";
		} else if (pageName == "memberSelect.jsp") {
			lis[1].className = "menuActive";

		} else if (pageName == "memberAll.jsp") {
			lis[2].className = "menuActive";
		}
	</script>
</body>
</html>