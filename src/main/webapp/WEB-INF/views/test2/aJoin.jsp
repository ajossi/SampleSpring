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
		if($.trim($("#bmId").val()) == "") {
			alert("아이디를 입력하세요.");
			$("#bmId").focus();
		} else if($.trim($("#bmPw").val()) == "") {
			alert("비밀번호를 입력하세요.");
			$("#bmPw").focus();
		} else if($.trim($("#bmNm").val()) == "") {
			alert("이름을 입력하세요.");
			$("#bmNm").focus();
		} else if($("#checkId").val() == 0) {
			alert("아이디가 유효하지 않습니다.");
		} else {
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post", //데이터 전송방식
				url : "aJoinAjax", //주소
				dataType : "json", //데이터 전송 규칙
				data : params, //보낼 데이터
				// {키:값, 키:값,...} -> json
				success : function(result) {
					if(result.res == "SUCCESS") {
						location.href = "aLogin";
					} else {
						alert("가입에 실패하였습니다.");
					}
				},
				error : function(request, status, error) {
					console.log("status : " + request.status);
					console.log("text : " + request.reponseText);
					console.log("error : " + error);
				}
			});
		}
	});
	$("#bmId").on("focusout", function() {
		if($(this).val().length < 4) {
			$("#idMsg").html("아이디는 4글자 이상입니다.");
			$("#idMsg").css("color", "red");
			$("#checkId").val(0);
			/* 배경색 마음에 안듬 */
			/* $("#idMsg").css("background-color", "rgbs(255, 100, 100, 0.7)"); */
		} else {
			//수동
			//var params = "&bmId=" + $("bmId").val();
			
			//jQuery 활용
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post", //데이터 전송방식
				url : "aIdCheckAjax", //주소
				dataType : "json", //데이터 전송 규칙
				data : params, //보낼 데이터
				// {키:값, 키:값,...} -> json
				success : function(result) {
					if(result.cnt > 0) {
						$("#idMsg").html("중복된 아이디가 있습니다.");
						$("#idMsg").css("color", "red");
						$("#checkId").val(0);
					} else {
						$("#idMsg").html("사용가능한 아이디 입니다.");
						$("#idMsg").css("color", "green");
						$("#checkId").val(1);
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
});
</script>
</head>
<body>
	<input type="hidden" id="checkId" value="0" /> 
	회원가입
	</br>
	<form action="#" id="actionForm" method="post">
		<input type="text" name="bmId" id="bmId" placeholder="아이디" />
		<span id="idMsg"></span>
		</br>
		<input type="password" name="bmPw" id="bmPw" placeholder="비밀번호" />
		</br>
		<input type="text" name="bmNm" id="bmNm" placeholder="이름" />
		<input type="button" value="가입" id="joinBtn" />
		<input type="button"value="취소" id="cancelBtn" />
	</form>
</body>
</html>