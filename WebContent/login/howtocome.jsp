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
<title>여러개 마커에 이벤트 등록하기1</title>
<script   src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<script>
function mapcheck(){

	 var url = "loadmap.jsp";
	 window.open(url, "get", "height = 1500, width = 1500");
	}

</script>

<body onload="initTmap2();initTmap()">
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

<div class="container">
<div class="row">
 <div class="col-md-12 col-lg-12">
<h3 class="text-center" style="margin: 20px 0px 40px 0px">20's WORLD Adventure MAP</h3>
<div class="row">
 <div class="col-4 text-center">
 <button id="see1" style="width: 100%" type="button" class="btn btn-outline-danger">ATTRACTION</button>
 </div>
 <div class="col-4 text-center">
 <button id="see2" style="width: 100%" type="button" class="btn btn-outline-danger">REST&PHOTO</button>
  </div>
 <div class="col-4 text-center">
 <button id="see3" style="width: 100%" type="button" class="btn btn-outline-danger">FOOD</button>
 </div>
 </div>
 



<div id="map" style="width:100%;height:350px; margin: 20px 0px 50px 0px"></div>

<h3 class="text-center" style="margin: 20px 0px 50px 0px">20's WORLD WAY TO COME</h3>
</div>
</div>

<div class="row">
 <div class="col-md-12 col-lg-3">
<h5 style="font-weight: bold;">지하철 이용시</h5>
<hr>

<span style="width: 25px; height: 25px; background-color: #5ab354; border-radius: 12.5px; margin-right: 10px; font-size: 15px; line-height: 25px; color: #fff; text-align: center; display: inline-block;">2 </span>
<span style="font-size: 15px; line-height: 25px; color: #5ab354;">2호선</span> <span>잠실역 4번 출구</span> <br>
<span style="width: 25px; height: 25px; background-color: #e04582; border-radius: 12.5px; margin-right: 10px; font-size: 15px; line-height: 25px; color: #fff; text-align: center; display: inline-block; margin-top: 10px;">2 </span>
<span style="font-size: 15px; line-height: 25px; color: #e04582">8호선</span> <span>잠실역 4번 출구</span>

<hr>
</div>



 <div class="col-md-12 col-lg-6">
<h5 style="font-weight: bold;">버스 이용시</h5>
<hr>

<span style="width: 50px; height: 26px; line-height: 26px; border-radius: 15px; font-size: 15px; color: #fff; text-align: center; margin-right: 18px; background-color: #62af1e; display: inline-block;">지선 </span>
<span> 3217번, 3313번, 3314번, 3315번, 3317번, 3411번</span>
<br>
<span style="width: 50px; height: 26px; line-height: 26px; border-radius: 15px; font-size: 15px; color: #fff; text-align: center; margin-right: 18px; background-color: #d63945; display: inline-block; margin-top: 10px;">광역 </span>
<span> 1007-1번, 1100번, 1700번, 2000번, 6900번</span>
<br>
<span style="width: 50px; height: 26px; line-height: 26px; border-radius: 15px; font-size: 15px; color: #fff; text-align: center; margin-right: 18px; background-color: #366fc6; display: inline-block; margin-top: 10px;">간선 </span>
<span> 301번, 341번, 360번, 362번</span>
<br>
<span style="width: 50px; height: 26px; line-height: 26px; border-radius: 15px; font-size: 15px; color: #fff; text-align: center; margin-right: 18px; background-color: #9e7940; display: inline-block; margin-top: 10px;">공항 </span>
<span> 6000번, 6006번, 6705번, 6706A번</span>
<hr>
</div>




 <div class="col-md-12 col-lg-3 text-center">
<h5 style="font-weight: bold;">길찾기</h5>
<button onclick="mapcheck();" type="button" class="btn btn-outline-success" style="width: 50%; margin-top: 50px;">YOUR LOAD CLICK</button>

</div>



</div>
<h3 class="text-center" style="margin: 20px 0px 40px 0px">주차 안내</h3>
<div class="row">
 <div class="col-md-12 col-lg-6 text-center">
<table class="table table-bordered">
  <thead>
    <tr>
      <th scope="col" colspan="2" style="border-top: 3px solid black;" >롯데월드 이용시</th>
     
    </tr>
  </thead>
  <tbody>
    <tr style="height: 100px;">
      <td scope="row" style="vertical-align: middle;">종합이용권 구매시</td>
       <th scope="row" style="vertical-align: middle;">당일무료</th>
      
    </tr>

  </tbody>
</table>
 </div>
  
 
 <div class="col-md-12 col-lg-6 text-center">
 	<table class="table table-bordered">
  <thead>
    <tr>
      <th scope="col" colspan="2" style="border-top: 3px solid black;" >일반 주차요금</th>
     
    </tr>
  </thead>
  <tbody>
    <tr>
      <td scope="row">최초 30분</td>
       <th scope="row">1000원</th>
      
    </tr>
    
    <tr>
      <td scope="row" style="vertical-align: middle;">초과 10분마다</td>
       <th scope="row" style="vertical-align: middle;">1000원/10분</th>
      
    </tr>

  </tbody>
</table>
 </div>
 </div>

</div>


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
<script src="mapapi.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f1f49e4152a44b4f802bb60f7582283b"></script> 
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>


</body>

</html>

