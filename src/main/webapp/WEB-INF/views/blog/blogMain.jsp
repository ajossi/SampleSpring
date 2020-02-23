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
	$(document).ready(function() {
		
		reloadPopularList();
		
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

		$("#blogBtn_s").on("click", function() {
			$("#blogNo").val($("#bmNo").val());
			$("#actionForm").attr("action", "blogUser/" + $("#bmNo").val());
			$("#actionForm").submit();
		});
		
		$("#writeBtn").on("click", function() {
			location.href = "blogWrite";
		});
		
		/* 게시글 클릭 */
		$("#listBoardMain").on("click", ".wrap_board_main", function() {
			$("#bNo").val($(this).children("#wrapBoardMid").attr("name"));
			$("#blogNo").val($(this).children("#infoUser").attr("name"));
			$("#actionForm").attr("action", "blogUser/" + $("#blogNo").val());
			$("#actionForm").submit();
		});
	});
	
	/* 인기 게시글 목록 불러오기 */
	function reloadPopularList() {
		var params = $("#actionForm").serialize();

		$.ajax({
			type : "post", //데이터 전송방식
			url : "popularBListAjax", //주소
			dataType : "json", //데이터 전송 규칙
			data : params, //보낼 데이터
			// {키:값, 키:값,...} -> json
			success : function(result) {
				redrawPopularList(result.popularBList);
			},
			error : function(request, status, error) {
				console.log("text : " + request.reponseText);
				console.log("error : " + error);
			}
		});
	}

	/* 게시글 목록 나타내기 */
	function redrawPopularList(popularBList) {
		var html = "";
		if (popularBList.length == 0) {
			html += "<div>조회된 데이터가 없습니다.</div>";
		} else {
			for ( var i in popularBList) {
				html += "<li class=\"wrap\">";
				html += "<div class=\"wrap_board_main\">";
				html += "<dl class=\"wrap_board_mid\" id=\"wrapBoardMid\" name=" + popularBList[i].B_NO + ">";
				html += "<dt class=\"board_main_title\ id=\"boardMainTitle\">" + popularBList[i].B_TITLE + "</dt>";
				html += "<dd class=\"board_main_con\" id=\"boardMainCon\">" + popularBList[i].B_CON + "</dd>";
				html += "</dl>";
				html += "<div class=\"info_user\" id=\"infoUser\" name=" + popularBList[i].BM_NO + ">";
				html += "<span class=\"info_user_name\" id=\"infoUserName\">" + popularBList[i].BM_NM + "</span>";
				html += "<span class=\"div\"></span><span class=\"info_user_tema\">" + popularBList[i].T_NAME + "</span></div>";
				html += "</div>";
				html += "</li>";
				}
			}
		$("#listBoardMain").html(html);
	}
