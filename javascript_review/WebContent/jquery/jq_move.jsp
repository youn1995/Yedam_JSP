<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#img1 {
	width : 50px;
	top: 100px;
	left : 100px;
	position : relative;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(window).on("load", function(){
		$("#img1").css({"left":"100px","top":"100px"});
		$(document).on("keydown", function(){
			if(event.keyCode == 37) {
				console.log(event.keyCode);
				$("#img1").css("left",(parseInt($("#img1").css("left"))-10)+"px");
			} else if(event.keyCode == 38){
				$("#img1").css("top",(parseInt($("#img1").css("top"))-10)+"px");
			} else if(event.keyCode == 39){
				$("#img1").css("left",(parseInt($("#img1").css("left"))+10)+"px");
			} else if(event.keyCode == 40){
				$("#img1").css("top",(parseInt($("#img1").css("top"))+10)+"px");
			}
		});
	});
</script>
</head>

<body>
<img id="img1" src="../JS/images/Koala.jpg">
</body>
</html>