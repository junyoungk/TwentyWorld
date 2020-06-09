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
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link href="../login/CSS/style.css" rel="stylesheet" type="text/css">
<title>글작성</title>
</head>

<script src="ckeditor/ckeditor.js"></script>
<!-- 이미지 파일인지 아닌지 확인, ticket 참조했어요 감사해요! -->
<script type="text/javascript"> 
function imgfileCheck2(el) { 
    if(!/\.(jpeg|jpg|png|gif|bmp)$/i.test(el.value)){ 
        alert('이미지 파일만 업로드 가능합니다.'); 
        el.value = ''; 
        el.focus(); 
    }
}
</script>

<script>
function chkSubmit(){  // 폼 검증
frm = document.forms["frm"];
	
	//폼...검증 (길다)
	var name = frm["attr_name"].value.trim();
	var content = frm["attr_content"].value.trim();
	var fileCheck1 = frm["attr_setimg"].value.trim();
	var fileCheck2 = frm["attr_setcardimg"].value.trim();
	
	var attrTime = frm["attr_time"].value.trim();
	var attrMax = frm["attr_max"].value.trim();
	var attrPrice = frm["attr_price"].value.trim();
	
	var minAge = frm["attr_min_age"].value.trim();
	var maxAge = frm["attr_max_age"].value.trim();
	var minHeight = frm["attr_min_height"].value.trim();
	var maxHeight = frm["attr_max_height"].value.trim();

	if(name == ""){	alert("이름은 반드시 입력해야 합니다!"); frm["attr_name"].focus();	return false;}
	if(content == ""){ alert("설명은 반드시 입력해야 합니다!"); frm["attr_content"].focus(); return false;}
	if(!fileCheck1){ alert("상세정보에 들어갈 파일을 첨부해 주세요"); return false; }
	if(!fileCheck2){ alert("메인 카드 이미지 파일을 첨부해 주세요"); return false; }
	
	if(attrTime == ""){ alert("소요시간은 반드시 입력해야 합니다!"); frm["attr_content"].focus(); return false;}
	if(attrMax == ""){ alert("최대탑승인원수는 반드시 입력해야 합니다!"); frm["attr_content"].focus(); return false;}
	if(attrPrice == ""){ alert("가격은 반드시 입력해야 합니다!"); frm["attr_content"].focus(); return false;}
	
	if(minAge == ""){ alert("최소나이는 반드시 입력해야 합니다!"); frm["attr_content"].focus(); return false;}
	if(maxAge == ""){ alert("최대나이는 반드시 입력해야 합니다!"); frm["attr_content"].focus(); return false;}
	if(minHeight == ""){ alert("최소키는 반드시 입력해야 합니다!"); frm["attr_content"].focus(); return false;}
	if(maxHeight == ""){ alert("최대키는 반드시 입력해야 합니다!"); frm["attr_content"].focus(); return false;}

	if(minAge < 0 || maxAge < 0 || minHeight < 0 || maxHeight < 0){
		alert("나이와 키는 0이상이여야 합니다."); return false; }
	if(minAge > maxAge){
		alert("최소나이(" + minAge + ")는 최대나이(" + maxAge + ")를 넘을 수 없습니다."); return false;}
	if(minHeight > maxHeight){
		alert("최소키(" + minHeight + ")는 최대키(" + maxHeight + ")를 넘을 수 없습니다."); return false;}
	
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
                <a href="../login/intro.jsp">소개 / 오시는 길</a>
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
<div class="container">
<h2>글작성</h2>
<%-- 글 내용이 많을수 있기 때문에 POST 방식 사용 --%>
<form name="frm" action="attrWriteOk.doat" method="post" onsubmit="return chkSubmit()" enctype="Multipart/form-data">
이름: <input type="text" name="attr_name"/><br>
내용: <input type="text" name="attr_content"/><br>
상세페이지사진: <input type="file" name="attr_setimg" id = "attr_setimg" accept="image/*" onchange="imgfileCheck2(this)"/><br>
메인사진(카드): <input type="file" name="attr_setcardimg" id = "attr_setcardimg" accept="image/*" onchange="imgfileCheck2(this)"/><br>

소요시간: <input type="number" name="attr_time"/><br>
최대탑승인원수: <input type="number" name="attr_max"/><br>
가격: <input type="number" name="attr_price"/><br>

<hr>
최소나이: <input type="number" name="attr_min_age"/>
최대나이: <input type="number" name="attr_max_age"/><br>

최소키: <input type="number" name="attr_min_height"/>
최대키: <input type="number" name="attr_max_height"/><br>
장소 : 
<select name="attr_location" >
    <option value="0">실내</option>
    <option value="1">실외</option>
</select>
<br><br>
<input type="submit" value="등록"/>
</form>
<br>
<button type="button" onclick="location.href='attrAdminListMain.doat'">목록으로</button>
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















