<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="attraction.beans.*"%>
<%
	// Controller 로부터 결과 데이터 받음
	AttrWriteDTO[] arr = (AttrWriteDTO[]) request.getAttribute("list");
%>
<%
	int userID = 0;
	if (session.getAttribute("userID") != null) {
		userID = Integer.parseInt(session.getAttribute("userID").toString());
	}
%>
<%
	if (arr == null || arr.length == 0) {
%>
<script>
				alert("해당 정보가 삭제되거나 없습니다");
				history.back();
			</script>
<%
	return; // 더이상 JSP 프로세싱 하지 않고 종료
	} // end if
%>
<%
	int attr_id = arr[0].getAttr_id();
	int attr_max = arr[0].getAttr_max();
	int attr_time = arr[0].getAttr_time();
	int attr_price = arr[0].getAttr_price();
	String attr_content = arr[0].getAttr_content();
	String attr_name = arr[0].getAttr_name();
	int attr_location = arr[0].getAttr_location();
	int attr_min_age = arr[0].getAttr_min_age();
	int attr_max_age = arr[0].getAttr_max_age();
	int attr_min_height = arr[0].getAttr_min_height();
	int attr_max_height = arr[0].getAttr_max_height();

	int attr_authorize = arr[0].getAttr_authorize();
	String attr_regDate = arr[0].getAttr_regDate();
	String attr_img = arr[0].getAttr_img();
	String attr_cardimg = arr[0].getAttr_cardimg();
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
<link href="../attraction/attrCss/attrDetail.css" rel="stylesheet"
	type="text/css">

<title>읽기 <%=attr_name%></title>
<!-- title에 글제목 넣기 -->
</head>
<script>
function chkDelete(attr_id){
	// 삭제 여부, 다시 확인 하고 진행하기
	var r = confirm("삭제하시겠습니까?");
	if(r){
		location.href = 'attrDeleteOk.doat?attr_id=' + attr_id;
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
		<div class="container">
			<h1>
				#관리자페이지#
				<%=attr_name%>
				View
			</h1>

			<div id="attr_name"><%=attr_name%></div>
			<div id="attr_img"
				style="height : 500px; width : 80%;
background-position: center center; background-size : cover;
background-image:url(<%=attr_img%>)"></div>
			<div id="attr_content"><%=attr_content%></div>
			<hr>
			<div id="attr_content_info">어트랙션 정보</div>
			<div id="attr_info">
				<div id="attr_time">
					소요시간 :
					<%=attr_time%></div>
				<div id="attr_max">
					최대탑승인원 :
					<%=attr_max%></div>
			</div>
			<div>
				가격 :
				<%=attr_price%><br> 이름 :
				<%=attr_name%><br> 위치 :
				<%=attr_location%><br> 최소나이 :
				<%=attr_min_age%><br> 최대나이 :
				<%=attr_max_age%><br> 최소 키 :
				<%=attr_min_height%><br> 최대 키 :
				<%=attr_max_height%><br> 권한 :
				<%=attr_authorize%><br> 등록날짜 :
				<%=attr_regDate%><br> 상세페이지 이미지 주소 :
				<%=attr_img%><br> 카드이미지 주소 :
				<%=attr_cardimg%><br>

			</div>

			<hr>
			<br>
			<button
				onclick="location.href='attrUpdate.doat?attr_id=<%=attr_id%>'">수정하기</button>
			<button onclick="location.href = 'attrAdminListMain.doat'">목록보기</button>
			<button onclick="chkDelete(<%=attr_id%>)">삭제하기</button>
			<button onclick="location.href = 'attrWrite.doat'">신규등록</button>
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

</body>
</html>















