<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input id="txtFruit" onkeypress="">
	<button type="button" id="btnAdd" onclick="addFruit()">추가</button>
	<button type="button" id="btnRemove" onclick="removeFruit()">삭제</button>
	<select id="listFruit" size="10"></select>
	<script>
	txtFruit.addEventListener("keypress", function(){
		if(event.keyCode == 13){
			addFruit();
		}
	})
	
	
	function addFruit(){
		  var option = document.createElement("option");
		  if(txtFruit.value != ""){
			  option.text = txtFruit.value;
			  listFruit.add(option); 
			  txtFruit.value = "";
		  } else {
			  window.alert("값넣어라");
		  }
	}
	
	function removeFruit(){
		listFruit.remove(listFruit.selectedIndex);
	}
	</script>
</body>
</html>