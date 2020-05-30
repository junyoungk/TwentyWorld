<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="joinCheck.jsp">
		<h2>회원가입</h2>
		아이디<input type="text" name="user_id"><br>
		비밀번호<input type="text" name="user_pw"><br>
		이름<input type="text" name="user_name"><br>
		주민번호<input type="number" name="user_jumin"><br>		
		나이<input type="number" name="user_age"><br>
		성별
			<label>
				<input type="radio" name="user_gender" value="남자"  checked="checked">남자
			</label>
			<label>
				<input type="radio" name="user_gender" value="여자"  checked="checked">여자
			</label>
			<br>
			
		이메일<input type="email" name="user_email"><br>
		<input type="submit" value="회원가입">	 
	</form>
</body>
</html>