<!--  아직 코드 정리중이예요!!!! 0602중간백업!!!!!! -->
<!--  죄송해요 아직 코드가 많이 더러워요 8ㅁ8!!!!!!! -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*"%>   
<%@ page import = "java.text.SimpleDateFormat" %>
<%
    int attr_location =  Integer.parseInt(request.getParameter("attr_location"));
	int attr_age = Integer.parseInt(request.getParameter("attr_age"));
	int attr_height = Integer.parseInt(request.getParameter("attr_height"));
%>
<%=attr_location %>/<%=attr_age %>/<%=attr_height %>
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
	final String USERID = "TEAM20";  // DB 접속 계정 정보
	final String USERPW = "TIGER20";
%>
<%--
<%!
	// 쿼리문 준비
	final String SQL_WRITE_SELECT = 
		"SELECT * FROM attraction ORDER BY attr_id DESC"; 
%>
 --%>
<%

String text = "SELECT * FROM ATTRACTION";
if(attr_location != 2222){//위치
	if(attr_age != 2222){//나이
		if(attr_height != 2222){//키
			text+= " WHERE attr_location = " +attr_location  +
					" AND attr_min_age< " +attr_age+" AND "+attr_age +"<= attr_max_age " +
					" AND attr_min_height < "+attr_height+" AND "+attr_height+" <= attr_max_height ";
		}else{
			text+= " WHERE attr_location = " +attr_location  +
					" AND attr_min_age< " +attr_age+" AND "+attr_age +"<= attr_max_age ";
		}
	}else{
		if(attr_height != 2222){//키
			text+= " WHERE attr_location = " +attr_location  +
					" AND attr_min_height < "+attr_height+" AND "+attr_height+" <= attr_max_height ";
		}else{
			text+=" WHERE attr_location = " +attr_location ;
		}
	}
}else{
	if(attr_age != 2222){//나이
		if(attr_height != 2222){//키
			text+=" WHERE attr_min_age< " +attr_age+" AND "+attr_age +"<= attr_max_age " +
					" AND attr_min_height < "+attr_height+" AND "+attr_height+" <= attr_max_height ";
		}else{
			text+=" WHERE attr_min_age< " +attr_age+" AND "+attr_age +"<= attr_max_age ";
		}
	}else{
		if(attr_height != 2222){//키
			text+=" WHERE attr_min_height < "+attr_height+" AND "+attr_height+" <= attr_max_height ";
		}else{
			
		}
	}
}
//text+=" ORDER BY attr_id DESC;";
out.println(text);

	try{
		Class.forName(DRIVER);
		out.println("드라이버 로딩 성공" + "<br>");
		conn = DriverManager.getConnection(URL, USERID, USERPW);
		out.println("conn 성공" + "<br>");
		
		// 트랜잭션 실행
		pstmt = conn.prepareStatement(text);
		
		rs = pstmt.executeQuery();
		out.println("쿼리 성공<br>");
%>		
		<hr>
<%
		while(rs.next()){
			int uid = rs.getInt("attr_id");
			int attrlo = rs.getInt("attr_location");
			String attr_name = rs.getString("attr_name");
			String attr_cardimg = rs.getString("attr_cardimg");
			
			//전체 출력
			//TODO
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





