<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	//$(window).on("load", function(){});
	$(function() { //ready 이벤트   load 보다 먼저 발생
		//$("td").on("click", function(){
		$("td").click(function() { // on click 이랑 동일함  (개별이벤트)
			$("#right").append($(this).parent());
		});
													//one은 한번만 이밴트하고 삭제됨
		$("#right").on("click", "td", function() { // 그룹이벤트 그룹이벤트는 on에서만 가능함  bind는 개별   --- 이벤트제거시 unbind, off
			$("#left").append($(this).parent());
		});

	});
</script>
</head>
<body>
	<table id="left" border="1">
		<tr>
			<td>홍길동</td>
			<td>30</td>
		</tr>
		<tr>
			<td>홍동</td>
			<td>32</td>
		</tr>
		<tr>
			<td>홍길</td>
			<td>31</td>
		</tr>
	</table>
	<br>
	<table id="right" border="1"></table>
</body>
</html>