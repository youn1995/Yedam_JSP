<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(window).on("load", init);
	function init(){
		$(".price").hide();
/* 		$(".title").on("mouseenter", function(){
			//$(this).parent().find(".price").eq(0).css("display","inline");
			$(this).next().show();
		});
		$(".title").on("mouseout", function(){
			//$(this).parent().find(".price").eq(0).css("display","none");
			$(this).next().hide();
		}); */
		$(".title").on("mouseenter mouseleave", function(){
			$(this).next().toggle();
		});
	}

</script>
</head>
<body>
	<div>
		<span class="title">스프링</span> <span class="price">5000</span>
	</div>
	<div>
		<span class="title">잠바</span> <span class="price">3000</span>
	</div>
	<div>
		<span class="title">잠바스크럽</span> <span class="price">2000</span>
	</div>

</body>
</html>