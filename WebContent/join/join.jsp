<%@page import="CKJY.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");  // 한글 인코딩 꼭!
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link href="../login/CSS/style.css" rel="stylesheet" type="text/css">
<title>Hello, world!</title>
<script>
function passchk(){
	 var pass = document.form.user_pw.value;
	 var pass2 = document.form.user_pw2.value;
	 if (pass2.length == 0 || pass2 == null) {
	  document.form.chk.value = "비밀번호를 입력하세요";
	  document.form.chk.value.style.color="red";
	  right = 0;
	 } else if (pass != pass2) {
	  document.form.chk.value = "비밀번호가 다릅니다.";
	  document.form.chk.value.style.color="red";
	  right = 0;
	 } else {   
	  document.form.chk.value = "비밀번호가 동일합니다.";
	  right = 1;
	 }
	 return;
	}
	
function idcheck(){
	 var id = document.form.user_id.value;
	 if(id.length<1 || id==null){
	  alert("중복체크할 아이디를 입력하십시오");
	  return false;
	 }
	 var url = "idCheck.jsp?id=" + id;
	 window.open(url, "get", "height = 180, width = 300");
	
	}
</script>
</head>
<body>
	<div class="wrapper">
		<%@ include file="../HF/header.jsp"%>
		<div class="join container" style="min-height:700px; max-width:400px; margin-top:70px;">
			<div class="join-section">
				<form method="post" action="joinCheck.jsp" name="form">
					<h2 class="text-center">회원가입</h2>
					
					<label>아이디</label>
					<input type="text" name="user_id" id="user_id">
					<button type="button" onclick="idcheck()">중복체크</button><br>
					
					<label>비밀번호</label>
					<input type="password" name="user_pw" id="user_pw"><br>
					
					<label style="display: inline !important;">비밀번호확인</label>
					<input type="password" style="border-width: 0px;" size="20" name="chk" 
						value="비밀번호를 입력하세요" readonly="readonly" class="danger1 text-right">
					<input type="text" name="user_pw2" id="user_pw2" onblur="passchk()">
					<br>
						
					<label>이름</label>
					<input type="text" name="user_name" id="user_name"><br>
					
					<laberl>이메일</laberl>
					<input type="email" name="user_email" id="user_email"><br> 
						
					<label>주민번호</label>
					<input type="number" name="user_jumin" id="user_jumin"><br>
					
					<label>나이</label>
					<input type="number" name="user_age" id="user_age"><br> 
					
					<label>성별은?</label>
						 <label>
						<input type="radio" name="user_gender" value="남자" checked="checked">남자
					</label> <label> <input type="radio" name="user_gender" value="여자"
						checked="checked">여자
					</label> <br>
					<input
						type="submit" value="회원가입"><br>
				</form>
			</div>
		</div>
		<%@ include file="../HF/footer.jsp"%>
		<script>
			function openNav() {
				document.getElementById("myNav").style.width = "60%";
			}

			function closeNav() {
				document.getElementById("myNav").style.width = "0%";
			}
		</script>
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
			integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
			crossorigin="anonymous"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
			integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
			crossorigin="anonymous"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
			integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
			crossorigin="anonymous"></script>
	</div>
</body>
</html>