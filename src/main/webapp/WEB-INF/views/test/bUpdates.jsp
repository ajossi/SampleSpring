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
	if (res = "success") {
		alert("수정되었습니다.");
		$("#bUpdatesForm").submit();
	} else {
		alert("수정에 실패했습니다.");
		history.back();
	}
});
</script>
</head>
<body>
	<form action="bDetail" id="bUpdatesForm" method="post">
		<input type="hidden" name="bNo" value="${param.bNo}" />
	</form>
</body>
</html>