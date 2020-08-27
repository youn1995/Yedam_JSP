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
	$(".btnSelect").on("click", function(){
		alert($(this).closest("tr").children().eq(0).html());
	});
	}
</script>
</head>
<body>
	<table border="1" id="tbl">
		<tbody>
			<tr>
				<td>kim</td>
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
</body>
</html>