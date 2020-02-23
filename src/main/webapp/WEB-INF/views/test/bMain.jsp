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
	
	/* 비로그인시 회원정보수정 버튼 감추기 */
	if($.trim($("#bmNo").val()) != "") {
		$("#bmUpdateBtn").css("display", "inline-block");
	} else {
		$("#bmUpdateBtn").css("display", "none");
	}
	
	/* 로그아웃 */
	$("#bLogoutBtn").on("click", function() {
		location.href = "bLogout";
	});
	
	/* 글쓰기 */
	$("#bWriteBtn").on("click", function() {
		location.href = "bWrite";
	});
	
	/* 클릭시 상세페이지로 이동 */
	$("tbody").on("click", "tr", function() {
		$("#bNo").val($(this).attr("name"));
		$("#bMainForm").attr("action", "bDetail");
		$("#bMainForm").submit();
	});
	
	/* 회원정보 수정 */
	$("#bmUpdateBtn").on("click", function() {
		$("#bMainForm").attr("action", "bmUpdate");
		$("#bMainForm").submit();
	});
	
	/* 페이징 */
	$(".paging_area").on("click", "span", function() {
		$("#page").val($(this).attr("name"));
		$("#bMainForm").attr("action", "bMain");
		$("#bMainForm").submit();
 	});
});
</script>
<style type="text/css">
.area {
	display: inline-block;
	width: 1080px;
}

.bar {
	display: block;
	height: 35px;
	margin-bottom: 20px;
	border-bottom: 4px ridge #5a6ff2;
}

.gbn {
	display: block;
	font-size: 15pt;
	margin-bottom: 10px;
	font-weight: bold;
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
	margin-right: 10px;
	background-color: #6e81df;
	border: 1px solid #5a6ff2;
	color: #FFFFFF;
	outline: none;
}

.btn:hover {
	cursor: pointer;
}

.btn_Con {
	display: inline-block;
	width: 80px;
	height: 30px;
	margin-right: 30px;
	background-color: #FFFFFF;
	border: 1px solid #D3D3D3;
	color: #333333;
	outline: none;
}

.btn_Con:hover {
	cursor: pointer;
}

#bWriteBtn {
	float: right;
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
/* 위에는 공용 */
table {
	font-size: 10pt;
	border-collapse: collapse;
	width: 100%;
	min-width: 1080px;
	margin-bottom: 20px;
}

#table_attr {
	text-align: center;
	font-size: 10pt;
	border-top: 1px solid #000000;
	height: 50px;
}

tr {
	border-bottom: 1px solid #F2F2F2;
}

tr:hover {
	cursor: pointer;
}

.table_con {
	height: 40px;
}

#tr_Bno, #tr_Bdt, #tr_Bhit {
	text-align: center;
}
</style>
</head>
<body>
<form action="#" id="bMainForm" method="post">
		<input type="hidden" name="page" id="page" value="${page}" /> <input
			type="hidden" name="bmNo" id="bmNo" value="${bMemNo}" /> <input
			type="hidden" name="bNo" id="bNo" />
		<div class=area>
			<div class="bar">
				<span id="userbar"><b>${bMemNm}</b>님 환영합니다.</span> <input
					type="button" class="btn" name="bLogoutBtn" id="bLogoutBtn"
					value="로그아웃" /> <input type="button" class="btn" name="bmUpdateBtn"
					id="bmUpdateBtn" value="회원정보수정" />
			</div>
			<div class="middle">
				<span class="gbn">게시판</span>
				<table colspan="1">
					<colgroup>
						<col width="60px" />
						<col width="(100% - 500px)cals" />
						<col width="120px" />
						<col width="100px" />
						<col width="60px" />
					</colgroup>

					<thead>
						<tr id="table_attr">
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="data" items="${list}">
							<tr class="table_con" name="${data.B_NO}">
								<td id="tr_Bno">${data.B_NO}</td>
								<td id="tr_Btitle">${data.B_TITLE}</td>
								<td id="tr_Bnm">${data.BM_NM}</td>
								<td id="tr_Bdt">${data.B_DT}</td>
								<td id="tr_Bhit">${data.B_HIT}</td>
							<tr>
						</c:forEach>
					</tbody>
				</table>
				<input type="button" name="bWriteBtn" id="bWriteBtn" class="btn_Con"
					value="글쓰기" />
			</div>
			<div class="bottom">
				<div class="paging_area">
					<!-- 첫페이지 -->
					<span name="1">처음</span>
					<!-- 이전페이지 -->
					<c:choose>
						<c:when test="${page eq 1}">
							<span name="1">이전</span>
						</c:when>
						<c:otherwise>
							<span name="${page - 1}">이전</span>
						</c:otherwise>
					</c:choose>
					<!-- 일반페이지 -->
					<c:forEach var="p" begin="${pb.startPcount}" end="${pb.endPcount}"
						step="1">
						<c:choose>
							<c:when test="${page eq p}">
								<b>${p}</b>
							</c:when>
							<c:otherwise>
								<span name="${p}">${p}</span>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- 다음페이지 -->
					<c:choose>
						<c:when test="${page eq pb.maxPcount}">
							<span name="${pb.maxPcount}">다음</span>
						</c:when>
						<c:otherwise>
							<span name="${page + 1}">다음</span>
						</c:otherwise>
					</c:choose>
					<!-- 마지막 -->
					<span name="${pb.maxPcount}">마지막</span>
				</div>
			</div>
		</div>
	</form>					
</body>
</html>