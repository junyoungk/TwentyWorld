<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="attraction.beans.*" %>    

<%
    	// Controller 로부터 결과 데이터 받음.
    	AttrWriteDTO [] arr = (AttrWriteDTO [])request.getAttribute("list");
    %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글 목록</title>
<style>
table {width: 100%;}
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
#long_sentence{
width : 800px;
overflow: scroll;
}
</style>
</head>
<body>
<hr>
	<h1>#관리자 페이지# ListMain</h1>
		<table>
			<tr>
				<th>attr_id</th>
				<th>attr_max</th>
				<th>attr_time</th>
				<th>attr_price</th>
				<th>attr_content</th>
				<th>attr_name</th>
				
				<th>attr_location</th>
				<th>attr_min_age</th>
				<th>attr_max_age</th>
				<th>attr_min_height</th>
				<th>attr_max_height</th>
				
				<th>attr_authorize</th>
				<th>attr_regDate ㅁㅁ</th>
				<th>attr_img </th>
				<th>attr_cardimg </th>
			</tr>


		<%
	if(arr != null){
		for(int i = 0; i < arr.length; i++){
%>
			<tr>
				<td><%= arr[i].getAttr_id() %></td>
				<td><%= arr[i].getAttr_max() %></td>
				<td><%= arr[i].getAttr_time() %></td>
				<td><%= arr[i].getAttr_price() %></td>
				<td><%= arr[i].getAttr_content() %></td>
				<td><a href="attrAdminView.doat?attr_id=<%=arr[i].getAttr_id()%>"><%= arr[i].getAttr_name() %></a></td>
				
				<td><%= arr[i].getAttr_location() %></td>
				<td><%= arr[i].getAttr_min_age() %></td>
				<td><%= arr[i].getAttr_max_age() %></td>
				<td><%= arr[i].getAttr_min_height() %></td>
				<td><%= arr[i].getAttr_max_height() %></td>
				
				<td><%= arr[i].getAttr_authorize() %></td>
				<td><%= arr[i].getAttr_regDate() %></td>
				<td><%= arr[i].getAttr_img() %></td>
				<td><%= arr[i].getAttr_cardimg() %></td>
			</tr>
<%			
		} // end for
	} // end if
%>

		</table>
		<br>
		<button onclick="location.href='attrWrite.doat'">신규등록</button>
		<button onclick="location.href='attrClientListMain.jsp'">클라이언트페이지로 이동(테스트용)</button>

</body>
</html>















