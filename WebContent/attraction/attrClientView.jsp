<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="attraction.beans.*" %>
<!-- <link href="attrCSS/attrDetail.css" rel="stylesheet" type="text/css"> -->

<!-- 세션 값 받기 -->
 <%
	int userID = 0;
	if(session.getAttribute("userID") != null) {
		userID = Integer.parseInt(session.getAttribute("userID").toString());
	} 
%>
<%
	// Controller 로부터 결과 데이터 받음
	AttrWriteDTO [] arr = (AttrWriteDTO [])request.getAttribute("list");
%>
<%
	if(arr == null || arr.length == 0){ 
%>
			<script>
				alert("해당 정보가 삭제되거나 없습니다");
				history.back();
			</script>
<%
		return;   // 더이상 JSP 프로세싱 하지 않고 종료
	} // end if
%>
<%
	 int attr_id  = arr[0].getAttr_id();
	 int attr_max = arr[0].getAttr_max();
	 int attr_time =  arr[0].getAttr_time(); 
	 int attr_price =  arr[0].getAttr_price(); 
	 String attr_content =  arr[0].getAttr_content(); 
	 String attr_name =  arr[0].getAttr_name();
	 int attr_location =  arr[0].getAttr_location(); 
	 int attr_min_age =  arr[0].getAttr_min_age();
	 int attr_max_age =  arr[0].getAttr_max_age();
	 int attr_min_height =  arr[0].getAttr_min_height(); 
	 int attr_max_height =  arr[0].getAttr_max_height();
	
	 int attr_authorize =  arr[0].getAttr_authorize();
	 String attr_regDate =  arr[0].getAttr_regDate();
	 String attr_img =  arr[0].getAttr_img();
	 String attr_cardimg =  arr[0].getAttr_cardimg();
%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <!--  <meta name="description" content=""> -->
    <title>읽기 <%=attr_name %></title>
<!-- 
<link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/carousel/">
<link href="attrCSS/attr_bootboot.css" rel="stylesheet">

    Custom styles for this template
    <link href="attrCSS/carousel.css" rel="stylesheet">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"> -->
 
 <!-- shinhoonji -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link href="../login/CSS/style.css" rel="stylesheet" type="text/css">
 <!-- shinhoonji --> 
 
  <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
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
                <span class="mobile_btn" style="font-size:30px;cursor:pointer " onclick="openNav()"><i class="fas fa-bars fa-3x"></i></span>
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
<div class="container">
  <h2 class="text-center" id ="attr_name"><%=attr_name %></h2>
  
 <!-- shinhoonji -->
 <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block " src="<%=attr_cardimg %>" alt="First slide" onError="this.src='attr_img/20_black.jpg'">
    </div>
    <div class="carousel-item">
      <img class="d-block " src="<%=attr_img %>" alt="Second slide" onError="this.src='attr_img/20_black.jpg'">
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
  <!-- shinhoonji -->
  <br>
  <div id = "attr_content" style="font-size: 20px; align-items: center;"><%=attr_content %></div>
<br><br><hr><br>

  <div class="container marketing">

   
    <div class="row">
      <div class="col-lg-4 .col-md-4">
		<i class="far fa-clock fa-3x"></i>
        <h2>소요 시간</h2>
        <p> <%=attr_time %> 분<br>&nbsp;</p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4 .col-md-4">
      <i class="fas fa-users fa-3x"></i>
			<h2>탑승 최대 인원</h2>
        <p><%=attr_max %> 명<br>&nbsp;</p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4 .col-md-4">
      <i class="far fa-credit-card fa-3x"></i>
		<h2>현장 구매 가격</h2>
        <p><%=attr_price %> 원</p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-2 .col-md-2"><br><br></div> 
      <div class="col-lg-4 .col-md-4" style="height: 150px;">
      <i class="far fa-address-card fa-3x" ></i>
        <h2>사용 가능 나이</h2>
        <p><%=attr_min_age %>살~<%=attr_max_age %>살 </p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4 .col-md-4" style="height: 150px;">
        <i class="fas fa-ruler fa-3x"></i>
        <h2>사용 가능 신장</h2>
        <p style="height: 200px"><%=attr_min_height %>cm~<%=attr_max_height %>cm </p>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->
   <hr><br>
	<div id = "attr_rule" >
		<div id = "attr_rule_mini">안내사항</div>
			<p>- 안전한 어트랙션 이용을 위해서는 탑승 중 신체적 이상이 발생되지 않는
			건강상태이어야 합니다.<br>
			- 각 어트랙션에 게시된 탑승자 안전수칙 준수 및 근무자의 안내에 따라 주시기 바랍니다.<br>
			- 탑승제한규정 및 기타 안전수칙 위반 시에는 어트랙션 이용 거부 또는
			퇴장이 요구될 수 있습니다.<br></p>
	</div><br><br>
   
   <button type="button" class="btn btn-outline-secondary" onclick="location.href = 'attrClientListMain.doat'">더 많은 어트랙션 보러가기 →</button>
   </div>
	
<!--   <div style="background-image: url();"></div>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    
   --> 
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

<style>
div#attr_rule{
	width : 80%;
	height : 20%;
	border: 1px solid #ddd;
	border-radius: 5px;
	padding: 10px;
	line-height: 1.4;
	margin-left: 10%
}
div#attr_rule_mini{
	background: #e6a7a7;
    position: relative;
    top : -20px;
    left:30px;
	width : 23%;
	height : 5%;
	text-align: center;
	vertical-align: middle;
	border-radius: 3px;
	padding : 5px;
}

</style>
