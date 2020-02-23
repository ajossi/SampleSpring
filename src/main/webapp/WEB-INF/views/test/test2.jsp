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
	$("#listBtn").on("click", function() {
		$("#actionForm").attr("action", "test1");
		$("#actionForm").submit();
	});
	
	$("#updateBtn").on("click", function() {
		$("#actionForm").attr("action", "test4");
		$("#actionForm").submit();
	});
	
	$("#deleteBtn").on("click", function() {
		if(confirm("삭제하시겠습니까?")) {
		$("#actionForm").attr("action", "test5s");
		$("#actionForm").submit();			
		}
	});
});
</script>
</head>
<body>
<form action="#" method="post" id="actionForm">
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
	<input type="hidden" name="no" value="${data.NO}" />
</form>
번호 : ${data.NO}<br/>
제목 : ${data.TITLE}<br/>
작성자 : ${data.WRITER}<br/>
작성일 : ${data.DT}<br/>
조회수 : ${data.HIT}<br/>
- 내용 -<br/>
${data.CON}<br/>
<input type="button" value="목록" id="listBtn" />
<input type="button" value="수정" id="updateBtn" />
<input type="button" value="삭제" id="deleteBtn" />
</body>
</html>