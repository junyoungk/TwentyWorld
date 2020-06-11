<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="CKJY.UserDAO" %>
<%@ page import="board.beans.Board" %>

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
    <title>Hello, world!</title>
    <style>
    	.perform{
    width: 100%;
  }
    </style>
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
<!-- shinhoonji -->
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://adventure.lotteworld.com/image/2020/4/202004060608385980.jpg" class="d-none d-lg-block d-xl-block w-100 main-banner" alt="...">
      <img src="https://adventure.lotteworld.com/image/2020/4/202004060608386920.jpg" class="d-block d-lg-none d-xl-none w-100 main-banner" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://adventure.lotteworld.com/image/2020/5/202005290301293460.jpg" class="d-none d-lg-block d-xl-block w-100 main-banner" alt="...">
      <img src="https://adventure.lotteworld.com/image/2020/5/202005290301294240.jpg" class="d-block d-lg-none d-xl-none w-100 main-banner" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://adventure.lotteworld.com/image/2020/5/202005191032189230.jpg" class="d-none d-lg-block d-xl-block w-100 main-banner" alt="...">
      <img src="https://adventure.lotteworld.com/image/2020/5/202005191032190320.jpg" class="d-block d-lg-none d-xl-none w-100 main-banner" alt="...">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<div class="open_time">
	<div class="today text-center">
		<small class="today-date" id="todayRt_dateMsg">06월 03일(수)</small>
		<div class="today-time" id="todayRt_elStartEnd">10:00 - 21:00</div>
	</div>
</div>
<hr>
<div class="best-top container">
  <h2 class="best-text text-center">BEST TOP 3</h2>
  <div class="best-attraction">
    <div class="row">
      <div class="col-4">
          <img src="https://pds.joins.com/news/component/newsis/201808/07/NISI20180807_0014350831_web.jpg" class="card-img-top" alt="..." style="width:100%; height:100%;">
          <p class="text-center best-1">후룸라이드</p>
      </div>
      <div class="col-4">
          <img src="https://pds.joins.com/news/component/newsis/201712/06/NISI20171206_0000077751_web.jpg" class="card-img-top" alt="..." style="width:100%; height:100%;">
          <p class="text-center best-2">롤러코스터</p>
      </div>
      <div class="col-4">
        <img src="https://s3-ap-northeast-2.amazonaws.com/blog.lotte.co.kr/wp-content/uploads/2013/10/81.jpg" class="card-img-top" alt="..." style="width:100%; height:100%;">
        <p class="text-center best-3">자이로스핀</p>
      </div>
    </div>
  </div>
  <div class="look-more text-center container">
<button type="button" class=" btn btn-outline-secondary btn-lg" onclick="location.href='../attraction/attrClientListMain.jsp'">더 많은 어트랙션 즐기기</button> 
 </div>
</div>

 <div class="container" style="padding: 40px 0;">
 	<div style="padding-bottom:40px;">
	<p class="mainTit">20's World를 좀 더<br><span>특별하게 즐기고 싶다면!</span></p>
	<p class="mainTxt" >오늘 20's World의 소식을 만나보세요.</p>
	</div>
        <div class="row">
          <div class="col-xs-6 col-sm-6 col-md-6 col-lg-3">
            <a href="#">
              <img class="perform" src="https://adventure.lotteworld.com/common/images/icon/mainCon4_img1.jpg" alt="">
              <span>연간이용안내</span>
            </a>
          </div>
          <div class="col-xs-6 col-sm-6 col-md-6 col-lg-3">
            <a href="#">
              <img  class="perform" src="https://adventure.lotteworld.com/common/images/icon/mainCon4_img2.jpg" alt="">
              <span>프리미엄투어</span>
            </a>
          </div>
          <div class="col-xs-6 col-sm-6 col-md-6 col-lg-3">
            <a href="#">
              <img  class="perform" src="https://adventure.lotteworld.com/common/images/icon/mainCon4_img3.jpg" alt="">
              <span>공연참여 프로그램</span>
            </a>
          </div>
          <div class="col-xs-6 col-sm-6 col-md-6 col-lg-3">
            <a href="#">
              <img   class="perform" src="https://adventure.lotteworld.com/common/images/icon/mainCon4_img4.jpg" alt="">
              <span>단체 프로그램</span>
            </a>
          </div>
        </div>
        <div class="Infomation container">
  <div class="info row">
    <div class="info-section2 text-center col-xs-12 col-sm-12 col-md-6 col-lg-6">
      <div class="section-head news_notice">
        <h3 class="head1">NEWS AND NOTICE</h3>
      </div>
      <div class="news_notice_text container">
      <%
      UserDAO dao = new UserDAO();
      Board[] arr1 = dao.boardGonggi();
      %>
        <ul>
          <li><a href="../board/view.do?uid=<%=arr1[0].getBoard_id()%>"><span class="short-gongji"><%= arr1[0].getBoard_subject()%></span> <span><%= arr1[0].getBoard_regdate() %></span></a></li>
          <li><a href="../board/view.do?uid=<%=arr1[1].getBoard_id()%>"><span class="short-gongji"><%= arr1[1].getBoard_subject()%></span> <span><%= arr1[1].getBoard_regdate() %></span></a></li>
          <li><a href="../board/view.do?uid=<%=arr1[2].getBoard_id()%>"><span class="short-gongji"><%= arr1[2].getBoard_subject()%></span> <span><%= arr1[2].getBoard_regdate() %></span></a></li>
          <li><a href="../board/view.do?uid=<%=arr1[3].getBoard_id()%>"><span class="short-gongji"><%= arr1[3].getBoard_subject()%></span> <span><%= arr1[3].getBoard_regdate() %></span></a></li>
          <li><a href="../board/view.do?uid=<%=arr1[4].getBoard_id()%>"><span class="short-gongji"><%= arr1[4].getBoard_subject()%></span> <span><%= arr1[4].getBoard_regdate() %></span></a></li>
        </ul>
      </div>
      <button type="button" class="btn btn-light btn-sm" onclick="location.href='../board/list.do'" style="position: absolute; top: 22px; right: 22px; border: 1px solid;">더보기</button>
    </div>
    <div class="info-section text-center col-xs-12 col-sm-12 col-md-6 col-lg-6">
    	<img src="https://adventure.lotteworld.com/image/2019/12/201912060405241830.jpg" style="width: 100%; padding-top: 20px;height: 100%;"/>
    </div>
  </div>
</div>
 
      </div>
<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>

<!-- shinhoonji -->
	  <%@ include file="../HF/footer.jsp" %>
	   <script>
      function openNav() {
        document.getElementById("myNav").style.width = "60%";
      }
      function closeNav() {
        document.getElementById("myNav").style.width = "0%";
      }
      </script>
      <script> 
//Get the button
var mybutton = document.getElementById("myBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}
</script>
       <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>