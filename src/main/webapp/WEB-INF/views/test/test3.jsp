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
<script type="text/javascript"
		src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	CKEDITOR.replace("con", {
		resize_enabled : false,
		language : "ko",
		enterMode : "2"
	});
	
	$("#saveBtn").on("click", function() {
		$("#con").val(CKEDITOR.instances['con'].getData());
		if($.trim($("#title").val()) == "") {
			alert("제목을 입력하세요.");
			$("#title").focus();
		} else if($.trim($("#writer").val()) == "") {
			alert("작성자를 입력하세요.");
			$("#writer").focus();
		} else if($.trim($("#con").val()) == "") {
			alert("내용을 입력하세요.");
			$("#con").focus();
		} else {
			$("#saveForm").submit();
		}
	});
	
	$("#cancelBtn").on("click", function() {
		history.back();	
	});
});
</script>
</head>
<body>
<form action="test3s" id="saveForm" method="post">
<table border="1" cellspacing="0">
	<tbody>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" id="title" /></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="writer" id="writer" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="con" id="con"
							rows="10" cols="20"></textarea></td>
		</tr>
	</tbody>
</table>
</form>
<br/>
<input type="button" value="저장" id="saveBtn" />
<input type="button" value="취소" id="cancelBtn" />
</body>
</html>