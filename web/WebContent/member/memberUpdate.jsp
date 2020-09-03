<%@page import="member.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function inputCheck() {
		return true;
	}
</script>
</head>
<body>
	<%@include file="/common/header.jsp"%>
	<%
		MemberVo member = (MemberVo) session.getAttribute("login");
	%>
	<h3 class="page_title">회원등록</h3>
	<div class="regist">
		<form method="post" name="frm" id="frm" action="memberUpdate"
			onsubmit="return inputCheck()">
			<div>
				<label for="id">Id: </label> <input type="text" id="id" name="id"
					value="<%=member.getId()%>" readonly>
			</div>
			<div>
				<label for="pw">Password: </label> <input type="password" id="pw"
					name="pw" value="<%=member.getPw()%>">
			</div>
			<div>
				<label for="gender">성별</label> <input type="radio" id="male"
					name="gender" value="m"
					<%if ("m".equals(member.getGender())) {
	out.print("checked='checked'");
}%>>
				<label for="male">남</label> <input type="radio" id="female"
					name="gender" value="f"
					<%if ("f".equals(member.getGender())) {
	out.print("checked='checked'");
}%>>
				<label for="female">여</label>
			</div>

			<div>
				<label for="job">직업: </label> <select id="job" name="job">

					<!-- selected -->
					<option value="">선택</option>
					<option value="nojob"
						<%if ("nojob".equals(member.getJob())) {
	out.print("selected='selected'");
}%>>NoJob</option>
					<option value="developer"
						<%if ("developer".equals(member.getJob())) {
	out.print("selected='selected'");
}%>>Developer</option>
					<option value="dba"
						<%if ("dba".equals(member.getJob())) {
	out.print("selected='selected'");
}%>>DBA</option>
				</select>
			</div>
			<div>
				<label for="mailYn">메일수신여부</label> <input type="checkbox"
					id="mailyn" name="mailyn"
					<%if (member.getMailyn().equals("Y")) {
	out.print("checked='checked'");
}%>>
			</div>
			<div>
				<label for="reason">가입동기</label>
				<textarea name="reason" rows="10" cols="30"><%=member.getReason()%></textarea>
			</div>
			<div>
				<!-- indexed -->


				<label for="hobby">취미</label> <input type="checkbox" id="hobby1"
					name="hobby" value="read" 
					<%if (member.getHobby() != null && member.getHobby().contains("read")) {
	out.print("checked='checked'");
}%>>
				독서 <input type="checkbox" id="hobby2" name="hobby" value="game" 
					<%if (member.getHobby() != null && member.getHobby().contains("game")) {
	out.print("checked='checked'");
}%>>
				게임 <input type="checkbox" id="hobby3" name="hobby" value="ski" 
					<%if (member.getHobby() != null && member.getHobby().contains("ski")) {
	out.print("checked='checked'");
}%>>
				스키
			</div>

			<div>
				<!-- <button type="button" onclick="inputCheck()">등록</button>-->
				<input type="submit"> <input type="reset" value="취소">
			</div>
		</form>
	</div>
</body>
</html>