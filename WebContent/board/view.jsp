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
<c:choose>
	<c:when test="${empty read || fn:length(read) == 0 }">
		<script>
			alert("해당 정보가 삭제되거나 없습니다");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link href="../login/CSS/style.css" rel="stylesheet" type="text/css">
<title>읽기 ${read[0].board_subject }</title> <!-- title에 글제목 넣기 -->
<style>

</style>
</head>
<script>
function chkDelete(uid){
	// 삭제 여부, 다시 확인 하고 진행하기
	var r = confirm("삭제하시겠습니까?");
	if(r){
		location.href = 'deleteOk.do?uid='+uid;
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
               <a href="#">소개 / 오시는 길</a>
                <a href="#">어트랙션</a>
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

            <div class="d-block col-lg-2 logo text-center">
              <div class="mobile_ver d-block d-lg-none">
                <span class="mobile_btn" style="font-size:30px;cursor:pointer " onclick="openNav()"><i class="fas fa-bars"></i></span>
              </div>
              <a href="../login/testmain.jsp">
                <img src="http://adventure.lotteworld.com/common/images/logo.png" alt="logo">
              </a>
            </div>
            <div class="d-none d-lg-block col-lg-8 main_menu align-self-center">
              <ul class="nav  justify-content-center list-group list-group-horizontal">
                <li class="nav-item list-group-item dropdown">
                  <a class="nav-link active dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">소개</a>
                  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <a class="dropdown-item" href="#">소개 글 및 오시는 길</a>
                  </div>
                </li>
                <li class="nav-item list-group-item">
                  <a class="nav-link active dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">즐길 거리</a>
                  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <a class="dropdown-item" href="#">어트랙션</a>
                  </div>
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
<h2>읽기 ${read[0].board_subject }</h2>
<br>
작성자 : ${read[0].writeName }<br>
제목 : ${read[0].board_subject }<br>
등록일 : ${read[0].board_regdate }<br>
조회수 : ${read[0].board_viewcnt }<br>
내용: <br>
<hr>
<div>
${read[0].board_content }
</div>
<hr>
<c:if test="${fn:length(file) > 0 }">
	<h4>첨부파일</h4>
	<ul>
		<c:forEach var="element" items="${file }">
			<li><a href="fileUpload.do?uid=${element.uid }">${element.source }</a></li>
		</c:forEach>
		
		<!-- 이미지인 경우 보여주기 -->
		<c:forEach var="element" items="${file }">
			<c:if test="${element.image == true}">
				<div style="width:300px">
					<img style="width:100%; height:auto" src="../upload/${element.file }"/>
				</div>
			</c:if>
		</c:forEach>
	</ul>
</c:if>
  <h3>세션값 : ${userID }</h3>

	<c:set var="user_uid" value="<%= userID %>" />
	<c:choose>
			<c:when test="${empty replyresult || fn:length(replyresult) == 0 }"></c:when>
			<c:otherwise>
			<c:forEach var="reply" items="${replyresult }">
			<div>
			
				${reply.reply_id } |
				${reply.writeName } |
				${reply.reply_useruid } |
				${reply.reply_comment } |
				${reply.reply_regdate }
				<c:choose>
					<c:when test="${user_uid == reply.reply_useruid || user_uid == 1}">
					<button type="button" onclick="location.href='ReplydeleteOk.do?reply_id=${reply.reply_id }&reply_boarderid=${read[0].board_id }'">삭제</button>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>	
			</div>	
			</c:forEach>
			</c:otherwise>
		</c:choose>

<form name="frm" action="ReplywriteOk.do" method="post">
<input type="hidden" name="reply_boarderid" value="${read[0].board_id }"/>
<input type="hidden" name="reply_useruid" value="<%=session.getAttribute("userID")%>"/>


<c:choose>
	<c:when test="${userID == 0 || userID == null}">
	<p>댓글 달고 싶으면 로그인 하고오셈</p>
	</c:when>
	<c:otherwise>
	<textarea name="reply_comment"></textarea>
	<input type="submit" value="댓글게시"/>
	</c:otherwise>
</c:choose>





</form>

<c:if test="${read[0].board_writeuid == (sessionScope.sessionName = userID) || (sessionScope.sessionName = userID) == 1 }">
	<button onclick="location.href='update.do?uid=${read[0].board_id }'">수정</button>
	<button onclick="chkDelete(${read[0].board_id })">삭제</button>
</c:if>

<hr>
<c:choose>
<c:when test="${prev != null }">
<span>이전글</span><a href="view.do?uid=${prev[0].board_id }">${prev[0].board_subject }</a>
</c:when>
<c:otherwise>
<span>이전글이 없습니다!</span>
</c:otherwise>
</c:choose>
<hr>
<span>다음글</span>
<c:choose>
<c:when test="${next != null }">
<a href="view.do?uid=${next[0].board_id }">${next[0].board_subject }</a>
</c:when>
<c:otherwise>
<span>다음글이 없습니다!</span>
</c:otherwise>
</c:choose>
<br>

<button onclick="location.href = 'list.do'">목록보기</button>
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

	</c:otherwise>
</c:choose>