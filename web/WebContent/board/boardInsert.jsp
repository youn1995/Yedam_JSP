<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardInsert.jsp</title>
<script>
	function inputCheck(){
		return true;
	}
</script>
</head>
<body>
<%@include file="/common/header.jsp" %>
	<h3 class="page_title">게시글등록</h3>
	<div class="regist">
		<form method="post" name="frm" id="frm" action="boardInsert.do"
			onsubmit="return inputCheck()">
			<div>
				<label for="poster">Poster: </label> <input type="text" id="poster" name="poster">
			</div>
			<div>
				<label for="poster">Subject: </label> <input type="text" id="subject"
					name="subject">
			</div>
			<div>
				<label for="contents">Contents: </label>
				<textarea name="contents" rows="10" cols="30"> </textarea>
			</div>
			<div>
				<label for="filename">file: </label>
				<input type="file" id="filename" name="filename">
			</div>
			<div>
				<input type="submit" value="작성">
				<input type="reset" value="취소">
			</div>
		</form>
	</div>
</body>
</html>