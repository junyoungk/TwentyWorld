<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:choose>
	<c:when test="${empty read || fn:length(read) == 0 }">
		<script>
			alert("해당 정보가 삭제되거나 없습니다");
			history.back();
		</script>
	</c:when>
	<c:otherwise>

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
<link href="CSS/Ticketview.css" rel="stylesheet" type="text/css">
<title>읽기 ${read[0].ticket_name}</title>
<!-- title에 글제목 넣기 -->
</head>
<script>
function chkDelete(id){
	// 삭제 여부, 다시 확인 하고 진행하기
	var r = confirm("삭제하시겠습니까?");
	if(r){
		location.href = 'TicketdeleteOk.doi?id='+id;
	}
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
							<a href="../login/intro.jsp">소개 / 오시는 길</a> <a
								href="../attraction/attrClientListMain.jsp">어트랙션</a> <a
								href="../board/list.do">자유게시판</a>
							<h3>
								세션값 :
								<%=userID%></h3>
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
						<a href="../login/testmain.jsp"> <img
							src="http://adventure.lotteworld.com/common/images/logo.png"
							alt="logo">
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
									<a class="dropdown-item" href="../login/intro.jsp">소개 글 및
										오시는 길</a>
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
						<h3>
							세션값 :
							<%=userID%></h3>
						<%
							if (userID == 0) {
						%>
						<a href="../login/login.jsp">로그인</a> | <a href="../join/join.jsp">회원가입</a>
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
			</div>
		</div>
		</div>
		<div class="container">
			
		<div class="con">
			<input type="hidden" name="uid"
				value="<%=session.getAttribute("userID")%>" />
			<img id="ticketlistimg"
			src="${pageContext.request.contextPath}/upload/${read[0].ticket_img }" alt="Responsive image" />
			<br>
			<div class="input-group mb-3">
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="basic-addon1">이용권분류</span>
					  </div>
					  <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" disabled="disabled" value="No. ${read[0].ticket_id }">
					</div>
			<div class="input-group mb-3">
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="basic-addon1">이용권이름</span>
					  </div>	
					  <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" disabled="disabled" value="No. ${read[0].ticket_name }">
					</div>
			<div class="input-group mb-3">
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="basic-addon1">이용권가격</span>
					  </div>
					  <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" disabled="disabled" value="No. ${read[0].ticket_price }">
					</div>
			<div class="input-group mb-3">
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="basic-addon1">이용권파일명</span>
					  </div>
					  <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" disabled="disabled" value="No. ${read[0].ticket_img }">
					</div>

			<hr>
			<br>
			<button class="btn btn-secondary" onclick="location.href='Ticketupdate.doi?id=${read[0].ticket_id }'">수정</button>
			<button class="btn btn-secondary" onclick="chkDelete(${read[0].ticket_id })">삭제</button>

			<button class="btn btn-secondary" onclick="location.href = 'Ticketlist.doi'">목록보기</button>
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
</body>
		</html>

	</c:otherwise>
</c:choose>













