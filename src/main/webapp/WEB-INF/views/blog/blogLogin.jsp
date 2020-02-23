<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/blog/main.css">
<link rel="stylesheet" type="text/css" href="resources/css/blog/btn.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/blog/input.css">
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
/* -------------------------------버튼영역--------------------------------------- */
		
		$(".logo").on("click", function() {
			$("#actionForm").attr("action", "blogMain");
			$("#actionForm").submit();
		});
		
		$("#joinBtn").on("click", function() {
			location.href = "blogJoin";
		});

		$("#cancleBtn").on("click", function() {
			location.href = "blogMain";
		});

		if ($.trim($("#bmNo").val()) == "") {
			$("#logoutBar").css("display", "inline-block");
			$("#loginBar").css("display", "none");
		} else {
			$("#logoutBar").css("display", "none");
			$("#loginBar").css("display", "inline-block");
		}

		$("#loginBtn").on("click", function() {
			if ($.trim($("#bmIdtxt").val()) == "") {
				alert("아이디를 입력해주세요.")
			}
			if ($.trim($("#bmPwtxt").val()) == "") {
				alert("비밀번호를 입력해주세요.");
			} else {
				var params = $("#actionForm").serialize();

				$.ajax({
					type : "post", //데이터 전송방식
					url : "bLoginAjax", //주소
					dataType : "json", //데이터 전송 규칙
					data : params, //보낼 데이터
					// {키:값, 키:값,...} -> json
					success : function(result) {
						if (result.res == "SUCCESS") {
							location.href = "blogMain";
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
	});
</script>
<style type="text/css">
.txt {
	margin-left: 20px;
}

.btn {
	position: relative;
	margin-right: 30px;
	left: 30px;
	top: 30px;
}
</style>
</head>
<body>
	<input type=hidden id="bmNo" name="bmNo" value="${sBmNo}" />
	<div class="bar_wrap"></div>
	<div class="area">
		<div class="bar" id="logoutBar">
			<img class="logo" id="bl_logo" src="resources/images/logo_small.png" />
			<!-- <div class="btn_txt" id="loginBtn_s">로그인</div> -->
		</div>
		<div class="bar" id="loginBar">
			<img class="logo" id="bl_logo" src="resources/images/logo_small.png" />
			<div class="btn_txt" id="bmNm_s" name="bmNm_s" style="font-weight: bold;">${sBmNm}님</div>
			<div class="btn_txt" id="blogBtn_s">내블로그</div>
			<div class="btn_txt" id="writeBtn">새글쓰기</div>
			<div class="btn_txt" id="logoutBtn_s">로그아웃</div>
		</div>
		<!-- 위 영역 -->
		<div class="area_top">
			<!-- <div class="menu">
				<div class="menu_list">홈</div>
				<div class="line_div"></div>
				<div class="menu_list">테마목록</div>
				<div class="search">
					<select class="sel"></select> <input type="text" class="input_txt" />
					<div class="btn_search">
						<img src='resources/images/btn_search_white.png' alt="검색" />
					</div>
				</div>
			</div> -->
		</div>
		<div class="area_a">
			<div class="gbn">로그인</div>
			<form action="#" id="actionForm" method="post">
				<div class="line_input">
					<div class="txt">ID</div>
					<input type="text" class="input_txt" id="bmIdtxt" name="bmIdtxt"
						placeholder="ID" />
				</div>
				<div class="line_input">
					<div class="txt">PASSWORD</div>
					<input type="password" class="input_txt" id="bmPwtxt" name="bmPwtxt"
						placeholder="PASSWORD" />
				</div>
			</form>
			<div class="btn" id="loginBtn">로그인</div>
			<div class="btn" id="joinBtn">회원가입</div>
			<div class="btn" id="cancleBtn">취소</div>
		</div>
		<div class="area_bot">Copyright ⓒBLUELEMON internet. All rights
			reserved.</div>
	</div>
</body>
</html>