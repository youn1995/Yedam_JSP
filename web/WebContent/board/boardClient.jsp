<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>BoardClient.jsp</title>
<script>
	$(function(){
		//목록조회
		function boardList(){
			$.ajax("../BoardSelectAllAjaxServ" , {
				dataType : "json",
				success : function(datas){
					for(i=0; i<datas.length; i++){
						$("<div>").append(datas[i].no).append(datas[i].poster)
								.append(datas[i].subject)
								.data("no", datas[i].no)
								.append($("<button>").html("삭제").addClass("btnDel"))
								.appendTo($("#list"));
					}
				}
			})
		}
		//저장버튼
		$("#btnSave").on("click", function(){
			$.ajax("../BoardInsertAjaxServ", {dataType : "json",
				data : $("form").serialize(),
				success : function(data){
					$("<div>").append(data.no)
					.append(data.poster).append(data.subject).data("no", data.no)
					.append($("<button>").html("삭제").addClass("btnDel"))
					.appendTo($("#list"));
				}
			})
			
		})
		//삭제버튼
		$("#list").on("click", ".btnDel", function(){
			no = $(this).parent().data("no");
			div = $(this).parent();
			$.ajax("../BoardDeleteAjaxServ", {
				method : "get",
				dataType : "json",
				data : {no : no},
				success : function(){
					alert("지워짐");
					div.remove();
				}
			})
			
		})
		
		boardList();
	});

</script>
</head>
<body>
	<div id="divid" data-id="4"	></div>
	<div id="list">
		<form>
			<input type="text" name="poster" placeholder="작성자"> <input
				type="text" name="subject" placeholder="제목">
			<textarea rows="4" cols="50" name="contents" placeholder="내용"></textarea>
			<button type="button" id="btnSave">저장</button>
		</form>
	</div>

</body>
</html>