</script>
<style type="text/css">
.btn_more {
	margin-top: 15px;
}
</style>
</head>
<body>
	<form action="#" id="actionForm" method="post">
	<input type=hidden id="bmNo" name="bmNo" value="${sBmNo}" />
	<input type=hidden id="blogNo" name="blogNo" value="" />
	<input type=hidden id="bNo" name="bNo" value="" />
	<input type=hidden id="bmNm" name="bmNm" value="" />
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
				<!-- <div class="search">
					<select class="sel"></select> <input type="text" class="input_txt" />
					<div class="btn_search">
						<img src='resources/images/btn_search_white.png' alt="검색" />
					</div>
				</div> -->
			</div>
		</div>
		<!-- 중간 영역 -->
		<div class="area_mid">
		
			<!-- 전체 인기글 -->
			<div class="board_main" style="margin-top: 40px;">
				<div class="board_main_top">
					<span class="title">전체 인기글</span>
					<!-- <div class="btn_more">더보기</div> -->
				</div>
				<ul class="list_board_main" id="listBoardMain">
					<li class="wrap">
						<div class="wrap_board_main">
							<dl>
								<dt style="font-size: 12pt">내용 및 제목</dt>
								<dd></dd>
							</dl>
							<div class="info_user" style="font-size: 12pt">작성자 및 카테고리</div>
						</div>
					</li>
				</ul>
			</div>
			<!-- 테마별 최신글 -->
			<div class="board_main">
				<div class="board_main_top">
					<span class="title">테마별 최신글</span>
					<div class="btn_more">더보기</div>
				</div>
				<ul class="list_board_main">
					<li class="wrap">
						<div class="wrap_board_main">
							<div class="area_photo"></div>
							<dl>
								<dt class="info_title"></dt>
								<dd class="info_con"></dd>
							</dl>
							<div class="info_user"></div>
						</div>
					</li>
					<li class="wrap">
						<div class="wrap_board_main">
							<div class="area_photo"></div>
							<dl>
								<dt class=""></dt>
								<dd></dd>
							</dl>
							<div class="info_user"></div>
						</div>
					</li>
					<li class="wrap">
						<div class="wrap_board_main">
							<div class="area_photo"></div>
							<dl>
								<dt class=""></dt>
								<dd></dd>
							</dl>
							<div class="info_user"></div>
						</div>
					</li>
					<li class="wrap">
						<div class="wrap_board_main">
							<div class="area_photo"></div>
							<dl>
								<dt class=""></dt>
								<dd></dd>
							</dl>
							<div class="info_user"></div>
						</div>
					</li>
					<li class="wrap">
						<div class="wrap_board_main">
							<div class="area_photo"></div>
							<dl>
								<dt class=""></dt>
								<dd></dd>
							</dl>
							<div class="info_user"></div>
						</div>
					</li>
					<li class="wrap">
						<div class="wrap_board_main">
							<div class="area_photo"></div>
							<dl>
								<dt class=""></dt>
								<dd></dd>
							</dl>
							<div class="info_user"></div>
						</div>
					</li>
					<li class="wrap">
						<div class="wrap_board_main">
							<div class="area_photo"></div>
							<dl>
								<dt class=""></dt>
								<dd></dd>
							</dl>
							<div class="info_user"></div>
						</div>
					</li>
					<li class="wrap">
						<div class="wrap_board_main">
							<div class="area_photo"></div>
							<dl>
								<dt class=""></dt>
								<dd></dd>
							</dl>
							<div class="info_user"></div>
						</div>
					</li>
				</ul>
			</div>
			<!-- 공지사항 -->
			<div class="notice">
				<div class="wrap_title_list">
					<div class="title_list">공지사항</div>
					<div class="btn_more">더보기</div>
				</div>
				<table>
					<tbody>
						<tr class="tr_list">
							<td class="td_list_left">제목 들어올자리</td>
							<td class="td_list_right">0000.00.00</td>
						</tr>
						<tr class="tr_list">
							<td class="td_list_left">제목 들어올자리</td>
							<td class="td_list_right">0000.00.00</td>
						</tr>
						<tr class="tr_list">
							<td class="td_list_left">제목 들어올자리</td>
							<td class="td_list_right">0000.00.00</td>
						</tr>
						<tr class="tr_list">
							<td class="td_list_left">제목 들어올자리</td>
							<td class="td_list_right">0000.00.00</td>
						</tr>
						<tr class="tr_list">
							<td class="td_list_left">제목 들어올자리</td>
							<td class="td_list_right">0000.00.00</td>
						</tr>
						<tr class="tr_list">
							<td class="td_list_left">제목 들어올자리</td>
							<td class="td_list_right">0000.00.00</td>
						</tr>
					</tbody>
				</table>
			</div>
			광고
			<div class="ad">
				<a href="http://www.gdu.co.kr/main/main.html" target="_blank"> <img
					src="resources/images/ad.PNG" alt="구디아카데미" class="img_ad" />
				</a>
			</div>
		</div>
		<!-- 아래 영역 -->
		<div class="area_bot">Copyright ⓒBLUELEMON internet. All rights
			reserved.</div>
	</div>
	</form>
</body>
</html>