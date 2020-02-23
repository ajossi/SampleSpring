<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/blog/main.css">
<link rel="stylesheet" type="text/css" href="resources/css/blog/btn.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/blog/input.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/blog/layout.css">
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		reloadCateList();
		
		CKEDITOR.replace("bCon", {
			resize_enabled : false,
			langage : "ko",
			enterMode : "2"
		});

		/* 버튼 길이 자동 조정 */
		$(".btn").each(function() {
			if ($(this).val().length > 2) {
				var leng_diff = $(this).val().length - 2;
				$(this).width($(this).width() + (10 * leng_diff) + "px");
			}
		});

		$(".btn_txt").each(function() {
			if ($(this).val().length > 2) {
				var leng_diff = $(this).val().length - 2;
				$(this).width($(this).width() + (10 * leng_diff) + "px");
			}
		});

		$(".btn_search").each(function() {
			if ($(this).val().length > 2) {
				var leng_diff = $(this).val().length - 2;
				$(this).width($(this).width() + (10 * leng_diff) + "px");
			}
		});

		$(".btn_more").each(function() {
			if ($(this).val().length > 2) {
				var leng_diff = $(this).val().length - 2;
				$(this).width($(this).width() + (10 * leng_diff) + "px");
			}
		});

		$(".btn_hidden").each(function() {
			if ($(this).val().length > 2) {
				var leng_diff = $(this).val().length - 2;
				$(this).width($(this).width() + (10 * leng_diff) + "px");
			}
		});

		$(".btn_paging").each(function() {
			if ($(this).val().length > 2) {
				var leng_diff = $(this).val().length - 2;
				$(this).width($(this).width() + (10 * leng_diff) + "px");
			}
		});

		$(".btn_s").each(function() {
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
		
		/* 로고 */
		$(".logo").on("click", function() {
			$("#actionForm").attr("action", "blogMain");
			$("#actionForm").submit();
		});
		
		/* 로그아웃 */
		$("#logoutBtn_s").on("click", function() {
			location.href = "blogLogout";
		});

		/* 로그인 */
		$("#loginBtn_s").on("click", function() {
			location.href = "blogLogin";
		});
		
		/* 새글쓰기 */
		$("#writeBtn_s").on("click", function() {
			$("#actionForm").attr("action", "blogWrite");
			$("#actionForm").submit();
		});
		
		/* 수정 */
		$("#updateBtn").on("click", function() {
			$("#actionForm").attr("action", "blogUpdates");
			$("#actionForm").submit();
		});
		
		$("#cancleBtn").on("click", function() {
			history.back();
		});

	});
	
	/* 카테고리 불러오기 */
	function reloadCateList() {
	var params = $("#actionForm").serialize();

	$.ajax({
		type : "post", //데이터 전송방식
		url : "cateListAjax", //주소
		dataType : "json", //데이터 전송 규칙
		data : params, //보낼 데이터
		// {키:값, 키:값,...} -> json
		success : function(result) {
			redrawCateSelect(result.cateList, result.cnt);
		},
		error : function(request, status, error) {
			console.log("text : " + request.reponseText);
			console.log("error : " + error);
		}
	});
}
	/* 카테고리 나타내기 */
	function redrawCateSelect(cateList, cnt) {
		var html = "";
		if (cateList.length == 0) {
			html += "<option value=\"\">없음</option>"
		} else {
			html += "<option value=\"\">없음</option>"
			for ( var i in cateList) {
				html += "<option value=\"" + cateList[i].C_NO + "\">" + cateList[i].C_NAME + "</option>";
			}
		}
		$("#cNo").html(html);
	}
</script>
<style type="text/css">
body {
	background-color: #ABC8E2;
}

.area {
	width: 800px;
	height: 100%;
}

.area_top {
	height: 60px;
	border: none;
}

.logo {
	float: left;
}

.btn_search {
	float: right;
}

