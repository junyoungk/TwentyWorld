<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link href="CSS/style.css" rel="stylesheet" type="text/css">
    <title>Hello, world!</title>
</head>
<body>
<div class="wrapper">
      <%@ include file="../HF/header.jsp" %>
      <div class="login container" style="min-height:700px; max-width:400px;">
	<div class="login-section">
		<h3 class="text-center">LOGIN</h3>
		<form method="post" action="loginCheck.jsp">
			Your ID *<input type="text" name="user_id" id="login_id" placeholder="아이디를 입력해주세요"><br>
			Your PW *<input type="text" name="user_pw" id="login_pw" placeholder="비밀번호를 입력해주세요"><br>
			<input class="login_submit" type="submit" value="로그인"> <br>
		</form>
	</div>
	</div>
	<!-- <hr>
	 
	<form method="post" action="idfind.jsp">
	이름<input type="text" name="user_name"><br>
	주민번호<input type="text" name="user_jumin"><br>
		<input type="submit" value="찾기"> <br>
	</form>	
	<hr>
	
	<form method="post" action="pwfind.jsp">
	이름<input type="text" name="user_name"><br>
	아이디<input type="text" name="user_id"><br>
	주민번호<input type="text" name="user_jumin"><br>
		<input type="submit" value="찾기"> <br>	
	</form>
	 -->
	<%@ include file="../HF/footer.jsp" %>
    </div>
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
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>	