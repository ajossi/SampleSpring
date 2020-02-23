<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BLUELEMON</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/blog/main.css">
<link rel="stylesheet" type="text/css" href="resources/css/blog/btn.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/blog/input.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/blog/layout.css">
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	/* 버튼 길이 자동 조정 */
	$(".btn").each(function() {
		if ($(this).val().length > 2) {
			var leng_diff = $(this).val().length - 2;
			$(this).width($(this).width() + (10 * leng_diff) + "px");
		}
	});
	$(".menu_list").each(function() {
		if ($(this).val().length > 2) {
			var leng_diff = $(this).val().length - 2;
			$(this).width($(this).width() + (10 * leng_diff) + "px");
		}
	});

	/* 로그인 상태바 */
	$(document).ready(function() {
		if ($.trim($("#bmNo").val()) == "") {
			$("#logoutBar").css("display", "inline-block");
			$("#loginBar").css("display", "none");
		} else {
			$("#logoutBar").css("display", "none");
			$("#loginBar").css("display", "inline-block");
		}
		
/* -------------------------------버튼영역--------------------------------------- */
		
		$(".logo").on("click", function() {
			$("#actionForm").attr("action", "blogMain");
			$("#actionForm").submit();
		});

		$("#logoutBtn_s").on("click", function() {
			location.href = "blogLogout";
		});

		$("#loginBtn_s").on("click", function() {
			location.href = "blogLogin";
		});

		$("#blogBtn").on("click", function() {
			location.href = "blogUser";
		});
	});
</script>
<style type="text/css">
.logo {
	float: left;
}

.btn_search {
	float: right;
}

.btn_txt {
	float: right;
	margin-top: 10px;
}

.btn_more {
	margin-top: 15px;
}

