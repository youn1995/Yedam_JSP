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

</head>

<body>
<img id="img1" src="./images/Koala.jpg">
<script>
		img1.style.left = "100px"
		document.addEventListener("keydown", function(){
			
			if(event.keyCode == 37) {
				console.log(event.keyCode);
				img1.style.left = ( parseInt(img1.style.left) - 10 ) + "px";
			}
		});
		
	
</script>
</body>
</html>