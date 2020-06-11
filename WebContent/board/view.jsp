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
<%
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
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
#view {
	border: 1px solid black;
	border-radius: 5px;
	padding: 20px
}
</style>
</head>
<script>
function chkDelete(uid){
	// 삭제 여부, 다시 확인 하고 진행하기
		location.href = 'deleteOk.do?uid='+uid;
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
<br><br>

<br>
<div id="view">
  <div class="card-header">
    <h2 class="text-center">${read[0].board_category } 게시판</h2>
  </div>
  <div class="card-body">
    <h3 class="card-title">${read[0].board_subject }</h3>
    <p class="card-text">
    <span class="fa-stack fa-lg">
  	<i class="far fa-circle fa-stack-2x"></i>
  	<i class="fas fa-user fa-stack-1x"></i>
	</span>&nbsp&nbsp&nbsp<b> ${read[0].writeName }</b><br><br>
         등록일 ${read[0].board_regdate } |&nbsp&nbsp조회수 ${read[0].board_viewcnt }
    <a href="#reply" class="btn btn-outline-info float-right"><i class="far fa-comment-dots"></i>&nbsp댓글보기</a></p>
  </div>
<c:if test="${fn:length(file) > 0 }">
<hr>
<h5><b>첨부파일</b></h5>
	<ul class="ml-5">
		<c:forEach var="element" items="${file }">
			<li style="list-style: circle;"><a href="fileUpload.do?uid=${element.uid }">${element.source }</a></li>
		</c:forEach>
	</ul>
</c:if>
<hr>
<div style="padding: 20px">
${fn:replace(read[0].board_content,cn,br) }
<c:if test="${fn:length(file) > 0 }">
	<ul>
		<!-- 이미지인 경우 보여주기 -->
		<c:forEach var="element" items="${file }">
			<c:if test="${element.image == true}">
				<div style="width:300px; display:inline-block">
					<img style="width:100%; height:auto; float:left; margin: 10px" src="../upload/${element.file }"/>
				</div>
			</c:if>
		</c:forEach>
	</ul>
</c:if>
</div>
<div style="clear:both"></div>
<hr>
<br>
<h5 id="reply" ><b>댓글</b></h5>
	<c:set var="user_uid" value="<%= userID %>" />
	<c:choose>
			<c:when test="${empty replyresult || fn:length(replyresult) == 0 }"></c:when>
			<c:otherwise>
			
			<c:forEach var="reply" items="${replyresult }">
			  <tbody>
			<div class="card mb-2">
			  <div class="card-header">
			    작성자 - ${reply.writeName }
			  </div>
			  <div class="card-body">
			    <h5 class="card-title">${fn:replace(reply.reply_comment,cn,br) }</h5>
			    <p class="card-text">등록일 - ${reply.reply_regdate }</p>
			    <button type="button" class="btn btn-outline-secondary btn-sm float-right" onclick="location.href='ReplydeleteOk.do?reply_id=${reply.reply_id }&reply_boarderid=${read[0].board_id }'">&times;</button>
			  </div>
			</div>
			
			</c:forEach>
			</c:otherwise> 
		</c:choose>

<form name="frm" action="ReplywriteOk.do" method="post">
<input type="hidden" name="reply_boarderid" value="${read[0].board_id }"/>
<input type="hidden" name="reply_useruid" value="<%=session.getAttribute("userID")%>"/>


<c:choose>
	<c:when test="${userID == 0 || userID == null}">
	<p>로그인 하셔야 댓글기능을 사용하실 수 있습니다</p>
	</c:when>
	<c:otherwise>
	<div class="input-group mb-3">
	  <div class="input-group-prepend">
	    <span class="input-group-text">댓글</span>
	  </div>
	  <textarea style="resize: none;" name="reply_comment" class="form-control"></textarea>
	  <div class="input-group-append">
    	<input class="btn btn-outline-secondary" type="submit" id="button-addon2" value="댓글게시"/>
  	</div>
	</div>
	</c:otherwise>
</c:choose>

</form>

<c:if test="${read[0].board_writeuid == (sessionScope.sessionName = userID) || (sessionScope.sessionName = userID) == 1 }">
	<button  class="btn btn-dark mb-3 float-right m-2" onclick="location.href='update.do?uid=${read[0].board_id }'">수정</button>
	<button  class="btn btn-dark mb-3 float-right m-2" data-toggle="modal" data-target="#exampleModal">삭제</button>
</c:if>
<div style="clear:both"></div>	
</div>
<br><br><br>
<hr>
<div class="container">
  <div class="row justify-content-center">
    <div class="col-4">
      이전글 &nbsp<i class="fas fa-arrow-up"></i>
    </div>
    <div class="col-4">
      <c:choose>
<c:when test="${prev != null }">
<a class="badge badge-light" style="font-size: 1.3em" href="view.do?uid=${prev[0].board_id }">${prev[0].board_subject }</a>
</c:when>
<c:otherwise>
<span>이전글이 없습니다!</span>
</c:otherwise>
</c:choose>
    </div>
  </div>
  <hr>
 <div class="row justify-content-center">
    <div class="col-4">
      다음글 &nbsp<i class="fas fa-arrow-down"></i>
    </div>
    <div class="col-4">
      <c:choose>
<c:when test="${next != null }">
<a class="badge badge-light" style="font-size: 1.3em" href="view.do?uid=${next[0].board_id }">${next[0].board_subject }</a>
</c:when>
<c:otherwise>
<span>다음글이 없습니다!</span>
</c:otherwise>
</c:choose>
    </div>
  </div>
</div>
<hr>

<button class="btn btn-dark" onclick="location.href = 'list.do'">목록보기</button>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">게시물 삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>정말로 글을 삭제하시겠습니까??</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" onclick="chkDelete(${read[0].board_id})">삭제</button>
      </div>
    </div>
  </div>
</div>
</div>
<%@ include file="../HF/footer.jsp" %>
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