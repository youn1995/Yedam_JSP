<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function inputCheck() {
		if (frm.subject.value == "") {
			window.alert("제목 입력");
			frm.subject.focus();
			return;
		}
		if (frm.poster.value == "") {
			window.alert("작성자 입력");
			frm.poster.focus();
			return;
		}
		if(frm.contents.value == ""){
			window.alert("내용 입력");
			frm.contents.focus();
			return;
		}
		
		frm.submit();
	}
</script>
</head>
<body>
	<%@include file="../menu.jsp"%>
	<h3 class="page_title">게시글작성</h3>
	<form method="post" name="frm" id="frm" action="boardInsertProc.jsp"
		onsubmit="return inputCheck()">
		<div>
			<label for="subject">제목: </label> <input type="text" id="subject"
				name="subject">
		</div>
		<div>
			<label for="poster">작성자: </label> <input type="text" id="poster"
				name="poster">
		</div>
		<div>
			<label for="contents">내용</label>
			<textarea name="contents" rows="10" cols="30"></textarea>
		</div>
		<div>
		 	<label for="filename">파일추가:</label>
 		 	<input type="file" id="filename" name="filename">	
		</div>
		<div>
			<button type="button" onclick="inputCheck()">등록</button>
			<input type="reset" value="취소">
		</div>
	</form>
</body>
</html>
