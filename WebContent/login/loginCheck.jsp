<%@page import="CKJY.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8"); // 한글 인코딩 꼭!
%>
<jsp:useBean id="dto" class="CKJY.UserDTO" scope="page" />
<jsp:setProperty property="user_id" name="dto" />
<jsp:setProperty property="user_pw" name="dto" />




<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<title>20's WORLD 로그인체크</title>
</head>
<body>


	<%
		int userID = 0;
		if (session.getAttribute("userID") != null) {
			userID = Integer.parseInt(session.getAttribute("userID").toString());
		}
		if (userID != 0) {
			out.println("<script>");
			out.println("alert('로그인 상태')");
			out.println("location.href= 'testmain.jsp'");
			out.println("</script>");
		}
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(dto.getUser_id(), dto.getUser_pw());

		if (result == 1) {
			int uid = userDAO.checkuid(dto.getUser_id());
			String a = userDAO.checkname(dto.getUser_id());
			session.setAttribute("userID", uid);
			session.setAttribute("userName", a);
	%>

	<div id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그인 알림</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close" onclick="back()">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">환영합니다 로그인 성공하셨습니다.</div>

			</div>
		</div>
	</div>
	<script>
		function back() {
			location.href = 'testmain.jsp'
		}
	</script>
	<%
		} else if (result == 0) {
	%>
	<div id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">비밀번호 오류</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close" onclick="back2()">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">비밀번호를 다시 입력해주세요</div>

			</div>
		</div>
	</div>


	<%
		} else if (result == -1) {
	%>
	<div id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">아이디 오류</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close" onclick="back2()">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">아이디가 존재하지 않습니다.</div>

			</div>
		</div>
	</div>
	<%
		}
	%>

	<script>
		function back2() {
			history.back();
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