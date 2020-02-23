<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
if(${res} == "0") {
alert("회원가입에 실패하였습니다.");
history.back();	
} else if(${res} == "1"){
	alert("이미 존재하는 아이디입니다.");
	history.back();	
}
</script>
<body>

</body>
</html>