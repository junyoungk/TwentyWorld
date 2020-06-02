<!--  아직 코드 정리중이예요!!!! 0602중간백업!!!!!! -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>   
<%@ page import = "java.text.SimpleDateFormat" %>



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
			<option value="2">상관없음</option>
			<option value="0">실내</option>
		    <option value="1">실외</option>
		</select>
    </div>
    
    <div>
	    <label>나이</label>
    	<select name="attr_age" id="attr_age">
			<option value="0">상관없음</option>
			<option value="4">4세이하</option>
		    <option value="20">5세이상~65세미만</option>
		    <option value="70">65세이상</option>
		</select>
    </div>
    
        <div>
	    <label>키</label>
    	<select name="attr_height" id="attr_height">
			<option value="90">110미만</option>
			<option value="140">110이상~190미만</option>
		    <option value="200">190이상</option>
		</select>
    </div>
    
    <div style="margin-top: 20px">
        <input type="button" value="button" id="button">
    <div id="ajaxReturn">결과 값</div>
    </div>
    <br><br>

</form>
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
                //$("#ajaxReturn").html("(ex)사용할 수 있는 ID입니다.");
            },
            error : function(){
                alert("error");
            }
        });
        
    });
});

</script>


