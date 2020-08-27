<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<table border="1" id="tbl">
		<tbody>
			<tr>
				<td id="std">kim</td>
				<td>20</td>
				<td><button type="button" class="btnSelect">선택</button></td>
			</tr>
			<tr>
				<td>park</td>
				<td>55</td>
				<td><button type="button" class="btnSelect">선택</button></td>
			</tr>
			<tr>
				<td>hong</td>
				<td>5</td>
				<td><button type="button" class="btnSelect">선택</button></td>
			</tr>
		</tbody>
	</table>
	<script>
	 $("td:first").css("backgroundColor", "green") // 모든 td에서 하나 td:first-child는 자식으로 있는 첫번째 td
	console.log($("#std").closest("table")); // 조상 중에서 검색
	
</script>
</body>
</html>