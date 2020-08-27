<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(window).on("load", function(){
		var $tr = $("tbody").children()
		var sum = 0;
		$tr.each(function(i){
	    	sum += parseInt($tr.eq(i).children().eq(1).html());
	    });
		$("#kor").html(sum);
	});
	
</script>
</head>
<body>
<table border="1" id="tbl">
	<thead>
		<tr>
			<td>이름</td>
			<td>국어</td>
			<td>영어</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>kim</td>
			<td>90</td>
			<td>80</td>
		</tr>
		<tr>
			<td>park</td>
			<td>60</td>
			<td>100</td>
		</tr>
		<tr>
			<td>choi</td>
			<td>40</td>
			<td>100</td>
		</tr>			
	</tbody>
</table>
<div>국어합계: <span id="kor"></span></div>
</body>
</html>