<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		//초기화
			$("[name=gender]").val(["${memVo.gender}"])	
		$("[name=hobby]").val("${memVo.hobby}".replace(/\/+$/,'').split("/"))
		$("#frm [name=job]").val("${memVo.job}")
		if("${memVo.mailyn}" == "Y"){
			$("[name=mailyn]").val(["on"])	
		}
		
	});

</script>
</head>
<body>
	${error}
	<form action="${pageContext.request.contextPath}/memberSearch.do">
	<input type = "hidden" name="dos" value="update">
		id: <input name="id">
		<button>검색</button>
	</form>
	<c:if test="${memVo != null}">
		<h3 class="page_title">회원등록</h3>
		<div class="regist">
			<form method="post" name="frm" id="frm" action="${pageContext.request.contextPath}/memberUpdate.do">
				<div>
					<label for="id">Id: </label> <input type="text" id="id" name="id"
						value="${memVo.id }" readonly="readonly">
				</div>
				<div>
					<label for="pw">Password: </label> <input type="password" id="pw"
						name="pw" value="${memVo.pw }">
				</div>
				<div>
					<label for="gender">성별</label> <input type="radio" id="male"
						name="gender" value="m">
						
					<label for="male">남</label> <input type="radio" id="female"
						name="gender" value="f">
						
					<label for="female">여</label>
				</div>

				<div>
					<label for="job">직업: </label> <select id="job" name="job">

						<!-- selected -->
						<option value="">선택</option>
						<option value="nojob">NoJob</option>
						<option value="developer"
							>developer</option>
						<option value="dba"
							>dba</option>
					</select>
				</div>
				<div>
					<label for="mailYn">메일수신여부</label> <input type="checkbox"
						id="mailyn" name="mailyn"
						>
				</div>
				<div>
					<label for="reason">가입동기</label>
					<textarea name="reason" rows="10" cols="30"> ${memVo.reason } </textarea>
				</div>
				<div>
					<label for="hobby">취미</label> <input type="checkbox" id="hobby1"
						name="hobby" value="read"
						<c:if test='${memVo.hobby.contains("read")}'> checked='checked'</c:if>>
					독서 <input type="checkbox" id="hobby2" name="hobby" value="game"
						<c:if test='${memVo.hobby.contains("game")}'> checked='checked'</c:if>>
					게임 <input type="checkbox" id="hobby3" name="hobby" value="ski"
						<c:if test='${memVo.hobby.contains("ski")}'> checked='checked'</c:if>>
					스키
				</div>
				<div>
					<button>수정</button><input type="reset" value="취소">
				</div>
			</form>
		</div>
	</c:if>
</body>
</html>