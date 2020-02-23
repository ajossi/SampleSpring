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
		$("#bLoginBtn").on("click", function() {
			if($.trim($("#bMemId").val()) == "") {
				$("#warningTxtId").val("아이디를 입력해주세요.");
			} if($.trim($("#bMemPw").val()) == "") {
				$("#warningTxtPw").val("비밀번호를 입력해주세요.");
			} else {
				$("#bLoginForm").attr("action", "bLogins");
				$("#bLoginForm").submit();
			}
		});
		
		$("#bJoinBtn").on("click", function() {
			location.href = "bJoin";
		});
	});
</script>
<style type="text/css">
.area{
	display: inline-block;
	width: 300px;
}

.title {
	display: block;
	width: 100%;
	height: 40px;
	text-align: center;
	margin-bottom: 30px;
	font-weight: bold;
	font-size: 20px;
	border-bottom: solid 1pt #000000;
}

.attr {
	display: inline-block;
	width: 100px;
}

.line_text {
	display: block;
	margin-bottom: 20px;
}

.line_btn {
	display: block;
	margin-bottom: 20px;
	padding-left: 40px;
	margin-top: 30px;
}

.txt {
	display: inline-block;
	height: 30px;
	background-color: #EAF0FE;
	border: solid 1px #CCCCCC;
	
}

.txt:focus {
	outline: solid 1px #5a6ff2;
}

.btn {
	display: inline-block;
	width: 80px;
	height: 30px;
	margin-right: 30px;
	background-color: #6e81df;
	border: 1px solid #5a6ff2;
	color: #FFFFFF;
	outline: none;
}

.btn:hover {
	cursor: pointer;
}

.warningTxt {
	display: block;
	color: red;
	font-size: 6px;
	border: none;
	visibility: visible;
	margin-left: 110px;
	outline: none;
}
</style>
</head>
<body>
<form action="#" id="bLoginForm" method="post">
<div class="area">
<div class="title">로그인</div>
<div class="line_text">
<span class="attr">ID</span>
<input type="text" name="bMemId" id="bMemId" class="txt" autofocus="autofocus" placeholder="ID"/>
<br/><input type="text" id="warningTxtId" class="warningTxt"  value="" readonly="readonly"/>
</div>
<div class="line_text">
<span class="attr">PASSWORD</span>
<input type="password" name="bMemPw" id="bMemPw" class="txt" autofocus="autofocus" placeholder="PASSWORD"/>
<br/><input type="text" id="warningTxtPw" class="warningTxt"  value="" readonly="readonly"/>
</div>
<div class="line_btn"><input type="button" class="btn" id="bLoginBtn" value="로그인" />
					<input type="button" class="btn" id="bJoinBtn" value="회원가입"/>
</div>
</div>
</form>
</body>
</html>