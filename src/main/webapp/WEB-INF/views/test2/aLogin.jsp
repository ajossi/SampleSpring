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
		$("#loginBtn").on("click", function() {
			if($.trim($("#bmId").val()) == "") {
				alert("아이디를 입력해주세요.")
			} if($.trim($("#bmPw").val()) == "") {
				alert("비밀번호를 입력해주세요.");
			} else {
				var params = $("#actionForm").serialize();
				
				$.ajax({
					type : "post", //데이터 전송방식
					url : "aLoginAjax", //주소
					dataType : "json", //데이터 전송 규칙
					data : params, //보낼 데이터
					// {키:값, 키:값,...} -> json
					success : function(result) {
						if(result.res == "SUCCESS") {
							location.href = "aList";
						} else {
							alert("로그인에 실패하였습니다.");
						}
					},
					error : function(request, statis, error) {
						console.log("status : " + request.status);
						console.log("text : " + request.reponseText);
						console.log("error : " + error);
					}
				});
			}
		});
		
		$("#joinBtn").on("click", function() {
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
<form action="#" id="actionForm" method="post">
<div class="area">
<div class="title">로그인</div>
<div class="line_text">
<span class="attr">ID</span>
<input type="text" name="bmId" id="bmId" class="txt" autofocus="autofocus" placeholder="ID"/>
</div>
<div class="line_text">
<span class="attr">PASSWORD</span>
<input type="password" name="bmPw" id="bmPw" class="txt" autofocus="autofocus" placeholder="PASSWORD"/>
</div>
<div class="line_btn">
<input type="button" class="btn" id="loginBtn" value="로그인" />
<input type="button" class="btn" id="joinBtn" value="회원가입"/>
</div>
</div>
</form>
</body>
</html>