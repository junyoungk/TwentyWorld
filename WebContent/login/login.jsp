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
	<form method="post" action="loginCheck.jsp">
		아이디<input type="text" name="user_id"><br>
		비밀번호<input type="text" name="user_pw"><br>
		<input type="submit" value="로그인"> <br>
		
		
	</form>
	
	<hr>
	
	<form method="post" action="idfindCheck.jsp"></form>
	이름<input type="text" name="user_name"><br>
	주민번호<input type="text" name="user_jumin"><br>
		<input type="submit" value="찾기"> <br>
		
	<hr>
	
	<form method="post" action="idfindCheck.jsp"></form>
	이름<input type="text" name="user_name"><br>
	아이디<input type="text" name="user_id"><br>
	주민번호<input type="text" name="user_jumin"><br>
		<input type="submit" value="찾기"> <br>	
	
	
</body>
</html>	