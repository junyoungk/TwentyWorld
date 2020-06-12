<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- JSTL 버젼으로 바뀌니 import 번잡함도 사라진다. 자바변수 선언도 사라진다 -->
<%

int userID = 0;
if(session.getAttribute("userID") != null){
	userID = Integer.parseInt(session.getAttribute("userID").toString());
}
/* if(userID ==0){
	out.println("<script>");
	out.println("alert('로그인후 이용가능합니다')"); 
	out.println("location.href= '../login/testmain.jsp'");
	out.println("</script>");
} */
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link href="../login/CSS/style.css" rel="stylesheet" type="text/css">
<link href="CSS/Ticketflex.css" rel="stylesheet" type="text/css">
<title>티켓 목록</title>

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
 
					<div class="d-block col-lg-2 logo text-center">
						<div class="mobile_ver d-block d-lg-none">
							<span class="mobile_btn" style="font-size: 30px; cursor: pointer"
								onclick="openNav()"><i class="fas fa-bars"></i></span>
						</div>
						<a href="../login/testmain.jsp">
						<img src="../upload/logo3.png" alt="logo">
						</a>
					</div>
					<div class="d-none d-lg-block col-lg-8 main_menu align-self-center">
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
									<a class="dropdown-item" href="../attraction/attrClientListMain.jsp">어트랙션</a>
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
            <% if (userID == 0) { %>
              <a href="../login/login.jsp">로그인</a> |
              <a href="../join/join.jsp">회원가입</a>
               <% } else { %>
               <h4 style="font-size: 15px;"><%= userID %>님 환영합니다</h4>
               <a href="../login/mypage.jsp">마이페이지</a>
               <a href="../login/logoutCheck.jsp">로그아웃</a>
                <% } %>
					</div>
				</div>
			</div>
		</div>
		<div class="headerimg"><img src="../upload/imggg.png"/></div>
		
		<div class="container">
		
		<div>
		
		</div>
			<form id="frm" name="frm" action="TicketflexOk.doi" method="post">
				<div class="text-center">
					<c:choose>
						<c:when
							test="${empty flexTicketlist || fn:length(flexTicketlist) == 0 }">
						</c:when>
						<c:otherwise>
							<c:forEach var="dto" items="${flexTicketlist}">
						
									<div class="imagediv">
										<!-- <img src="../upload/${dto.ticket_img }" /> -->
										<!-- <th>유저</th> -->
										<%-- <td>${dto.user_uid}</td> --%>
										<img id="can" src="${pageContext.request.contextPath}/upload/${dto.ticket_img}" /><br>
										<h2>${dto.ticket_name }</h2><br>
										<h4>${dto.ticket_price } 원</h4><br> 
									<c:if test="${(sessionScope.sessionName = userID) != null}" >
									<button type="button" onclick="location.href='TicketflexOk.doi?id=${dto.ticket_id}&uid=${sessionScope.sessionName = userID }'">예매하기</button>
									<%-- <a href="TicketflexOk.doi?id=${dto.ticket_id}&uid=${sessionScope.sessionName = userID }">${dto.ticket_name}예매하기</a> --%>
									</c:if>
									</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>

				</div>
			</form>
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





   <script src="JS/flexslider.js"></script>
</body>
</html>












