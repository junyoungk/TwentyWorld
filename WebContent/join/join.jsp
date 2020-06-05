<%@page import="CKJY.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");  // 한글 인코딩 꼭!
%>
    <%@ page import="java.util.Enumeration"%>
 <%
	int userID = 0;
	if(session.getAttribute("userID") != null) {
		userID = Integer.parseInt(session.getAttribute("userID").toString());
	} 
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

function check() { 
	
	var id = document.form.user_id.value;
	 var pw = document.form.user_pw.value;
	 var pw2 = document.form.user_pw2.value;
	 var jumin = document.form.user_jumin.value;
	 var jumin2 = document.form.user_jumin2.value;
	 var email = document.form.user_email.value;
	 var email2 = document.form.user_email2.value;
	 var age = document.form.user_age.value;
	 var name = document.form.user_name.value;
	 var kor_check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		var eng_check = /^[A-za-z]/g;
		var num_check=/^[0-9]*$/;
		var check =  /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]/gi;
	 
	if(id==""){
		alert("아이디를 입력해주세요");
		return false;
	}
	else {
		
		
	    
		if (kor_check.test(id)){
			alert("한글은 아이디에 포함시킬수 없습니다 (영어, 숫자만)")
			document.form.user_id.focus();
			return false;
			} 	
		
		if (check.test(id)){
			alert("특수문자는 아이디에 포함시킬수 없습니다 (영어, 숫자만)")
			document.form.user_id.focus();
			return false;
			} 	
		
	}
	
	if ( pw=="" || pw2 == ""){
		alert("비밀번호를 입력해주세요.");
		return false;
	}  else {
		if(pw != pw2){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
	}
	
	if(kor_check.test(email)){
		alert("이메일에는 한글을 입력 불가능");
		return false;
	}
	
	if(check.test(email)){
		alert("이메일에는 특수문자 입력 불가능.");
		return false;
	}
	
	
	
	
	if(num_check.test(name)){
		alert("이름에는 숫자 입력 불가능");
		return false;
	}
	
	if(check.test(name)){
		alert("이름에는 특수문자 입력 불가능.");
		return false;
	}
	
	
	

	
	if(jumin.length!= 6){
		alert("앞자리는 6자리를 입력해주세요");
		return false;
	}
	
	if(jumin2.length!= 7) {
		alert("뒷자리는 7자리를 입력해주세요");
		return false;
	}
	
	if(jumin2.charAt(0) != "1" && jumin2.charAt(0) != "2" && jumin2.charAt(0) != "3" && jumin2.charAt(0) != "4"){
		alert("주민번호 뒷자리에는 (1,2,3,4) 만 입력가능합니다.");
		return false
	}
	
	if ( age== "") {
		alert("나이를 입력해주세요.");
		return false;
	} else {
		if(isNaN(age) || age < 1 || age > 130){
			alert("유효한 나이값을 입력해주세요.");
			return false;
		}
	}
	document.form.user_jumin.value = jumin + jumin2;
	 document.form.user_email.value = email + "@" + email2;
	
}
	






</script>
</head>
<body>
	<div class="wrapper">
		 <div class="header">
        <div class="container">
          <div class="row">
            <div id="myNav" class="overlay">
              <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
              <div class="overlay-content">
                <a href="#">소개 / 오시는 길</a>
                <a href="#">어트랙션</a>
                <a href="#">자유게시판</a>
                <a href="#">로그인</a>
                <a href="#">회원가입</a>
              </div>
            </div>

            <div class="d-block col-lg-2 logo text-center">
              <div class="mobile_ver d-block d-lg-none">
                <span class="mobile_btn" style="font-size:30px;cursor:pointer " onclick="openNav()"><i class="fas fa-bars"></i></span>
              </div>
              <a href="../login/testmain.jsp">
                <img src="http://adventure.lotteworld.com/common/images/logo.png" alt="logo">
              </a>
            </div>
            <div class="d-none d-lg-block col-lg-8 main_menu align-self-center">
              <ul class="nav  justify-content-center list-group list-group-horizontal">
                <li class="nav-item list-group-item dropdown">
                  <a class="nav-link active dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">소개</a>
                  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <a class="dropdown-item" href="#">소개 글 및 오시는 길</a>
                  </div>
                </li>
                <li class="nav-item list-group-item">
                  <a class="nav-link active dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">즐길 거리</a>
                  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <a class="dropdown-item" href="#">어트랙션</a>
                  </div>
                </li>
                <li class="nav-item list-group-item">
                  <a class="nav-link active dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">소통 게시판</a>
                  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <a class="dropdown-item" href="#">소통 게시판</a>
                  </div>
                </li>
              </ul>
            </div>
            <div class="d-none d-lg-block col-lg-2 text-center align-self-center">
            <h3>세션값 : <%= userID %></h3>
            <% if (userID == 0) { %>
              <a href="../login/login.jsp">로그인</a> |
              <a href="../join/join.jsp">회원가입</a>
               <% } else { %>
               <a href="mypage.jsp">마이페이지</a>
               <a href="logoutCheck.jsp">로그아웃</a>
                <% } %>
            </div>           
          </div>
        </div>
      </div>
		<div class="join container" style="min-height:700px; max-width:400px; margin-top:70px;">
			<div class="join-section">
				<form method="post" action="joinCheck.jsp" name="form" onsubmit="return check();">
					<h2 class="text-center">회원가입</h2>
					
					<label>아이디</label>
					<input  type="text" name="user_id" id="user_id">
					<button type="button" onclick="idcheck()">중복체크</button><br>
					
					<label>비밀번호</label>
					<input type="password" name="user_pw" id="user_pw"><br>
					
					<label style="display: inline !important;">비밀번호확인</label>
					<input type="text" style="border-width: 0px;" size="20" name="chk" 
						value="비밀번호를 입력하세요" readonly="readonly" class="danger1 text-right">
					<input type="password" name="user_pw2" id="user_pw2" onblur="passchk()">
					<br>
						
					<label>이름</label>
					<input type="text" name="user_name" id="user_name"><br>
					
					<label>이메일</label>
					<input type="text" name="user_email" id="user_email">@
					<select name="user_email2">
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="nate.com">nate.com</option>
						<option value="kakao.com">kakao.com</option>
						
					</select>
						
					<label>주민번호앞자리</label>
					<input type="number" name="user_jumin" id="user_jumin">-
						<label>주민번호뒷자리</label>
					<input type="number" name="user_jumin2" id="user_jumin2"><br>
					
					
						 
					
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