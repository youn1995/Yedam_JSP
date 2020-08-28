<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jq_ui</title>
<link rel="stylesheet"
	href="../jquery-ui.css">
<!-- css가 먼저 오고 재이쿼리 js -> ui 제이쿼리가 와야함-->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="../jquery-ui.js"></script>
<script>
	$(function() {
		//아코디언
		$("#acor").accordion({
			active : 1,
			animate : 300,
			collapsible : true,
			activate : function(event, ui) {
				console.log(ui.newHeader.text());
			}
		});

		//다이아로그
		$("#msg").dialog({
			autoOpen : false,
			height : 400,
			width : 350,
			modal : true,
			buttons : {
				'저장' : function() {
					alert("scv 출동");
				},
				'취소' : function() {
					$("#msg").dialog("close");
				}
			}

		});

		//버튼
		$("#btnPopup").button().click(function() {
			$("#msg").dialog("open");
		});
		
		  $( "#regDate" ).datepicker({
			  dateFormat: "yy-mm-dd",
			  minDate: 0,
			  maxDate: "1m"

		  });
		  
		  $( document ).tooltip();
		  $( "#acor" ).draggable();
		
	});
</script>
</head>
<body>
	<input id="regDate">
	<span id="btnPopup">팝업열기?</span>
	<div id="msg">알림팝업</div>
	<div id="acor">
		<h3>자바</h3>
		<div>자바란...</div>
		<h3>빤쓰런ㄴ</h3>
		<div>잡스란...</div>
		<h3>잠바라라랑</h3>
		<div>잠바랑아앙란...</div>

	</div>
</body>
</html>