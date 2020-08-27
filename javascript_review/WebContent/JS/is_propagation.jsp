<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div {
	padding: 30px;
	border: 1px solid blue;
}
</style>
<script>
window.addEventListener("load", function(){
	a.addEventListener("click", function(){
		alert("A");
	});
	b.addEventListener("click", function(){
		alert("B");
	});
	c.addEventListener("click", function(){
		alert("C");
		window.event.stopPropagation(); //전파중지
	});
	
	alink.addEventListener("click", function(){
		if(! confirm("이동할까요?")){  //예 아니오를 이용해 참거짓
			window.event.preventDefault(); //원래 기능중지	
		}
	});
	
});

</script>
</head>
<body>
	<a href="js_event.jsp" id="alink">이벤트 테스트</a>
	<div id="a">
		A
		<div id="b">
			B
			<div id="c">C</div>
		</div>
	</div>
</body>
</html>