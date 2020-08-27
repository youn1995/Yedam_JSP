<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>
	manager <input id="manager_id"><button type="button" id="btnSearch" onclick="findManager()">검색</button>
</form>
<script>
	function findManager() {
		var popup = window.open("empAll.jsp","empSearch","width=350,height=300,left=100,top=100");
		popup.addEventListener("load",function(){
			popup.document.title="hi";	
		});
		
	}
</script>
</body>
</html>