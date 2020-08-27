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
	var ocnt = 0;
	var xcnt = 0;
	$(window).on("load", init);
	function init(){
		$("#btn1").on("click", resetRandom);
		$("#btn").on("click", sum);
		resetRandom();
		
		}
	
		function sum() {
			if (parseInt($("#num1").val()) + parseInt($("#num2").val()) == parseInt($("#result").val())) {
				ocnt += 1;
				$("#num1").val(Math.floor((Math.random() * 10) + 1));
				$("#num2").val(Math.floor((Math.random() * 10) + 1));
				$("#result").val("");
				$("#divResult").html($("#divResult").html() + "맞다<br>");
				
			} else {
				xcnt += 1;
				$("#num1").val(Math.floor((Math.random() * 10) + 1));
				$("#num2").val(Math.floor((Math.random() * 10) + 1));
				$("#result").val("");
				$("#divResult").html($("#divResult").html() + "틀림<br>");
			}
			
			if(ocnt+xcnt == 5){
				$("#btn").attr("disabled", "true");
				alert((ocnt*20)+"점");
			}
		}

		function resetRandom() {
			$("#num1").val(Math.floor((Math.random() * 10) + 1));
			$("#num2").val(Math.floor((Math.random() * 10) + 1));
			$("#result").val("");
			ocnt = 0;
			xcnt = 0;
			$("#divResult").html("");
			$("#btn").attr("enabled", "true");
		}
		
	</script>
</head>
<body>
	<input name="num1" id="num1">+
	<input name="num2" id="num2">=
	<input name="result" id="result">

	<button type="button" id="btn">결과확인</button>
	<button type="button" id="btn1">초기화</button>
	<div id="divResult"></div>

</body>
</html>