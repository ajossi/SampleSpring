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
	alert("삭제되었습니다.");
	$("#bNo").val("");
	$("#actionForm").attr("action", "blogUser/" + $("#blogNo").val());
	$("#actionForm").submit();
});
</script>
</head>
<body>
	<form action="#" id="actionForm" method="post">
		<input type="hidden" id="bNo" name="bNo" value="${param.bNo}" />
		<input type="hidden" id="blogNo" name="blogNo" value="${param.blogNo}" />
	</form>
</body>
</html>