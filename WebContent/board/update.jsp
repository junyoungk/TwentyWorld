<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	int userID = 0;
	if(session.getAttribute("userID") != null) {
		userID = Integer.parseInt(session.getAttribute("userID").toString());
	} 
%>
<!-- <script src="ckeditor/ckeditor.js"></script> -->
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link href="../login/CSS/style.css" rel="stylesheet" type="text/css">
<title>수정 ${selec[0].board_subject }</title>
</head>
<script>
function chkSubmit(){
	frm = document.forms['frm'];
	var subject = frm['subject'].value.trim();
	
	if(subject==""){
		alert("제목은 반드시 작성하셔야 합니다");
		frm['subject'].focus();
		return false;
	}
	
	if(subject.length >= 17){
		alert("입력가능 글자수 초과!!");
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
                <img src="../upload/logo3.png" alt="logo">
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
               <h4 style="font-size: 15px;">${sessionScope.sessionName = userID }님 환영합니다</h4>
               <a href="../login/mypage.jsp">마이페이지</a>
               <a href="../login/logoutCheck.jsp">로그아웃</a>
                <% } %>
            </div>           
          </div>
        </div>
      </div>
<div class="container">
<br>
<h2>수정</h2>
<br>
<form name = "frm" action="updateOk.do" method="post" onsubmit="return chkSubmit()"
	enctype="Multipart/form-data"> <!-- 수정 단계에서 파일 추가 가능 -->
<input type="hidden" name ="uid" value="${selec[0].board_id }">
<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text">제목</span>
  </div>
  <input type="text" aria-label="First name" class="form-control" name="subject" value="${selec[0].board_subject }">
</div>
<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text">내용</span>
  </div>
  <textarea name="content" class="form-control" style="height: 350px; resize: none">${selec[0].board_content }</textarea>
</div>
<br>

	<!-- 첨부파일 목록 (삭제대상) -->
	<c:if test="${fn:length(file) > 0 }">
		<div style="background-color: #dddddd; padding: 2px 10px; margin-bottom:5px; border: 1px solid black;">
			<h4>첨부파일 - 삭제</h4>
			<div id="delFiles"></div>
			<c:forEach var="element" items="${file }">
				<div>
					<button class="btn btn-dark btn-sm mb-2" type="button" onclick="deleteFiles(${element.uid}); $(this).parent().remove()">삭제</button>
					&nbsp&nbsp${element.source } 
				</div>
			</c:forEach>
		</div>
	</c:if>
	<script>
		function deleteFiles(fileUid){
			// 삭제할 file 의 bf_uid 값(들)을 delfile 에 담아 submmit 한다 
			$("#delFiles").append("<input type='hidden' name='delfile' value='" + fileUid + "'/>");
			
		}
	</script>
	<!-- 첨부파일 (추가) -->
	<div style="background-color: #dddddd; padding: 2px 10px; margin-bottom:5px; border: 1px solid black;">
		<h4>첨부파일 - 추가</h4>
		<button class="btn btn-dark btn-sm mb-3" type="button" id="btnAdd">추가</button>
		<div id='files'></div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
	var i = 0;
	$('#btnAdd').click(function(){
		$("#files").append("<div><input type='file' name='upfile" + i + "'/><button class='btn btn-dark btn-sm' type='button' onclick='$(this).parent().remove()'>삭제</button></div>");
		i++;
	});
	</script>
<input class="btn btn-dark float-right mt-3" type="submit" value="수정 완료"/>
</form>
<button class="btn btn-outline-success mt-3" onclick="history.back()">취소</button>
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
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    
</body>
</html>