<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>json.jsp</title>

</head>
<body>
	<div id="result"></div>
	<script>
		//객체
		var obj = {
			id : "hong",
			name : "길동홍"
		};
		result.innerHTML += obj.name + "<br>";

		//배열
		var arr = [ {
			id : "hong",
			name : "길동홍"
		}, {
			id : "kim",
			name : "길동무"
		} ]
		result.innerHTML += arr[1].name + "<br>";

		//객체안에 값이 배열인경우
		var objArr = {
			id : "hong",
			name : "길동홍",
			hoddy : [ "운동", "동운", "동동" ]
		};
		result.innerHTML += objArr.hoddy[1] + "<br>";
		
		//객체객체
		var objObj = {
			members : {
				cnt : 4,
				list : [ "kim", "lee" ]
			}
		};
		result.innerHTML += objObj.members.list[0] + "<br>";
		
		
	</script>
</body>
</html>