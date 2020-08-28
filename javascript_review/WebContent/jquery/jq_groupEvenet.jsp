<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jq_groupEvent</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#btnAdd").click(function(){
			$("ul").append($("<li>").text($("#fruit").val()));
			
		});
		
		/*$("li").on({"mouseover" : function(){
			$(this).css("background-color", "yellow");
		}, "mouseout" : function(){
			$(this).css("background-color", "");
		}});*/
		
		
		//그룹이벤트
		$("ul").on("mouseover", "li", function(){
			$(this).css("background-color", "yellow");
		});
		$("ul").on("mouseout", "li", function(){
			$(this).css("background-color", "");
		});
		
	});
</script>
</head>
<body>
	<input id="fruit"><button type="button" id="btnAdd">추가</button>
	
	<ul>
		<li>자바</li>
		<li>스프링</li>
	</ul>
</body>
</html>