<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- JSTL 버젼으로 바뀌니 import 번잡함도 사라진다. 자바변수 선언도 사라진다 -->
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
<link href="CSS/Ticketlist.css" rel="stylesheet" type="text/css">
<link href="../login/CSS/style.css" rel="stylesheet" type="text/css">
<title>티켓 목록</title>

</head>
<%
	int userID = 0;
	if (session.getAttribute("userID") != null) {
		userID = Integer.parseInt(session.getAttribute("userID").toString());
	}
	if (userID != 1) {
		out.println("<script>");
		out.println("alert('관리자 페이지입니다')");
		out.println("location.href= '../login/testmain.jsp'");
		out.println("</script>");
	}
%>

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
							<%
								if (userID == 0) {
							%>
							<a href="../login/login.jsp">로그인</a> <a href="../join/join.jsp">회원가입</a>
							<%
								} else {
							%>
							<a href="../login/mypage.jsp">마이페이지</a> <a
								href="../login/logoutCheck.jsp">로그아웃</a>
							<%
								}
							%>
						</div>
					</div>
					<div class="d-block col-lg-1 logo text-center">
						<div class="mobile_ver d-block d-lg-none">
							<span class="mobile_btn" style="font-size: 30px; cursor: pointer"
								onclick="openNav()"><i class="fas fa-bars"></i></span>
						</div>
						<a href="../login/testmain.jsp"> 			
						<img src="../upload/logo3.png" alt="logo">
						</a>
					</div>
					<div class="d-none d-lg-block col-lg-9 main_menu align-self-center">
						<ul
							class="nav  justify-content-center list-group list-group-horizontal">
							<li class="nav-item list-group-item dropdown"><a
								class="nav-link active dropdown-toggle" href="#" role="button"
								id="dropdownMenuLink" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">소개</a>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
									<a class="dropdown-item" href="../login/intro.jsp">20's World 소개</a>
                     <a class="dropdown-item" href="../login/howtocome.jsp">오시는 길</a>
								</div></li>
							<li class="nav-item list-group-item"><a
								class="nav-link active dropdown-toggle" href="#" role="button"
								id="dropdownMenuLink" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">즐길 거리</a>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
									<a class="dropdown-item"
										href="../attraction/attrClientListMain.jsp">어트랙션</a>
								</div></li>
							<li class="nav-item list-group-item"><a
								class="nav-link active" href="../Ticket/Ticketflex.doi"
								role="button">예매 하기</a></li>
							<li class="nav-item list-group-item"><a
								class="nav-link active dropdown-toggle" href="#" role="button"
								id="dropdownMenuLink" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">소통 게시판</a>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
									<a class="dropdown-item" href="../board/list.do">소통 게시판</a>
								</div></li>
						</ul>
					</div>
					<div
						class="d-none d-lg-block col-lg-2 text-center align-self-center">
			
						<%
							if (userID == 0) {
						%>
						<a href="../login/login.jsp">로그인</a> | <a href="../join/join.jsp">회원가입</a>
						<%
							} else {
						%>
						 <h4 style="font-size: 15px;"><%= userID %>님 환영합니다</h4>
						<a href="../login/mypage.jsp">마이페이지</a> <a
							href="../login/logoutCheck.jsp">로그아웃</a>
						<%
							}
						%>
					</div>
				</div>
			</div>
		</div>

		<div>
		<h1 class="headertext">이용권 등록</h1>
		</div>
		<div class="container">
			<input type="hidden" name="uid"
				value="<%=session.getAttribute("userID")%>" />





			<div class="sun text-center">

				<c:choose>
					<c:when test="${empty list || fn:length(list) == 0 }"></c:when>
					<c:otherwise>
						<c:forEach var="dto" items="${list}">
							<div class="listdiv">
								No . ${dto.ticket_id }<br>
								<!-- <img src="../upload/${dto.ticket_img }" />-->
								<img id="ticketlistimg" src="${pageContext.request.contextPath}/upload/${dto.ticket_img }" class="img-fluid"  /><br>
								  <h2>${dto.ticket_name }</h2><br> 
									<h4>가격  ${dto.ticket_price }</h4><br>
								<button type="button" onclick="location.href='Ticketview.doi?id=${dto.ticket_id}'" ><h5>수정</h5></button>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="yab">
			<button  id="ya" onclick="location.href='Ticketwrite.doi'"><h4>추가</h4></button>
			</div>
	
		</div>
		<%@ include file="../HF/footer.jsp"%>
		</div>
		<script>
			function openNav() {
				document.getElementById("myNav").style.width = "60%";
			}
			function closeNav() {
				document.getElementById("myNav").style.width = "0%";
			}
		</script>
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
</body>
</html>













