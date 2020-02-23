<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#joinBtn").on("click", function() {
		if($.trim($("#id").val()) == "") {
			alert("아이디를 입력하세요.");
			$("#id").focus();
		} else if($.trim($("#pass").val()) == "") {
			alert("비밀번호를 입력하세요.");
			$("#pass").focus();
		} else if($.trim($("#nm").val()) == "") {
			alert("이름을 입력하세요.");
			$("#nm").focus();
		} else {
			$("#joinForm").attr("action", "tjoins");
			$("#joinForm").submit();
		}
	});
	
	$("#cancelBtn").on("click", function() {
		history.back();
	});
});
</script>
</head>
<body>
<form action="#" id="joinForm" method="post">
<table border="1" cellspacing="0">
	<tbody>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id" id="id" /></td>
			
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pass" id="pass" /></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="nm" id="nm" /></td>
		</tr>
	</tbody>
</table>
</form>
<br/>
<input type="button" value="회원가입" id="joinBtn" />
<input type="button" value="취소" id="cancelBtn" />
<input type="button" value="중복확인" id="idCheckBtn" />
</body>
</html>