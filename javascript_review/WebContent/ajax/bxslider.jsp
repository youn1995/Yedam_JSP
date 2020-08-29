<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script>
	$(document).ready(function() {
		$('.slider').bxSlider({
			speed : 200,
			randomStart : "true",
			auto : true,
			autoControls : true,
			stopAutoOnClick : true,
			pager : true,
			slideWidth : 600
		});
	});
</script>
</head>
<body>
	<div class="slider">
		<div>
			<img src="../JS/images/Desert.jpg" alt="Desert">
		</div>
		<div>
			<img src="../JS/images/Koala.jpg" alt="Koala">
		</div>
		<div>
			<img src="../JS/images/Lighthouse.jpg" alt="Lighthouse">
		</div>
		<div>
			<img src="../JS/images/Jellyfish.jpg" alt="Jellyfish">
		</div>
	</div>
</body>
</html>