<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberSearch</title>
<script>
	function loadDoc() {
		//1.XHR 객체 생성
		var xhttp = new XMLHttpRequest();
		//2. 콜백 함수 //서버로 부터 응답이 오면 이벤트를 실행
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4) {
				if (this.status == 200) {
					var obj = JSON.parse(this.responseText); //json 일떄 하는법
					document.getElementById("result").innerHTML = "";
					for (i = 0; i < obj.length; i++) {
						document.getElementById("result").innerHTML += obj[i].name
								+ "<br>" + obj[i].job + "<br>";
					}
				} else {
					document.getElementById("result").innerHTML = xhttp.status
																+ xhttp.statusText;
				}
				//document.getElementById("result").innerHTML += this.responseText;  // txt html
			} else {
				document.getElementById("result").innerHTML = "처리중..."
			}
		};
		//3.요청준비  // html, txt ,json상관없음
		xhttp.open("GET", "./server/memberInfo.jsp", true); //true는 디폴트라 안적어도됨
		//4.요청시작
		xhttp.send();
	}
</script>
</head>
<body>
	<input type="text">
	<input type="text" id="name">
	<button type="button" onclick="loadDoc()">검색</button>
	<div id="result"></div>
</body>
</html>