<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link href="CSS/style.css" rel="stylesheet" type="text/css">
    <title>Hello, world!</title>
    
     <script>
	window.onpageshow = function(event) {
    if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
    
      location.reload();
    }
}
</script>
    
</head>
<body>
<% if(userID != 0 ){
	out.println("<script>");
	out.println("alert('이미 로그인 상태입니다. 메인페이지로갑니다.')");
	out.println("location.href= 'testmain.jsp'");
    
	out.println("</script>");
}
	
%>


<div class="wrapper">
      <div class="header">
        <div class="container">
          <div class="row">
            <div id="myNav" class="overlay">
              <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
              <div class="overlay-content">
                <a href="../login/intro.jsp">소개 / 오시는 길</a>
                <a href="../attraction/attrClientListMain.jsp">어트랙션</a>
                <a href="../board/list.do">자유게시판</a>
            <% if (userID == 0) { %>
              <a href="../login/login.jsp">로그인</a> 
              <a href="../join/join.jsp">회원가입</a>
               <% } else { %>
               <a href="../login/mypage.jsp">마이페이지</a>
               <a href="../login/logoutCheck.jsp">로그아웃</a>
                <% } %>
              </div>
            </div>

            <div class="d-block col-lg-1 logo text-center">
              <div class="mobile_ver d-block d-lg-none">
                <span class="mobile_btn" style="font-size:30px;cursor:pointer " onclick="openNav()"><i class="fas fa-bars"></i></span>
              </div>
              <a href="../login/testmain.jsp">
                <img src="http://adventure.lotteworld.com/common/images/logo.png" alt="logo">
              </a>
            </div>
            <div class="d-none d-lg-block col-lg-9 main_menu align-self-center">
              <ul class="nav  justify-content-center list-group list-group-horizontal">
                <li class="nav-item list-group-item dropdown">
                  <a class="nav-link active dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">소개</a>
                  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <a class="dropdown-item" href="../login/intro.jsp">소개 글 및 오시는 길</a>
                  </div>
                </li>
                <li class="nav-item list-group-item">
                  <a class="nav-link active dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">즐길 거리</a>
                  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <a class="dropdown-item" href="../attraction/attrClientListMain.jsp">어트랙션</a>
                  </div>
                </li>
                <li class="nav-item list-group-item">
                  <a class="nav-link active" href="../Ticket/Ticketflex.doi" role="button">예매 하기</a>
                </li>
                <li class="nav-item list-group-item">
                  <a class="nav-link active dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">소통 게시판</a>
                  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <a class="dropdown-item" href="../board/list.do">소통 게시판</a>
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
               <a href="../login/mypage.jsp">마이페이지</a>
               <a href="../login/logoutCheck.jsp">로그아웃</a>
                <% } %>
            </div>           
          </div>
        </div>
      </div>

		<div class="login container"
			style="min-height: 700px; max-width: 400px;">
			<div class="loginuser-section">
			 <div class="text-center"><img src="logo4.jpg" alt="logo" width="200px" height="150px"></div>
				<h3 class="text-center">LOGIN</h3>
				<form method="post" action="loginCheck.jsp" name="form"
					onsubmit="return validateForm()">
					<label id="login_label">Your ID *</label> 
					<input type="text" name="user_id" id="login_id" placeholder="아이디를 입력해주세요">
					<br> 
					<label id="login_label">Your PW *</label>
					 <input type="password" name="user_pw" id="login_pw" placeholder="비밀번호를 입력해주세요">
					 <br> 
					 <input class="login_submit" type="submit" value="로그인">
				</form>
				<hr>
				
				
				
				
			</div>
			
			<div class="accordion" id="accordionExample">
  <div class="card">
    <div class="card-header" id="headingOne">
      <h2 class="mb-0">
        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
         	아이디찾기
        </button>
      </h2>
    </div>

    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
      <div class="card-body">
      	<form method="post" action="idfind.jsp" style="text-align: center;">
					<label style="width:80px;text-align:left;">이름</label> <input type="text" id="find_user_name" name="user_name" placeholder="이름을 입력하세요"><br>
					<label style="width:80px;text-align:left;">주민번호</label> <input type="text" id="find_user_jumin" name="user_jumin" placeholder="주민번호를 입력하세요"><br>
					<input class="find_id_submit" type="submit" value="찾기"> <br>
				</form>
      
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingTwo">
      <h2 class="mb-0">
        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          비밀번호 찾기
        </button>
      </h2>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
      <div class="card-body">
				<form method="post" action="pwfind.jsp" class="text-center">
					<label style="width:80px;text-align:left;">이름</label> 
					<input type="text" id="find_user_name" name="user_name" placeholder="이름을 입력하세요"><br>
					<label style="width:80px;text-align:left;">아이디</label> 
					<input type="text" id="find_user_id" name="user_id" placeholder="아이디를  입력하세요"><br>
					<label style="width:80px;text-align:left;">주민번호</label> 
					<input type="text" id="find_user_jumin" name="user_jumin" placeholder="주민번호를 입력하세요"><br>
					<input class="find_pw_submit" type="submit" value="찾기"> <br>
				</form>      </div>
    </div>
  </div>
  </div>
			
		</div>
		<hr>
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