.area_paging > span {
	float: left;
}
</style>
</head>
<body>
	<input type=hidden id="bmNo" value="${sBmNo}" />
	<div class="bar_wrap"></div>
	<div class="area">
		<div class="bar" id="logoutBar">
			<img class="logo" id="bl_logo" src="resources/images/logo_small.png" />
			<div class="btn_txt" id="loginBtn_s">로그인</div>
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
		<!-- 중간 영역 -->
		<div class="area_mid">
			<!-- 전체 인기글 -->
			<div class="area_left" style="width: 150px;">
				<div class="left_menu_tema">
					<div class="left_menu_title"
						style="margin: 0px; border-bottom: 1px solid #DEDEDE;">테마</div>
					<div class="left_menu_wrap">
						<div class="left_menu_content">전체 인기글</div>
						<div class="left_menu_content">전체 최신글</div>
					</div>
					<div class="left_menu_wrap">
						<div class="left_menu_content">영화</div>
						<div class="left_menu_content">게임</div>
						<div class="left_menu_content">애니메이션</div>
						<div class="left_menu_content">만화</div>
						<div class="left_menu_content">도서</div>
						<div class="left_menu_content">동물</div>
					</div>
					<div class="left_menu_wrap">
						<div class="left_menu_content">음악</div>
						<div class="left_menu_content">공연&전시</div>
						<div class="left_menu_content">음식</div>
						<div class="left_menu_content">사진</div>
						<div class="left_menu_content">패션&뷰티</div>
						<div class="left_menu_content">연애</div>
					</div>
					<div class="left_menu_wrap">
						<div class="left_menu_content">여행</div>
						<div class="left_menu_content">개그</div>
						<div class="left_menu_content">일상</div>
						<div class="left_menu_content">육아</div>
						<div class="left_menu_content">IT</div>
					</div>
					<div class="left_menu_wrap">
						<div class="left_menu_content">자동차</div>
						<div class="left_menu_content">스포츠</div>
						<div class="left_menu_content">뉴스</div>
						<div class="left_menu_content">인문사회</div>
						<div class="left_menu_content">역사</div>
						<div class="left_menu_content">세계</div>
						<div class="left_menu_content">과학</div>
					</div>
				</div>
			</div>
			<div class="area_right" style="width: 900px;">
				<div class="right_list_area">
					<div class="tema_title">테마</div>
					<ul style="padding: 0px;">
						<li class="tema_wrap">
							<div class="tema_img"></div>
							<div class="tema_right">
								<div class="tema_right_top">
									<span class="tema_right_tema">[테마]</span> <span
										class="tema_right_title">제목</span>
								</div>
								<div class="tema_right_mid">
									<span class="tema_right_writer">작성자</span> <span
										class="tema_div">│</span> <span class="tema_right_date">날짜</span>
								</div>
								<div class="tema_right_bot">내용</div>
							</div>
						</li>
						<li class="tema_wrap">
							<div class="tema_img"></div>
							<div class="tema_right">
								<div class="tema_right_top">
									<span class="tema_right_tema">[테마]</span> <span
										class="tema_right_title">제목</span>
								</div>
								<div class="tema_right_mid">
									<span class="tema_right_writer">작성자</span> <span
										class="tema_div">│</span> <span class="tema_right_date">날짜</span>
								</div>
								<div class="tema_right_bot">내용</div>
							</div>
						</li>
						<li class="tema_wrap">
							<div class="tema_img"></div>
							<div class="tema_right">
								<div class="tema_right_top">
									<span class="tema_right_tema">[테마]</span> <span
										class="tema_right_title">제목</span>
								</div>
								<div class="tema_right_mid">
									<span class="tema_right_writer">작성자</span> <span
										class="tema_div">│</span> <span class="tema_right_date">날짜</span>
								</div>
								<div class="tema_right_bot">내용</div>
							</div>
						</li>
						<li class="tema_wrap">
							<div class="tema_img"></div>
							<div class="tema_right">
								<div class="tema_right_top">
									<span class="tema_right_tema">[테마]</span> <span
										class="tema_right_title">제목</span>
								</div>
								<div class="tema_right_mid">
									<span class="tema_right_writer">작성자</span> <span
										class="tema_div">│</span> <span class="tema_right_date">날짜</span>
								</div>
								<div class="tema_right_bot">내용</div>
							</div>
						</li>
						<li class="tema_wrap">
							<div class="tema_img"></div>
							<div class="tema_right">
								<div class="tema_right_top">
									<span class="tema_right_tema">[테마]</span> <span
										class="tema_right_title">제목</span>
								</div>
								<div class="tema_right_mid">
									<span class="tema_right_writer">작성자</span> <span
										class="tema_div">│</span> <span class="tema_right_date">날짜</span>
								</div>
								<div class="tema_right_bot">내용</div>
							</div>
						</li>
						<li class="tema_wrap">
							<div class="tema_img"></div>
							<div class="tema_right">
								<div class="tema_right_top">
									<span class="tema_right_tema">[테마]</span> <span
										class="tema_right_title">제목</span>
								</div>
								<div class="tema_right_mid">
									<span class="tema_right_writer">작성자</span> <span
										class="tema_div">│</span> <span class="tema_right_date">날짜</span>
								</div>
								<div class="tema_right_bot">내용</div>
							</div>
						</li>
						<li class="tema_wrap">
							<div class="tema_img"></div>
							<div class="tema_right">
								<div class="tema_right_top">
									<span class="tema_right_tema">[테마]</span> <span
										class="tema_right_title">제목</span>
								</div>
								<div class="tema_right_mid">
									<span class="tema_right_writer">작성자</span> <span
										class="tema_div">│</span> <span class="tema_right_date">날짜</span>
								</div>
								<div class="tema_right_bot">내용</div>
							</div>
						</li>
						<li class="tema_wrap">
							<div class="tema_img"></div>
							<div class="tema_right">
								<div class="tema_right_top">
									<span class="tema_right_tema">[테마]</span> <span
										class="tema_right_title">제목</span>
								</div>
								<div class="tema_right_mid">
									<span class="tema_right_writer">작성자</span> <span
										class="tema_div">│</span> <span class="tema_right_date">날짜</span>
								</div>
								<div class="tema_right_bot">내용</div>
							</div>
						</li>
						<li class="tema_wrap">
							<div class="tema_img"></div>
							<div class="tema_right">
								<div class="tema_right_top">
									<span class="tema_right_tema">[테마]</span> <span
										class="tema_right_title">제목</span>
								</div>
								<div class="tema_right_mid">
									<span class="tema_right_writer">작성자</span> <span
										class="tema_div">│</span> <span class="tema_right_date">날짜</span>
								</div>
								<div class="tema_right_bot">내용</div>
							</div>
						</li>
						<li class="tema_wrap">
							<div class="tema_img"></div>
							<div class="tema_right">
								<div class="tema_right_top">
									<span class="tema_right_tema">[테마]</span> <span
										class="tema_right_title">제목</span>
								</div>
								<div class="tema_right_mid">
									<span class="tema_right_writer">작성자</span> <span
										class="tema_div">│</span> <span class="tema_right_date">날짜</span>
								</div>
								<div class="tema_right_bot">내용</div>
							</div>
						</li>
					</ul>
					<div class="area_paging">
						<span class="btn_paging">1</span> <span class="btn_paging">2</span>
						<span class="btn_paging">3</span> <span class="btn_paging">4</span>
						<span class="btn_paging">5</span> <span class="btn_paging">6</span>
						<span class="btn_paging">7</span> <span class="btn_paging">8</span>
						<span class="btn_paging">9</span> <span class="btn_paging">10</span>
					</div>
				</div>
			</div>
		</div>
		<!-- 아래 영역 -->
		<div class="area_bot">Copyright ⓒBLUELEMON internet. All rights
			reserved.</div>
	</div>
</body>
</html>