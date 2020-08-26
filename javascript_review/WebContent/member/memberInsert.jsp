<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function inputCheck(){
		if(frm.id.value == "") {
			window.alert("id 입력");
			frm.id.focus();
			//button으로 submit 할시에는 그냥 return
			return false;
		}
		if(frm.pw.value == ""){
			alert("pw 입력");
			frm.pw.focus();
			return false;
		}
		//if(frm.job.selectedIndex == 0)
		if(frm.job.value == ""){
			alert("직업을 선택해라");
			frm.job.focus();
			return false;
		}
		
		var gender = 
			document.querySelectorAll("[name='gender']:checked").length;
		if(gender == 0) {
			alert("성별 선택좀해봐라");
			return false;
		}
		
		// 회원가입폼 제출
		//frm.submit();
		return true;
	}
</script>
</head>
<body>
	<%@include file="../menu.jsp"%>
	<h3 class="page_title">회원등록</h3>
	<div class="regist">
		<form method="post" name="frm" id="frm" action="memberInsertProc.jsp"
			onsubmit="return inputCheck()">
			<div>
				<label for="id">Id: </label> <input type="text" id="id" name="id">
			</div>
			<div>
				<label for="pw">Password: </label> <input type="password" id="pw"
					name="pw">
			</div>
			<div>
				<label for="gender">성별</label>
				<input type="radio" id="male" name="gender" value="male"> <label
					for="male">남</label> <input type="radio" id="female" name="gender"
					value="female"> <label for="female">여</label>
			</div>

			<div>
				<label for="job">직업: </label> <select id="job" name="job">
					<option value="">선택</option>
					<option value="nojob">NoJob</option>
					<option value="developer">Developer</option>
					<option value="dba">DBA</option>
				</select>
			</div>
			<div>
				<label for="mailYn">메일수신여부</label>
				<input type="checkbox" id="mailYn" name="mailYn"> 
			</div>
			<div>
				<label for="reason">가입동기</label>
				<textarea name="reason" rows="10" cols="30"> </textarea>
			</div>
			<div>
				<!-- <button type="button" onclick="inputCheck()">등록</button>-->
				<input type="submit">
				<input type="reset" value="취소">
			</div>
		</form>
	</div>
</body>
</html>