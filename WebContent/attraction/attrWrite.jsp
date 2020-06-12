<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<%
	String userName = "";
	if(session.getAttribute("userName") != null) {
		userName = session.getAttribute("userName").toString();
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
<title>20's 어트랙션 등록</title>
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
	var attr_location = frm["attr_location"].value.trim();
	
	var minAge = frm["attr_min_age"].value.trim();
	var maxAge = frm["attr_max_age"].value.trim();
	var minHeight = frm["attr_min_height"].value.trim();
	var maxHeight = frm["attr_max_height"].value.trim();

	if(name == ""){	alert("이름은 반드시 입력해야 합니다!"); frm["attr_name"].focus();	return false;}
	if(content == ""){ alert("설명은 반드시 입력해야 합니다!"); frm["attr_content"].focus(); return false;}
	if(!fileCheck1){ alert("상세정보에 들어갈 파일을 첨부해 주세요"); return false; }
	if(!fileCheck2){ alert("메인 카드 이미지 파일을 첨부해 주세요"); return false; }
	
	if(attr_location == 2222){ alert("장소를 반드시 선택해야 합니다!"); frm["attr_location"].focus(); return false;}
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
                <a href="../login/intro.jsp">20's World 소개</a>
                <a href="../login/howtocome.jsp">오시는길</a>
                <a href="../attraction/attrClientListMain.jsp">어트랙션</a>
                <a href="../board/list.do">소통게시판</a>
            <% if (userID == 0) { %>
              <a href="../login/login.jsp">로그인</a> 
              <a href="../join/join.jsp">회원가입</a>
               <% } else { %>
               <a href="../login/mypage.jsp" >마이페이지</a>
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
               <h4 style="font-size: 15px;"><%= userName %>님 환영합니다</h4>
               <a href="../login/mypage.jsp" style="font-size:12px;">마이페이지</a> |
               <a href="../login/logoutCheck.jsp" style="font-size:12px;">로그아웃</a>
                <% } %>
            </div>           
          </div>
        </div>
      </div>
<div class="container" style="width: 485px;">
<h2 style="text-align:center; padding: 25px;">어트랙션 신규 등록</h2>
<%-- 글 내용이 많을수 있기 때문에 POST 방식 사용 --%>
<form name="frm" action="attrWriteOk.doat" method="post" onsubmit="return chkSubmit()" enctype="Multipart/form-data">
<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default">기구 이름</span>
  </div>
  <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" name="attr_name">
</div>

<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default">기구 내용</span>
  </div>
  <textarea type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" name="attr_content"
  style="overflow-x:hidden; overflow-y:auto;"></textarea>
</div>




<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default">기구 상세사진</span>
  </div>
  <input type="file" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" name="attr_setimg" id = "attr_setimg" accept="image/*" onchange="imgfileCheck2(this)">
</div>

<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default">기구 썸네일</span>
  </div>
  <input type="file" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" name="attr_setcardimg" id = "attr_setcardimg" accept="image/*" onchange="imgfileCheck2(this)">
</div>

<div class="input-group mb-3">
  <div class="input-group-prepend">
    <label class="input-group-text" for="inputGroupSelect01">장소</label>
  </div>
  <select class="custom-select" id="inputGroupSelect01" name="attr_location" >
    <option value="2222">Choose...</option>
    <option value="0">실내</option>
    <option value="1">실외</option>
  </select>
</div>

<hr>

<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default">소요시간</span>
  </div>
  <input type="number" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" name="attr_time">
</div>

<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default">탑승최대인원</span>
  </div>
  <input type="number" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" name="attr_max">
</div>

<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default">현장예매가격</span>
  </div>
  <input type="number" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" name="attr_price">
</div>

<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default">최소나이</span>
  </div>
  <input type="number" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" name="attr_min_age">
</div>

<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default">최대나이</span>
  </div>
  <input type="number" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" name="attr_max_age">
</div>

<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default">최소키</span>
  </div>
  <input type="number" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" name="attr_min_height">
</div>

<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default">최대키</span>
  </div>
  <input type="number" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" name="attr_max_height">
</div>

<button type="submit"  value="등록" class="btn btn-secondary btn-lg btn-block" style="margin-bottom:20px;">등록</button>
</form>
<button type="button" class="btn btn-secondary btn-lg btn-block" onclick="location.href='attrAdminListMain.doat'">목록으로</button>


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















