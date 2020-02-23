<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블로그</title>
<link rel="stylesheet" type="text/css"
	href="../resources/css/blog/main.css">
<link rel="stylesheet" type="text/css"
	href="../resources/css/blog/btn.css">
<link rel="stylesheet" type="text/css"
	href="../resources/css/blog/input.css">
<link rel="stylesheet" type="text/css"
	href="../resources/css/blog/layout.css">
<script type="text/javascript"
	src="../resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		reloadList();
		reloadCateList();
		reloadData();

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
		
		/* 게시글없을때 */
		if($.trim($("#bNo").val()) == "") {
			$("#postBtnAdmin").css("display", "none");
			$("#postCommentArea").css("display", "none");
		} else {
			$("#postBtnAdmin").css("display", "inline-block");
			$("#postCommentArea").css("display", "inline-block");
		}
		
		/* 수정, 삭제버튼, 카테고리 편집버튼*/
		if($("#bmNo").val() != $("#blogNo").val()) {
			$("#postBtnAdmin").css("display", "none");
			$("#editCateBtn").css("display", "none");
		} else {
			$("#postBtnAdmin").css("display", "inline-block");
			$("#editCateBtn").css("display", "inline-block");
		}
		
		/* --------------------------------------버튼영역-------------------------------------- */
		
		/* 로고 */
		$(".logo").on("click", function() {
			$("#actionForm").attr("action", "../blogMain");
			$("#actionForm").submit();
		});
		
		/* 로그아웃 */
		$("#logoutBtn_s").on("click", function() {
			location.href = "../blogLogout";
		});

		/* 로그인 */
		$("#loginBtn_s").on("click", function() {
			location.href = "../blogLogin";
		});
		
		/* 새글쓰기 */
		$("#writeBtn_s").on("click", function() {
			$("#actionForm").attr("action", "../blogWrite");
			$("#actionForm").submit();
		});
		
		$("#blogBtn_s").on("click", function() {
			$("#bmNm").val($("#bmNm_s").html());
			$("#actionForm").attr("action", $("#bmNo").val());
			$("#actionForm").submit();
		});
		
		/* 수정 */
		$("#updateBtn").on("click", function() {
			if($.trim($("#bNo").val()) == "") {
				alert("수정할 게시글이 없습니다.");
			} else {
			$("#actionForm").attr("action", "../blogUpdate");
			$("#actionForm").submit();
			}
		});
		
		/* 삭제 */
		$("#deleteBtn").on("click", function() {
			if($.trim($("#bNo").val()) == "") {
				alert("삭제할 게시글이 없습니다.");
			} else {
				if(confirm("삭제하시겠습니까?")) {
				$("#actionForm").attr("action", "../blogDelete");
				$("#actionForm").submit();
				}
			}
		});
		
		/* 덧글목록 */
		$("#commentListBtn").on("click", function() {
			if($("#postCommentArea").css("display") == "inline-block") {
				$("#postCommentArea").css("display", "none");
			} else {
				$("#postCommentArea").css("display", "inline-block");
			}
		});

		/* 카테고리 편집 */
		$("#editCateBtn").on("click", function() {
			if ($(".edit_cate_area").css("display") == "inline-block") {
				$(".edit_cate_area").css("display", "none");
			} else {
				$(".edit_cate_area").css("display", "inline-block");
			}
		});
		
		/* 블로그 베너 */
		$("#blogBanner").on("click", function() {
			$("#bNo").val("");
			$("#actionForm").attr("action", $("#blogNo").val());
			$("#actionForm").submit();
		});

		/* 카테고리 저장 */
		$("#insertCateBtn").on("click", function() {
			var params = $("#actionForm").serialize();

			$.ajax({
				type : "post", //데이터 전송방식
				url : "../cateAddAjax", //주소
				dataType : "json", //데이터 전송 규칙
				data : params, //보낼 데이터
				// {키:값, 키:값,...} -> json
				success : function(result) {
					if (result.res == "SUCCESS") {
						alert("카테고리가 추가되었습니다.");
					} else {
						alert("카테고리 추가가 실패하였습니다.");
					}
				},
				error : function(request, status, error) {
					console.log("status : " + request.status);
					console.log("text : " + request.reponseText);
					console.log("error : " + error);
				}
			});
		});

		/* 게시글 목록 페이징 */
		$(".area_paging").on("click", "span", function() {
			if ($(this).attr("name") != "") {
				$("#page").val($(this).attr("name"));
				reloadList();
			}
		});
		
		/* 덧글 목록 페이징 */
		$(".area_paging_comment").on("click", "span", function() {
			if ($(this).attr("name") != "") {
				$("#commentPage").val($(this).attr("name"));
				reloadCommentList();
			}
		});

		/* 게시글 목록 */
		$(".area_list_post").on("click", "tr", function() {
			$("#bNo").val($(this).attr("name"));
			$("#commentPage").val(1);
			reloadList();
			reloadData();
		});

		/* 카테고리 목록 */
		$(".list_cate").on("click", "tr", function() {
			$("#cNo").val($(this).attr("name"));
			$("#title_post").val($(this).children(".td_left_content").html());
			reloadList();
			reloadCateList();
		});
		
		/* 목록닫기 */
		$("#listHiddenBtn").on("click", function() {
			if($(".post_contents").css("display") == "block"){
				$(".post_contents").css("display", "none");
			} else {
				$(".post_contents").css("display", "block");
			}
		});
		
		/* 덧글 텍스트 제한 */
		$("#commentField").on("keyup", function() {
			var keyCnt = $(this).val();
			
			$("#commentCnt").html(keyCnt.length);
			 if(keyCnt.length > 200) {
				 alert("최대 200글자 까지만 입력 가능합니다.");
				 $("#commentField").val(keyCnt.substring(0, 200));
				 $("#commentCnt").html(200);
			 }
		});
		
		/* 덧글쓰기 */
		$("#commentBtn").on("click", function() {
			if($("#bmNo").val() == "") {
				alert("로그인 후 작성해주세요.");
			} else {
				var params = $("#actionForm").serialize();

				$.ajax({
					type : "post", //데이터 전송방식
					url : "../bCommentInsertAjax", //주소
					dataType : "json", //데이터 전송 규칙
					data : params, //보낼 데이터
					// {키:값, 키:값,...} -> json
					success : function(result) {
						if (result.res == "SUCCESS") {
							$("#commentField").val("");
							reloadCommentList();
						} else {
							alert("덧글 작성에 실패하였습니다.");
							console.log(result.res);
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
	});

	/* 게시글 목록 불러오기 */
	function reloadList() {
		var params = $("#actionForm").serialize();

		$.ajax({
			type : "post", //데이터 전송방식
			url : "../listAjax", //주소
			dataType : "json", //데이터 전송 규칙
			data : params, //보낼 데이터
			// {키:값, 키:값,...} -> json
			success : function(result) {
				if(result.list == null) {
					result.list == 0;
				}
				redrawList(result.list);
				redrawPaging(result.pb);
			},
			error : function(request, status, error) {
				console.log("text : " + request.reponseText);
				console.log("error : " + error);
			}
		});
	}

	/* 게시글 목록 나타내기 */
	function redrawList(list) {
		var html = "";
		if (list.length == 0) {
			html += "<tr>";
			html += "<td colspan=\"5\">조회된 데이터가 없습니다.</td>";
			html += "</tr>";
			
		} else {
			for ( var i in list) {
					if(i == 0 && $.trim($("#bNo").val()) == "") {
						$("#bNo").val(list[i].B_NO);
						reloadData();
					}
					if($("#bNo").val() == list[i].B_NO) {
						html += "<tr class=\"tr_list\" name=\"" + list[i].B_NO + "\">";
						html += "<td class=\"td_list_left\"><b>" + list[i].B_TITLE
								+ "</b></td>";
						html += "<td class=\"td_list_right\">" + list[i].B_DT + "</td>";
						html += "</tr>";
					} else {
					html += "<tr class=\"tr_list\" name=\"" + list[i].B_NO + "\">";
					html += "<td class=\"td_list_left\">" + list[i].B_TITLE
							+ "</td>";
					html += "<td class=\"td_list_right\">" + list[i].B_DT + "</td>";
					html += "</tr>";
					}
				}
			}
		$(".area_list_post").html(html);
	}

	/* 페이징 */
	function redrawPaging(pb) {
		var html = "";
		//처음
		html += "<span class=\"btn_paging\" name=\"1\">처음</span>&nbsp;";

		//이전
		if ($("#page").val() == "1") {
			html += "<span class=\"btn_paging\" name=\"1\">이전</span>&nbsp;";
		} else {
			html += "<span class=\"btn_paging\" name=\""
					+ ($("page").val() * 1 - 1) + "\">이전</span>&nbsp;";
		}

		//숫자
		for (var i = pb.startPcount; i <= pb.endPcount; i++) {
			if ($("#page").val() == i) {
				html += "<span class=\"btn_paging\" ><b>" + i
						+ "</b></span>&nbsp;";
			} else {
				html += "<span class=\"btn_paging\" name=\"" + i + "\">" + i
						+ "</span>&nbsp;";
			}
		}

		//다음
		if ($("#page").val() == pb.maxPcount) {
			html += "<span class=\"btn_paging\" name=\"" + pb.maxPcount + "\">다음</span>&nbsp;";
		} else {
			html += "<span class=\"btn_paging\" name=\""
					+ ($("page").val() * 1 + 1) + "\">다음</span>&nbsp;";
		}

		//마지막
		html += "<span class=\"btn_paging\" name=\"" + pb.maxPcount + "\">끝</span>";

		$("#areaPaging").html(html);
	}
	
	/* 게시판 가져오기 */
	function reloadData() {
		var params = $("#actionForm").serialize();

		$.ajax({
			type : "post", //데이터 전송방식
			url : "../detailAjax", //주소
			dataType : "json", //데이터 전송 규칙
			data : params, //보낼 데이터
			// {키:값, 키:값,...} -> json
			success : function(result) {
				if(result.data == null) {
					result.data == 0;
				}
				redrawData(result.data);
			},
			error : function(request, status, error) {
				console.log("text : " + request.reponseText);
				console.log("error : " + error);
			}
		});
	}
	
	/* 게시판 나타내기 */
	function redrawData(data) {
		var html = "";
		if (data.length == 0) {
			html += "<tr>";
			html += "<td colspan=\"5\">조회된 데이터가 없습니다.</td>";
			html += "</tr>";
			
		} else {
				html += "<div class=\"post_title_area\">";
				html += "<span class=\"post_date\">" + data.B_DT + "</span><br />";
				if(data.C_NAME == null) {
					html += "<span class=\"post_title\">" + data.B_TITLE + "</span><span class=\"post_cate\">미분류</span>";
				} else {
				html += "<span class=\"post_title\">" + data.B_TITLE + "</span><span class=\"post_cate\">" + data.C_NAME + "</span>";					
				}
				html += "</div>";
				html += "<div class=\"post_con_area\">" + data.B_CON + "</div>";
			}
		$("#postTopArea").html(html);
		
		reloadCommentList();
		}

	/* 카테고리 목록 가져오기 */
	function reloadCateList() {
		var params = $("#actionForm").serialize();

		$.ajax({
			type : "post", //데이터 전송방식
			url : "../cateListAjax", //주소
			dataType : "json", //데이터 전송 규칙
			data : params, //보낼 데이터
			// {키:값, 키:값,...} -> json
			success : function(result) {
				redrawCateList(result.cateList, result.cnt);
			},
			error : function(request, status, error) {
				console.log("text : " + request.reponseText);
				console.log("error : " + error);
			}
		});
	}

	/* 카태고리 목록 나타내기 */
	function redrawCateList(cateList, cnt) {
		var html = "";
		if (cateList.length == 0) {
			html += "<tr>";
			html += "<td class=\"td_left_content\">전체</td>";
			html += "<td class=\"td_left_cnt\">(" + cnt + ")</td>";
			html += "</tr>";
		} else {
			html += "<tr>";
			html += "<td class=\"td_left_content\">전체</td>";
			html += "<td class=\"td_left_cnt\">(" + cnt + ")</td>";
			html += "</tr>";
			for ( var i in cateList) {
				html += "<tr name=\"" + cateList[i].C_NO + "\">";
				html += "<td class=\"td_left_content\">" + cateList[i].C_NAME
						+ "</td>";
				html += "<td class=\"td_left_cnt\">(" + cateList[i].C_CNT
						+ ")</td>";
				html += "</tr>";
			}
		}
		$("#listCate").html(html);
	}
	
	/* 카테고리 드롭다운리스트 나타내기 */
	function redrawCateSelect(cateList, cnt) {
		var html = "";
		if (cateList.length == 0) {
		} else {
			for ( var i in cateList) {
				html += "<option value=\"" + cateList[i].C_NO + "\">" + cateList[i].C_NAME + "</option>";
			}
		}
		$("#delCNo").html(html);
	}
	
	/* 덧글 목록 가져오기 */
	function reloadCommentList() {
		var params = $("#actionForm").serialize();

		$.ajax({
			type : "post", //데이터 전송방식
			url : "../bCommentListAjax", //주소
			dataType : "json", //데이터 전송 규칙
			data : params, //보낼 데이터
			// {키:값, 키:값,...} -> json
			success : function(result) {
				redrawCommentList(result.commentList);
				redrawCommentCnt(result.commentCnt);
				redrawCommentPaging(result.commentPB);
			},
			error : function(request, status, error) {
				console.log("text : " + request.reponseText);
				console.log("error : " + error);
			}
		});
	}
	
	/* 덧글 목록 나타내기 */
	function redrawCommentList(commentList) {
		var html = "";
		if (commentList.length == 0) {
			html += "<li>";
			html += "<span colspan=\"5\" style=\"font-size: 10pt\">조회된 데이터가 없습니다.</span>";
			html += "</li>";
		} else {
			for ( var i in commentList) {
					html += "<li class=\"comment_item\">"
					html += "<div class=\"comment_info\">"
					/* html += "<img class=\"comment_img\" /> <span class=\"comment_name\">" + commentList[i].BM_NM + "</span>" */
					html += "<span class=\"comment_name\">" + commentList[i].BM_NM + "</span>"
					html += "<span class=\"comment_date\">" + commentList[i].CMT_DT + "</span>"
					html += "</div>"
					html += "<div class=\"comment\">" + commentList[i].CMT_CON + "</div>"
					html += "</li>"
					}
				}
		$("#commentList").html(html);
	}
	
	/* 덧글 갯수 나타내기 */
	function redrawCommentCnt(commentCnt) {
		var html = "";
				html += "덧글(" + commentCnt+ ")"
		$("#commentListBtn").html(html);
	}
	
	/* 덧글 목록 페이징 */
	function redrawCommentPaging(commentPB) {
		var html = "";
		//처음
		html += "<span class=\"btn_paging\" name=\"1\">처음</span>&nbsp;";

		//이전
		if ($("#commentPage").val() == "1") {
			html += "<span class=\"btn_paging\" name=\"1\">이전</span>&nbsp;";
		} else {
			html += "<span class=\"btn_paging\" name=\""
					+ ($("commentPage").val() * 1 - 1) + "\">이전</span>&nbsp;";
		}

		//숫자
		for (var i = commentPB.startPcount; i <= commentPB.endPcount; i++) {
			if ($("#commentPage").val() == i) {
				html += "<span class=\"btn_paging\" ><b>" + i
						+ "</b></span>&nbsp;";
			} else {
				html += "<span class=\"btn_paging\" name=\"" + i + "\">" + i
						+ "</span>&nbsp;";
			}
		}
		
		//다음
		if ($("#commentPage").val() == commentPB.maxPcount) {
			html += "<span class=\"btn_paging\" name=\"" + commentPB.maxPcount + "\">다음</span>&nbsp;";
		} else {
			html += "<span class=\"btn_paging\" name=\""
					+ ($("commentPage").val() * 1 + 1) + "\">다음</span>&nbsp;";
		}

		//마지막
		html += "<span class=\"btn_paging\" name=\"" + commentPB.maxPcount + "\">끝</span>";

		$(".area_paging_comment").html(html);
	}
	
	/* 아카이브 목록 가져오기 */
/* 	function reloadArchiveList() {
		var params = $("#actionForm").serialize();

		$.ajax({
			type : "post", //데이터 전송방식
			url : "../archiveListAjax", //주소
			dataType : "json", //데이터 전송 규칙
			data : params, //보낼 데이터
			// {키:값, 키:값,...} -> json
			success : function(result) {
				redrawArchiveList(result.archiveList);
			},
			error : function(request, status, error) {
				console.log("text : " + request.reponseText);
				console.log("error : " + error);
			}
		});
	} */

	/* 카태고리 목록 나타내기 */
	function redrawArchiveList(archiveList) {
		var html = "";
		if (archiveList.length == 0) {
			html += "<tr>";
			html += "<td class=\"td_left_content\">작성된 게시글이 없습니다.</td>";
			html += "<td class=\"td_left_cnt\"></td>";
			html += "</tr>";
		} else {
			for ( var i in archiveList) {
			html += "<tr>"
			html += "<td class=\"td_left_content\">" + archiveList[i].B_DT + "</td>"
			html += "<td class=\"td_left_cnt\">(" + archiveList[i].CNT + ")</td>"
			html += "</tr>"
			}
		}
		$("#archiveListTbody").html(html);
	}
	
</script>
<style type="text/css">
body {
	background-color: #ABC8E2;
}

.area {
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

.btn_txt {
	float: right;
	margin-top: 10px;
}

.btn_more {
	margin-top: 15px;
}
</style>
</head>
<body>
	<form action="#" id="actionForm" method="post">
		<input type="hidden" name="page" id="page" value="1" />
		<input type="hidden" name="commentPage" id="commentPage" value="1" />
		<input type="hidden" name="bNo" id="bNo" value="${param.bNo}" />
		<input type=hidden id="bmNo" name="bmNo" value="${sBmNo}" />
		<input type=hidden id="blogNo" name="blogNo" value="${blogNo}" />
		<input type=hidden id="bmNm" name="bmNm" value="${blogInfo.BM_NM}" />
		<input type=hidden id="cNo" name="cNo" value="" />
		<div class="bar_wrap"></div>
		<div class="area">
			<div class="bar" id="logoutBar">
				<img class="logo" id="blLogo" src="../resources/images/logo_small.png" />
				<div class="btn_txt" id="loginBtn_s">로그인</div>
			</div>
			<div class="bar" id="loginBar">
				<img class="logo" id="blLogo" src="../resources/images/logo_small.png" />
				<div class="btn_txt" id="logoutBtn_s">로그아웃</div>
				<div class="btn_txt" id="writeBtn_s">새글쓰기</div>
				<div class="btn_txt" id="blogBtn_s">내블로그</div>
				<div class="btn_txt" id="bmNm_s" name="bmNm_s" style="font-weight: bold;">${sBmNm}님</div>
			</div>
			<!-- <div class="area_top">
		</div> -->
			<div class="area_mid">
				<div class="area_left">
					<%-- <div class="area_left_profile">
						<img src="../resources/images/kitty.png" class="img_profile" />
						<textarea class="comment_profile" readonly="readonly">아무개의 블로그입니다!</textarea>
						<input type="text" class="name_profile" id="pname"
							readonly="readonly" value="by ${bmNm}" />
					</div> --%>
					<!-- <div class="area_left_calender"></div> 추후 구현 -->
					<div class="area_left_cateList">
						<div class="left_menu_title">카테고리</div>
						<table>
							<tbody class="list_cate" id="listCate">
								<tr name="0">
						    	<th class="td_cateName">전체</th>
								<td class="cnt_cate">(0)</td>
								</tr>
							</tbody>
						</table>
						<div class="btn_s" id="editCateBtn">편집</div>
						<div class="edit_cate_area" style="display: none;">
							<div class="add_cate_area">
								<span style="font-size: 9pt;">카테고리명</span> <input type="text"
									class="txt_s" id="insertCate" name="insertCate" value="" />
								<div class="btn_s" id="insertCateBtn">추가</div>
							</div>
							<!-- <div class="del_cate_area">
								<span style="font-size: 9pt;">카테고리명</span>
								<select class="txt_s" id="delCNo" name="delCNo">
								</select>
								<div class="btn_s" id="deleteCateBtn">삭제</div>
							</div> -->
						</div>
					</div>
					<!-- <div class="area_left_monthList">
						<div class="left_menu_title">이전글 목록</div>
						<table>
							<tbody class="left_menu_tbody" id="archiveListTbody">
							아카이브 목록 공간
							</tbody>
						</table>
					</div> -->
					<!-- <div class="area_left_latestComment">
						<div class="left_menu_title">최근 덧글</div>
						<table>
							<tbody>
								<tr>
									<td class="td_left_content">덧글1</td>
								</tr>
								<tr>
									<td class="td_left_data">by 작성자 날짜</td>
								</tr>
								<tr>
									<td class="td_left_content">덧글2</td>
								</tr>
								<tr>
									<td class="td_left_data">by 작성자 날짜</td>
								</tr>
								<tr>
									<td class="td_left_content">덧글3</td>
								</tr>
								<tr>
									<td class="td_left_data">by 작성자 날짜</td>
								</tr>
								<tr>
									<td class="td_left_content">덧글4</td>
								</tr>
								<tr>
									<td class="td_left_data">by 작성자 날짜</td>
								</tr>
								<tr>
									<td class="td_left_content">덧글5</td>
								</tr>
								<tr>
									<td class="td_left_data">by 작성자 날짜</td>
								</tr>
							</tbody>
						</table>
					</div> -->
				</div>
				<div class="area_right">
					<div class="area_right_banner">
						<span class="txt_banner" id="blogBanner">${blogInfo.BM_NM}의 블로그</span>
					</div>
					<div class="area_right_postList">
						<div class="post">
							<div class="wrap_title_post">
								<span class="title_post">카테고리 : <input type="text"
									class="titlePost" id="title_post" name="title_post" value="전체"
									readonly="readonly"
									style="border: none; outline: none; margin: 0px; width: auto;""></span>
								<div class="btn_hidden" id="listHiddenBtn">목록닫기</div>
							</div>
							<div class="post_contents" style="display: block;">
								<table>
									<tbody class="area_list_post">
										<tr>
											<td>조회된 데이터가 없습니다.</td>
										</tr>
									</tbody>
								</table>
								<div class="area_paging" id="areaPaging">
								</div>
							</div>
						</div>
					</div>
					<div class="area_right_post" id="postArea">
						<div class="post_top_area" id="postTopArea">
						<!-- 게시글 영역 -->
						</div>
						<div class="post_btn_area" id="postBtnArea">
						<!-- 수정 삭제, 덧글버튼 영역 -->
							<div class="post_btn_admin" id="postBtnAdmin" style="display: inline-block;">
							<div class="btn_txt_s" id="updateBtn">수정</div>
							<div class="btn_txt_s" id="deleteBtn">삭제</div>
							</div>
							<div class="btn_txt_s" id="commentListBtn" style="float: right; border: 0px;"></div>
						</div>
					</div>
						<div class="post_comment_area" id="postCommentArea">
							<h3 style="font-size: 12pt; border-bottom: 1px solid #AEAEAE; color: #333333">덧글</h3>
							<!-- 작성한 덧글 리스트  / 반복문 사용 -->
							<ul class="comment_list" id="commentList" style="padding: 0px;">
								<span>작성된 덧글이 없습니다.</span>
							</ul>
							<div class="area_paging_comment">
							</div>
							<div class="comment_info" style="background-color: #FFFFFF;">
								<!-- <img class="comment_img" /> --> <span class="comment_name">${sBmNm}</span>
								<br />
								<textarea id="commentField" name="commentField"
									class="comment_field" rows="8" cols="100"></textarea>
								<br />
								<div class="comment_bottom_area">
								<span class="font_s" id="commentCnt"></span>
								<span class="font_s">/200</span>
								<div class="btn_txt" id="commentBtn"
									style="float: none; margin: 0;">덧글올리기</div>								
								</div>
							</div>
						</div>
				</div>
			</div>
			<div class="area_bot"
				style="background-color: #375D81; border-top: 7px solid #00214B;"></div>
		</div>
	</form>
</body>
</html>