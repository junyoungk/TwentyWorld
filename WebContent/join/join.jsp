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
<title>Insert title here</title>
<script>
function passchk(){
	 var pass = document.form.user_pw.value;
	 var pass2 = document.form.user_pw2.value;
	 if (pass2.length == 0 || pass2 == null) {
	  document.form.chk.value = "비밀번호를 입력하세요";
	  right = 0;
	 } else if (pass != pass2) {
	  document.form.chk.value = "비밀번호가 다릅니다.";
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
<form method="post" action="joinCheck.jsp" name="form">
	
		<h2>회원가입</h2>
		아이디<input type="text" name="user_id"> 
	<button type="button"  onclick="idcheck()">중복체크</button><br><br>
		비밀번호<input type="text" name="user_pw"><br>
		비밀번호확인<input type="text" name="user_pw2" onblur="passchk()">
		<input type="text" style="border-width: 0px" size="20" name="chk" value="비밀번호를 입력하세요" readonly="readonly" class="danger1"> <br>
		이름<input type="text" name="user_name"><br>
		주민번호<input type="number" name="user_jumin"><br>		
		나이<input type="number" name="user_age"><br>
		성별은?
			<label>
				<input type="radio" name="user_gender" value="남자"  checked="checked">남자
			</label>
			<label>
				<input type="radio" name="user_gender" value="여자"  checked="checked">여자
			</label>
			<br>
			<h3>아2</h3>
			
		이메일<input type="email" name="user_email"><br>
		<input type="submit" value="회원가입">	 
	</form>
</body>
</html>