.btn_more {
	margin-top: 15px;
}
</style>
</head>
<body>
	<form action="#" id="actionForm" method="post">
		<input type="hidden" name="blogNo" id="blogNo" value="${data.BM_NO}" />
		<input type="hidden" name="bNo" id="bNo" value="${data.B_NO}" />
		<input type=hidden id="bmNo" name="bmNo" value="${sBmNo}" />
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
			<div class="area_b">
				<div class="gbn">글수정</div>
				<table colspan="1">
					<tbody>
						<tr>
							<th class="table_attr">제목</th>
							<td><input type="text" class="txt_s" name="bTitle" value="${data.B_TITLE}"
								id="bTitle" placeholder="제목을 입력하세요." style="width: 400px;" /></td>
						</tr>
						<tr>
							<th class="table_attr">작성자</th>
							<td><input type="text" class="txt_s" name="bWriter"
								id="bWriter" readonly="readonly" value="${sBmNm}" /></td>
						</tr>
						<tr>
							<th class="table_attr">카테고리</th>
							<td><select class="txt_s" id="cNo" name="cNo">
							</select></td>
						</tr>
						<tr>
							<td colspan="2"><textarea class="txt" name="bCon" id="bCon"
									rows="10" cols="20">${data.B_CON}</textarea></td>
						</tr>
						<tr>
							<th class="table_attr">테마</th>
						</tr>
						<tr style="border: 1px solid #AEAEAE;">
							<td class="td_radio" colspan="2">
								<div class="area_radio">
									<input type="radio" id="tag0" name="tag" value="0" />
									<label for="tag0">없음</label></br>
									<input type="radio" id="tag1" name="tag" value="1" />
									<label for="tag1">영화</label></br>
									<input type="radio" id="tag2" name="tag" value="2" />
									<label for="tag2">게임</label></br>
									<input type="radio" id="tag3" name="tag" value="3" />
									<label for="tag3">애니메이션</label></br>
									<input type="radio" id="tag4" name="tag" value="4" />
									<label for="tag4">만화</label></br>
									<input type="radio" id="tag5" name="tag" value="5" />
									<label for="tag5">도서</label></br>
									<input type="radio" id="tag6" name="tag" value="6" />
									<label for="tag6">동물</label></br>
								</div>
								<div class="area_radio">
									<input type="radio" id="tag7" name="tag" value="7" />
									<label for="tag7">음악</label></br>
									<input type="radio" id="tag8" name="tag" value="8" />
									<label for="tag8">공연&전시</label></br>
									<input type="radio" id="tag9" name="tag" value="9" />
									<label for="tag9">음식</label></br>
									<input type="radio" id="tag10" name="tag" value="10" />
									<label for="tag10">사진</label></br>
									<input type="radio" id="tag11" name="tag" value="11" />
									<label for="tag11">패션&뷰티</label></br>
									<input type="radio" id="tag12" name="tag" value="12" />
									<label for="tag12">연애</label></br>
								</div>
								<div class="area_radio">
									<input type="radio" id="tag13" name="tag" value="13" />
									<label for="tag13">여행</label></br>
									<input type="radio" id="tag14" name="tag" value="14" />
									<label for="tag14">개그</label></br>
									<input type="radio" id="tag15" name="tag" value="15" />
									<label for="tag15">일상</label></br>
									<input type="radio" id="tag16" name="tag" value="16" />
									<label for="tag16">육아</label></br>
									<input type="radio" id="tag17" name="tag" value="17" />
									<label for="tag17">IT</label></br>
								</div>
								<div class="area_radio">
									<input type="radio" id="tag18" name="tag" value="18" />
									<label for="tag18">자동차</label></br>
									<input type="radio" id="tag19" name="tag" value="19" />
									<label for="tag19">스포츠</label></br>
									<input type="radio" id="tag20" name="tag" value="20" />
									<label for="tag20">뉴스</label></br>
									<input type="radio" id="tag21" name="tag" value="21" />
									<label for="tag21">인문사회</label></br>
									<input type="radio" id="tag22" name="tag" value="22" />
									<label for="tag22">역사</label></br>
									<input type="radio" id="tag23" name="tag" value="23" />
									<label for="tag23">세계</label></br>
									<input type="radio" id="tag24" name="tag" value="24" />
									<label for="tag24">과학</label></br>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="btn_area">
					<div class="btn" id="updateBtn" style="margin-right: 20px;">수정</div>
					<div class="btn" id="cancleBtn">취소</div>
				</div>
			</div>
			<div class="area_bot"
				style="background-color: #375D81; border-top: 7px solid #00214B;"></div>
		</div>
	</form>
</body>
</html>