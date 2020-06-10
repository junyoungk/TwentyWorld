<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="attraction.beans.*"%>

<%
	// Controller 로부터 결과 데이터 받음.
	AttrWriteDTO[] arr = (AttrWriteDTO[]) request.getAttribute("list");
%>
<%
	int userID = 0;
	if (session.getAttribute("userID") != null) {
		userID = Integer.parseInt(session.getAttribute("userID").toString());
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
<link rel="stylesheet" href="attrCSS/attr_adminList.css" type="text/css">

<title>글 목록</title>
<style>
table {
	width: 100%;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

#long_sentence {
	width: 800px;
	overflow: scroll;
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
		<table class="type09">
		    <thead>
		        <th>고유번호</th>
		        <th>이름</th>
		        <th>탑승<br>최대인원</th>
		        <th>소요시간</th>
		        <th>현장 구매 <br>가격</th>
		
		        <th>장소</th>
		        <th>나이</th>
		        <th>키</th>
		    </thead>
		    <tbody>
				<%
					if (arr != null) {
						for (int i = 0; i < arr.length; i++) {
				%>
				<% 
					String attr_loca;
					if(arr[i].getAttr_location() == 0){
					    attr_loca = "실내";
					}else{
					    attr_loca = "실외";
					} %>
					        <tr>
					            <th scope="row"><%=arr[i].getAttr_id()%></th>
					            <td style="width : 600px"><a href="attrAdminView.doat?attr_id=<%=arr[i].getAttr_id()%>">
					                <%=arr[i].getAttr_name()%></a></td>
					            <td><%=arr[i].getAttr_max()%>명</td>
					            <td><%=arr[i].getAttr_time()%>분</td>
					            <td><%=arr[i].getAttr_price()%>원</td>
					
					            <td><%=attr_loca %></td>
					            <td style="width : 400px"><%=arr[i].getAttr_min_age()%>살 ~ <%=arr[i].getAttr_max_age()%>살</td>
					            <td style="width : 500px"><%=arr[i].getAttr_min_height()%>cm ~ <%=arr[i].getAttr_max_height()%>cm</td>
					        </tr>
				<%
					} // end for
					} // end if
				%>

			        </tbody>
			</table>
			<br>
			<button onclick="location.href='attrWrite.doat'" class = "myButton">신규등록</button>
			<button onclick="location.href='attrClientListMain.doat'"  class = "myButton">클라이언트페이지로
				이동(테스트용)</button>
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















