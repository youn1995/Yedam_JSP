<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<input name="num1" id="num1">+
	<input name="num2" id="num2">=
	<input name="result" id="result">

	<button type="button" id="btn" onclick="sum()">결과확인</button>
	<button type="button" id="btn1" onclick="resetRandom()">초기화</button>
	<div id="divResult">
	
	</div>
	<script>
		var ocnt = 0;
		var xcnt = 0;
		function sum() {
			if (parseInt(num1.value) + parseInt(num2.value) == parseInt(result.value)) {
				ocnt += 1;
				num1.value = Math.floor((Math.random() * 10) + 1);
				num2.value = Math.floor((Math.random() * 10) + 1);
				result.value = "";
				divResult.innerHTML += "맞다<br>";
			} else {
				xcnt += 1;
				num1.value = Math.floor((Math.random() * 10) + 1);
				num2.value = Math.floor((Math.random() * 10) + 1);
				result.value = "";
				divResult.innerHTML += "틀림<br>";
			}
			
			if(ocnt+xcnt == 5){
				btn.disabled = true;
				window.alert((ocnt*20)+"점");
			}
		}

		function resetRandom() {
			num1.value = Math.floor((Math.random() * 10) + 1);
			num2.value = Math.floor((Math.random() * 10) + 1);
			result.value = "";
			ocnt = 0;
			xcnt = 0;
			divResult.innerHTML = "";
			btn.enabled = true;
		}

		resetRandom();
	</script>
</body>
</html>