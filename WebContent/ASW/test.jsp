<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>   
<%@ page import = "java.text.SimpleDateFormat" %>
<%!
	// JDBC 관련 기본 객체변수
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;   // SELECT 결과, executeQuery() 
	int cnt = 0;   // DML 결과, executeUpdate()
	
	// Connection 에 필요한 값 세팅
	final String DRIVER = "oracle.jdbc.driver.OracleDriver";  // JDBC 드라이버 클래스
	final String URL = "jdbc:oracle:thin:@localhost:1521:XE";  // DB 접속 URL
	final String USERID = "scott0316";  // DB 접속 계정 정보
	final String USERPW = "tiger0316";
%>

<%!
	// 쿼리문 준비
	final String SQL_WRITE_SELECT = 
		"SELECT * FROM attraction ORDER BY attr_id DESC"; 
%>
<%
	try{
		Class.forName(DRIVER);
		out.println("드라이버 로딩 성공" + "<br>");
		conn = DriverManager.getConnection(URL, USERID, USERPW);
		out.println("conn 성공" + "<br>");
		
		// 트랜잭션 실행
		pstmt = conn.prepareStatement(SQL_WRITE_SELECT);
		
		rs = pstmt.executeQuery();
		out.println("쿼리 성공<br>");
%>	


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>글 목록</title>
<style>
table {width: 100%;}
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>
<form id="frm">
    <div>
        <label>위치</label>
        <!-- <input type="text" name="number" id="number"> -->
        <select name="attr_location" id="attr_location">
			<option value="2222">상관없음</option>
			<option value="0">실내</option>
		    <option value="1">실외</option>
		</select>
    </div>
    
    <div>
	    <label>나이</label>
    	<select name="attr_age" id="attr_age">
			<option value="2222">상관없음</option>
			<option value="4">4세이하</option>
		    <option value="20">5세이상~65세미만</option>
		    <option value="70">65세이상</option>
		</select>
    </div>
    
        <div>
	    <label>키</label>
    	<select name="attr_height" id="attr_height">
			<option value="2222">상관없음</option>
			<option value="90">110미만</option>
			<option value="140">110이상~190미만</option>
		    <option value="200">190이상</option>
		</select>
    </div>
    
    <div style="margin-top: 20px">
        <input type="button" value="button" id="button">
    </div>
    <div id="ajaxReturn">결과 값</div>

</form>
<div id="ajaxReturn0">
<%
		while(rs.next()){
			int uid = rs.getInt("attr_id");
			String attr_name = rs.getString("attr_name");
			String attr_cardimg = rs.getString("attr_cardimg");

			//전체 출력
			out.println("<div id = 'attr_menu'style='width: 250px;width:200px;border:2px solids lategrey;display:inline-block;'>"
			+"<a href=''><div id='item_img'style='height:200px;width:200px;background-position:center;background-image:url(" + attr_cardimg
		    + ");background-size: cover;'></div>" + "<div id='item_name'style='width: 50px;width:200px;'><b>" + attr_name 
		    + "</b></div><div id='attr_uid'>" + uid +"</div></a></div>");

			
		} // end while
%>			
		<br>
<%
	} catch(Exception e){
		e.printStackTrace();
		// 예외 처리
	} finally {
		// 리소스 해제
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
%>
</div>
</body>
</html>

<script>

$(function () {
    $("#button").click(function () {
        $.ajax({
            
            type : "get",
            url : "check.jsp",
            //여러개 데이터 보낼 때 Json 방식
            data : {
            	attr_location : $("#attr_location").val(),
            	attr_age : $("#attr_age").val(),
            	attr_height : $("#attr_height").val(),
            },
            success : function(data){
                //check.jsp에서 DB확인해서 출력은 index에서
                $("#ajaxReturn").html(data);
                $("#ajaxReturn0").html("");
                //$("#ajaxReturn").html("(ex)사용할 수 있는 ID입니다.");
            },
            error : function(){
                alert("error");
            }
        });
        
    });
});

</script>












