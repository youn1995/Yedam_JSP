<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window.addEventListener("load", function(){
		var btns = document.getElementsByClassName("btnSelect");
		//단독이벤트
/* 		for(i=0; i<btns.length; i++){
			btns[i].addEventListener("click", function(){
				var $td = this.parentNode.parentNode.getElementsByTagName("td")[0];
				window.alert($td.innerHTML);
			});
		} */
		//그룹이벤트
		tbl.addEventListener("click", function(){
			//객체볼떄 편함 로그는 텍스트
			console.dir(event.target);  //버튼
			console.dir(this); //table
			alert(event.target.parentNode.parentNode.getElementsByTagName("td")[0].innerHTML);
		});
		
	});
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