<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="attraction.beans.*" %>
<link href="attrCSS/attrDetail.css" rel="stylesheet" type="text/css">

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
    <meta name="description" content="">
    <title>읽기 <%=attr_name %></title>

<link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/carousel/">
    <!-- Bootstrap core CSS -->
<link href="attrCSS/attr_bootboot.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

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
    <!-- Custom styles for this template -->
    <link href="attrCSS/carousel.css" rel="stylesheet">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
  </head>
  <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  <body style="width: 80%; margin-left: 10%">

<main role="main">
  <h2 id ="attr_name"><%=attr_name %><h2>
    <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
    </ol>
    <div class="carousel-inner" >
      <div class="carousel-item active">
      <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" 
      preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><img src="<%=attr_cardimg %>" ></svg>
        <div class="container">
          <div class="carousel-caption text-left">
            <h1></h1>
          </div>
        </div>
      </div>
      <div class="carousel-item">
      <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" 
      preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><img src="<%=attr_img %>" ></svg>
        <div class="container">
          <div class="carousel-caption text-left">
            <h1></h1>
          </div>
        </div>
      </div>
      
    </div>
    <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>

  <div id = "attr_content" style="font-size: 25px; align-items: center"><%=attr_content %></div>
<br><br><hr><br>

  <div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row">
      <div class="col-lg-4 .col-md-4">
		<i class="far fa-clock"></i>
        <h2>소요 시간</h2>
        <p> <%=attr_time %> 분<br>&nbsp;</p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4 .col-md-4">
      <i class="fas fa-users"></i>
			<h2>탑승 최대 인원</h2>
        <p><%=attr_max %> 명<br>&nbsp;</p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4 .col-md-4">
      <i class="far fa-credit-card"></i>
			</svg>        
		<h2>현장 구매 가격</h2>
        <p><%=attr_price %> 원</p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-2 .col-md-2" style = "height: 150px;"><br><br></div> 
      <div class="col-lg-4 .col-md-4" style = "height: 150px;">
      <i class="far fa-address-card"></i>
        <h2>사용 가능 나이</h2>
        <p><%=attr_min_age %>살~<%=attr_max_age %>살 </p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4 .col-md-4" style = "height: 150px;">
        <i class="fas fa-ruler"></i>
        <h2>사용 가능 신장</h2>
        <p style="height: 200px"><%=attr_min_height %>cm~<%=attr_max_height %>cm </p>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->
   <hr><br>
		   <div id = "attr_rule" >
		<div id = "attr_rule_mini">안내 사항</div>
		<p>- 안전한 어트랙션 이용을 위해서는 탑승 중 신체적 이상이 발생되지 않는
		건강상태이어야 합니다.<br>
		- 각 어트랙션에 게시된 탑승자 안전수칙 준수 및 근무자의 안내에 따라 주시기 바랍니다.<br>
		- 탑승제한규정 및 기타 안전수칙 위반 시에는 어트랙션 이용 거부 또는
		퇴장이 요구될 수 있습니다.<br></p>
		</div>
		<br><br>
    <div id="attr_back_menu"><a id="attr_menuback" class = "button button-3"
      onclick="location.href = 'attrClientListMain.doat'">더 많은 어트랙션 보러가기 →</a></div>
  

  </main>

  <div style="background-image: url();"></div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    
    </body>
</html>




