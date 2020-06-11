<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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



<link href="../login/CSS/style.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper">
      <div class="header">
        <div class="container">
          <div class="row">
            <div id="myNav" class="overlay">
              <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
              <div class="overlay-content">
                <a href="../login/intro.jsp">20's World 소개</a>
                <a href="../login/howtocome.jsp">오시는길</a>
                <a href="../attraction/attrClientListMain.jsp">어트랙션</a>
                <a href="../board/list.do">자유게시판</a>
                 <h3>세션값 : <%= userID %></h3>
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
 					<a class="dropdown-item" href="../login/intro.jsp">20's World 소개</a>
                    <a class="dropdown-item" href="../login/howtocome.jsp">오시는 길</a>
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
<div class="intro container">
        <h2 class="intro-head text-center">20's World 소개</h2>
        <img class="intro-img" src="https://mticket.lotteworld.com/simgs/display/1210/upload/20191105dfab03136dc24dc884cbf28632589b10" alt="">
        <div class="intro-content  text-center">
          <strong>Welcome to the 20's World</strong>
          <div class="row">
            <div class="intro1-text align-self-center d-none d-lg-block d-xl-block col-lg-6">
              <h3>롯데월드 어드벤처</h3>
              <br>
              <p>날씨와 관계없이 1년 365일,</p><p> 매일 짜릿한 스릴이 넘쳐나는 모험과 신비의 나라 롯데월드!</p>
            </div>
            <div class=" d-none d-lg-block d-xl-block col-lg-6">
              <img src="https://t1.daumcdn.net/cfile/tistory/99F35E4D5D32AB6B31" alt="">
            </div>
            <div class="d-none d-lg-block d-xl-block col-lg-6">
              <img src="https://img.insight.co.kr/static/2019/12/07/700/053f202o3c2n00zay326.jpg" alt="">
            </div>
            <div class="intro2-text align-self-center d-none d-lg-block d-xl-block col-lg-6">
              <h3>국내 최초, 최대 실내테마파크</h3>
              <p>원하는 모든 것을 한 곳에서 즐길 수 있는 복합생활공간, 바로 롯데월드 입니다.</p>
            </div>
            
            <div class="flip-box d-lg-none d-xs-block d-sm-block d-md-block col-12">
			  <div class="flip-box-inner">
			    <div class="flip-box-front">
			      <img class="image1" src="https://img.insight.co.kr/static/2019/12/07/700/053f202o3c2n00zay326.jpg" alt="">
			    </div>
			    <div class="flip-box-back">
			      <h3>롯데월드 어드벤처</h3>
	              <br>
	              <p>날씨와 관계없이 1년 365일,</p><p> 매일 짜릿한 스릴이 넘쳐나는 모험과 신비의 나라 롯데월드!</p>
			    </div>
			  </div>
			</div>

			<div class="flip-box d-lg-none d-xs-block d-sm-block d-md-block col-12">
			  <div class="flip-box-inner">
			    <div class="flip-box-front">
					<img class="image2" src="https://t1.daumcdn.net/cfile/tistory/99F35E4D5D32AB6B31" alt=""> 
			    </div>
			    <div class="flip-box-back">
			      <h3>국내 최초, 최대 실내테마파크</h3>
            	  <p>원하는 모든 것을 한 곳에서 즐길 수 있는 복합생활공간, 바로 롯데월드 입니다.</p>
			    </div>
			  </div>
			</div>
            
          <!--   
            
          	<div class="intro-picture1 d-lg-none d-xs-block d-sm-block d-md-block col-12" style="padding-bottom:20px;">
          		<img class="image2" src="https://img.insight.co.kr/static/2019/12/07/700/053f202o3c2n00zay326.jpg" alt="">
          		<div class="overlay">
				   <div class="text">Hello World</div>
				</div>
          	</div>
          	<div class="intro-picture2 d-lg-none d-xs-block d-sm-block d-md-block col-12">
				<img class="image2" src="https://t1.daumcdn.net/cfile/tistory/99F35E4D5D32AB6B31" alt=""> 
				<div class="overlay">
				   <div class="text">Hello World</div>
				</div>
			</div> -->
          </div>
        </div>
        </div>
<div class="intro-bottom-image"></div>

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