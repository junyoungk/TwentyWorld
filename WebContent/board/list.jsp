<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.Enumeration"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<title>글 목록</title>
<style>
table {width: 100%;}
table, th, td {
	border: 1px solid #cccccc;
	border-collapse: collapse;
	text-align:center;
}
button{
background-color: white !important;
}
.board-list{
	margin: 30px 0 !important;
}
.board{
	min-height:600px;
}
</style>
<link rel="stylesheet" type="text/css" href="CSS/common.css"/>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$(".btnCategory").click(function(){
		location.href = "?category="+$(this).val();
	}) // p 가 클릭되면 매개변수의 함수 수행
});
</script>
<body>
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
      <div class="board container">
		<div class="board-list">
		<ul class="nav nav-pills nav-fill">
  <li class="nav-item btnCategory" value="1" >
    <a class="nav-link" href="#">전체</a>
  </li>
  <li class="nav-item btnCategory" value="2">
    <a class="nav-link" href="#">공지</a>
  </li>
  <li class="nav-item btnCategory" value="3">
    <a class="nav-link" href="#">행사</a>
  </li>
  <li class="nav-item btnCategory" value="4">
    <a class="nav-link" href="#">자유</a>
  </li>
  <li class="nav-item btnCategory" value="5">
    <a class="nav-link" href="#">기타</a>
  </li>
</ul>
		
		<table>
			<tr>
				<th>No</th>
				<th>분류</th>
				<th>작성자</th>
				<th>제목</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
		<c:set var="bid" value="${list[0].board_id }"/>
		<c:choose>
			<c:when test="${empty list || fn:length(list) == 0 }"></c:when>
			<c:otherwise>
			<c:forEach var="dto" items="${list }">
			<tr>
				<td>${dto.rownum }</td>
				<td>${dto.board_category }</td>
				<td>${dto.writeName }</td>
				<td><a href="view.do?uid=${dto.board_id }">${dto.board_subject }</a></td>
				<td>${dto.board_viewcnt }</td>
				<td>${dto.board_regdate }</td>
			</tr>		
			</c:forEach>
			
			</c:otherwise>
		</c:choose>

		</table>
		
		<jsp:include page="pagination.jsp">
		<jsp:param value="${5 }" name="writePages"/>
		<jsp:param value="${cnt }" name="totalPage"/>
		<jsp:param value="${page }" name="curPage"/>
		</jsp:include>
		<c:if test="${(sessionScope.sessionName = userID) != null}">
		<button onclick="location.href='write.do?bid=${bid+1 }'" style="padding: 1px 10px;">글쓰기</button>
		</c:if>
		<form name='frm' method='get' action='list.do' style="display: inline-block;float: right;">
      	<select name='col'> <!-- 검색 컬럼 -->
        	<option value='none' selected>작성자+제목</option>
        	<option value='name'>작성자</option>
        	<option value='subject'>제목</option>
      	</select>
      	<input type='text' name='word' value='' placeholder="특수문자 입력불가">
      	<button type='submit'>검색</buttion>    
  		</form>
		
		</div>
		</div>
		<%@ include file="../HF/footer.jsp" %>
    </div>
    
<script>
window.onpageshow = function(event) {
    if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
		location.reload();
    }

}
</script>
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















