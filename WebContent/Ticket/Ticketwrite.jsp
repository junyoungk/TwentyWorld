<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<link href="CSS/Ticketwrite.css" rel="stylesheet" type="text/css">
<link href="../login/CSS/style.css" rel="stylesheet" type="text/css">
<title>티켓작성</title>


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


<script type="text/javascript">
	function fileCheck(el) {

		if (!/\.(jpeg|jpg|png|gif|bmp)$/i.test(el.value)) {

			alert('이미지 파일만 업로드 가능합니다.');

			el.value = '';

			el.focus();

		}

	}
</script>



<script>
	function chkSubmit() {
		frm = document.forms['frm'];
		var idd = frm['ticket_id'].value.trim();
		var named = frm['name'].value.trim();
		var priced = frm['price'].value.trim();
		var img = frm['img'].value.trim();
		/* var ticketfile = document.getElementById("img").value.trim(); */

		if (idd == "") {
			alert("티켓분류은 반드시 작성하셔야 합니다 \n ex)1.자유이용권  2.입장권 3.빅3");
			frm['ticket_id'].focus();
			return false;
		}
		if (named == "") {
			alert("이용권 이름은 반드시 작성하셔야합니다");
			frm['name'].focus();
			return false;
		}
		if (priced == "") {
			alert("이용권 가격은 반드시 자겅하셔야합니다.");
			frm['price'].focus();
			return false;
		}
		if (!img) {
			alert("파일을 첨부해 주세요");
			return false;
		}
		return true;
	}
</script>

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
						 <img src="../upload/logo3.png" >
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
		<div class="container">
			<%-- 글 내용이 많을수 있기 때문에 POST 방식 사용 --%>
			<div class="row">
				<div class="imgbox col-lg-6">
					<img src="../upload/ticketwrite.jpg">
				</div>
				<div class="form-wrap col-lg-6">
					<form id="frm" class="input-group" name="frm"
						action="TicketwriteOk.doi" method="post"
						onsubmit="return chkSubmit()" enctype="Multipart/form-data">
						<input type="hidden" name="uid" value="<%=session.getAttribute("userID")%>" />
						이용권분류 <input type="number" class="input-field" name="ticket_id" /><br>
						이용권이름 <input type="text" class="input-field" name="name" /><br>
						이용권 가격 <input type="text" class="input-field" name="price" value="${select[0].ticket_price }"><br>
						티켓이미지 <input type="file" class="input-field" name="img" id="img" accept="image/*" onchange="fileCheck(this)"><br>
							<input class="btn" type="submit"  value="추가" />
						<button class="btn" type="button"onclick="location.href='Ticketlist.doi'">목록으로</button>
					</form>
				</div>
		

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