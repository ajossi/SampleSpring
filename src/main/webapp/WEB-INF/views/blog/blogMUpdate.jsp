<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/blog/main.css">
<link rel="stylesheet" type="text/css" href="resources/css/blog/btn.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/blog/input.css">
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#updateBtn").on("click", function() {
			if ($.trim($("#bmPwtxt").val()) == "") {
				alert("비밀번호를 입력하세요.");
				$("#bmPwtxt").focus();
			} else if ($.trim($("#bmNmtxt").val()) == "") {
				alert("이름을 입력하세요.");
				$("#bmNmtxt").focus();
			} else if ($("#checkNm").val() == 0) {
				alert("닉네임이 유효하지 않습니다.");
			} else if ($("#checkPw").val() == 0) {
				alert("비밀번호가 유효하지 않습니다.");
			} else {
				var params = $("#actionForm").serialize();

				$.ajax({
					type : "post", //데이터 전송방식
					url : "bJoinAjax", //주소
					dataType : "json", //데이터 전송 규칙
					data : params, //보낼 데이터
					// {키:값, 키:값,...} -> json
					success : function(result) {
						if (result.res == "SUCCESS") {
							location.href = "blogLogin";
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
		
/* -------------------------------버튼영역--------------------------------------- */
		
		$(".logo").on("click", function() {
			$("#actionForm").attr("action", "blogMain");
			$("#actionForm").submit();
		});

		$("#bmIdtxt").on("focusout", function() {
			if ($(this).val().length < 4) {
				$("#idMsg").html("아이디는 4글자 이상입니다.");
				$("#idMsg").css("color", "red");
				$("#checkId").val(0);
			} else {
				var params = $("#actionForm").serialize();

				$.ajax({
					type : "post", //데이터 전송방식
					url : "bIdCheckAjax", //주소
					dataType : "json", //데이터 전송 규칙
					data : params, //보낼 데이터
					// {키:값, 키:값,...} -> json
					success : function(result) {
						if (result.cnt > 0) {
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

		$("#bmNmtxt").on("focusout", function() {
			if ($(this).val().length < 3) {
				$("#nmMsg").html("닉네임은 3글자 이상입니다.");
				$("#nmMsg").css("color", "red");
				$("#checkNm").val(0);
			} else {
				var params = $("#actionForm").serialize();

				$.ajax({
					type : "post", //데이터 전송방식
					url : "bNmCheckAjax", //주소
					dataType : "json", //데이터 전송 규칙
					data : params, //보낼 데이터
					// {키:값, 키:값,...} -> json
					success : function(result) {
						if (result.cnt > 0) {
							$("#nmMsg").html("중복된 닉네임이 있습니다.");
							$("#nmMsg").css("color", "red");
							$("#checkNm").val(0);
						} else {
							$("#nmMsg").html("사용가능한 닉네임 입니다.");
							$("#nmMsg").css("color", "green");
							$("#checkNm").val(1);
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

		$("#bmPwCheck").on("focusout", function() {
			if ($.trim($("#bmPw").val()) != $.trim($("#bmPwCheck").val())) {
				$("#pwMsg").html("입력한 비밀번호와 다릅니다.");
				$("#pwMsg").css("color", "red");
				$("#checkPw").val(0);
			} else {
				$("#pwMsg").html("사용 가능한 비밀번호 입니다.");
				$("#pwMsg").css("color", "green");
				$("#checkPw").val(1);
			}
		});

		$("#cancleBtn").on("click", function() {
			location.href = "blogLogin";
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
	left: 80px;
	top: 30px;
}

.area_a {
	height: 500px;
}

span {
	font-size: 10pt;
	position: relative;
	left: 120px;
}
</style>
</head>
<body>
	<input type=hidden id="bmNo" name="bmNo" value="${sBmNo}" />
	<div class="bar_wrap"></div>
	<div class="area">
		<div class="bar" id="logoutBar">
			<img class="logo" id="bl_logo" src="resources/images/logo_small.png" />
			<div class="btn_txt" id="loginBtn_s">로그인</div>
		</div>
		<div class="bar" id="loginBar">
			<img class="logo" id="bl_logo" src="resources/images/logo_small.png" />
			<div class="btn_txt" id="bmId" name="bmId" style="font-weight: bold;">${sBmNm}님</div>
			<div class="btn_txt" id="blogBtn">내블로그</div>
			<div class="btn_txt" id="writeBtn_s">새글쓰기</div>
			<div class="btn_txt" id="logoutBtn">로그아웃</div>
		</div>
		<!-- 위 영역 -->
		<div class="area_top">
			<div class="menu">
				<div class="menu_list">홈</div>
				<div class="line_div"></div>
				<div class="menu_list">테마목록</div>
				<div class="search">
					<select class="sel"></select> <input type="text" class="input_txt" />
					<div class="btn_search">
						<img src='resources/images/btn_search_white.png' alt="검색" />
					</div>
				</div>
			</div>
		</div>
		<div class="area_a">
			<input type="hidden" id="checkId" value="0" /> <input type="hidden"
				id="checkNm" value="0" /> <input type="hidden" id="checkPw"
				value="0" />
			<div class="gbn">회원정보수정</div>
			<form action="#" id="actionForm" method="post">
				<div class="line_input">
					<div class="txt">ID</div>
					<input type="text" class="input_txt" id="bmIdtxt" name="bmIdtxt"
						placeholder="ID" readonly="readonly" /><br /> <span id="idMsg"></span>
				</div>

				<div class="line_input">
					<div class="txt">PASSWORD</div>
					<input type="password" class="input_txt" id="bmPwtxt" name="bmPwtxt"
						placeholder="PASSWORD" />
				</div>

				<div class="line_input">
					<div class="txt">PWCHECK</div>
					<input type="password" class="input_txt" id="bmPwCheck" name="bmPwCheck"
						placeholder="PWCHECK" /><br /> <span id="pwMsg"></span>
				</div>

				<div class="line_input">
					<div class="txt">NAME</div>
					<input type="text" class="input_txt" id="bmNmtxt" name="bmNmtxt"
						placeholder="NAME" /><br /> <span id="nmMsg"></span>
				</div>

				<div class="btn" id="updateBtn">수정</div>
				<div class="btn" id="cancleBtn">취소</div>
			</form>
		</div>
		<div class="area_bot">Copyright ⓒBLUELEMON internet. All rights
			reserved.</div>
	</div>
</body>
</html>