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
	reloadList();
	
	/* 로그아웃 */
	$("#logoutBtn").on("click", function() {
		location.href = "aLogout";
	});
	
	$("#loginBtn").on("click", function() {
		location.href = "aLogin";
	});
	
	$("#searchBtn").on("click", function() {
		$("#page").val("1");
		reloadList();
	});
	
	$("#searchTxt").on("keypress", function() {
		if (event.keyCode == 13) {
			$("#searchBtn").click();
			return false;
		}
	});
	
	$("#writeBtn").on("click", function() {
		$("#actionForm").attr("action", "aWrite");
		$("#actionForm").submit();
	});
	
	$(".paging_area").on("click", "span", function() {
		if($(this).attr("name") != "") {
			$("#page").val($(this).attr("name"));
			reloadList();
		}
	});
	
	$("tbody").on("click", "tr", function() {
		$("#bNo").val($(this).attr("name"));
		$("#actionForm").attr("action", "aDetail");
		$("#actionForm").submit();
	});
});

function reloadList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post", //데이터 전송방식
		url : "aListAjax", //주소
		dataType : "json", //데이터 전송 규칙
		data : params, //보낼 데이터
		// {키:값, 키:값,...} -> json
		success : function(result) {
			redrawList(result.list);
			redrawPaging(result.pb);
		},
		error : function(request, status, error) {
			console.log("text : " + request.reponseText);
			console.log("error : " + error);
		}
	});
}

function redrawList(list) {
	var html = "";
	if(list.length == 0) {
		html += "<tr>";
		html += "<td colspan=\"5\">조회된 데이터가 없습니다.</td>";
		html += "</tr>";
	} else {
		for(var i in list) {
			html += "<tr name=\"" + list[i].B_NO + "\">";
			html += "<td class=\"td_Bno\">" + list[i].B_NO + "</td>";
			html += "<td class=\"td_Btitle\">" + list[i].B_TITLE + "</td>";
			html += "<td class=\"td_Bnm\">" + list[i].BM_NM + "</td>";
			html += "<td class=\"td_Bdt\">" + list[i].B_DT + "</td>";
			html += "<td class=\"td_Bhit\">" + list[i].B_HIT + "</td>";
			html += "</tr>";
		}
	}
	$("tbody").html(html);
}

function redrawPaging(pb) {
	var html = "";
	//처음
	html += "<span name=\"1\">처음</span>&nbsp;";
	
	//이전
	if($("#page").val() == "1") {
		html += "<span name=\"1\">이전</span>&nbsp;";
	} else {
		html += "<span name=\"" + ($("page").val() * 1 - 1) + "\">이전</span>&nbsp;";
	}
	
	//숫자
	for(var i = pb.startPcount ; i <= pb.endPcount ; i++) {
		if($("#page").val() == i) {
			html += "<span><b>" + i + "</b></span>&nbsp;";	
		} else {
			html += "<span name=\"" + i + "\">" + i + "</span>&nbsp;";
		}
	}
	
	//다음
	if($("#page").val() == pb.maxPcount) {
		html += "<span name=\"" + pb.maxPcount + "\">다음</span>&nbsp;";
	} else {
		html += "<span name=\"" + ($("page").val() * 1 + 1) + "\">다음</span>&nbsp;";
	}
	
	//마지막
	html += "<span name=\"" + pb.maxPcount + "\">마지막</span>";
	
	$(".paging_area").html(html);
}
</script>
<style type="text/css">
.area {
	display: inline-block;
	width: 1080px;
	padding-left: 20px;
	padding-right: 20px;
}

.area_user {
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
	height: 26px;
	background-color: #FFFFFF;
	border: 1px solid #D3D3D3;
	color: #333333;
	outline: none;
	vertical-align: middle;
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

.txt_Con {
	display: inline-block;
	width: 300px;
	height: 20px;
	vertical-align: middle;
}

.select_Sch {
	display: inline-block;
	width: auto;
	height: 26px;
	vertical-align: middle;
}

.area_Search {
	margin-top: 10px;
	margin-bottom: 10px;
}
/* 위에는 공용 */
table {
	font-size: 10pt;
	border-collapse: collapse;
	width: 1080px;
	min-width: 720px;
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

.td_Bno, .td_Bdt, .td_Bhit {
	text-align: center;
}

#writeBtn {
	float: right;
}

.area_bottom {
	display: block;
	width: 1080px;
}
</style>
</head>
<body>
${list.B_NO}
<div class="area">
<div class="area_user">
<c:choose>
	<c:when test="${!empty sBmNo}">
		<span id="userbar"><b>${sBmNm}</b>님 환영합니다.</span>
		<input type="button" class="btn" name="logoutBtn" id="logoutBtn" value="로그아웃"/>		
	</c:when>
	<c:otherwise>
		<input type="button" class="btn" name="loginBtn" value="로그인" id="loginBtn" />
	</c:otherwise>
</c:choose>
</div>
<div class="area_Gbn">
<span class="gbn">게시판</span>
</div>
<table colspan="1">
		<colgroup>
			<col width="60px" />
			<col width="(100% - 700px)cals" />
			<col width="120px" />	
			<col width="100px" />
			<col width="60px" />
		</colgroup>
	<thead>
		<tr>
			<th class="th_Bno">번호</th>
			<th class="th_Btitle">제목</th>
			<th class="th_Bwriter">작성자</th>
			<th class="th_Bdt">작성일</th>
			<th class="th_Bhit">조회수</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td colspan="5">조회된 데이터가 없습니다.</td>
		</tr>
	</tbody>
</table>
<div class="area_bottom">
<c:if test="${!empty sBmNo}">
			<input type="button" class="btn_Con" value="등록" id="writeBtn" />
</c:if>
<div class="paging_area">
	<span>처음</span>
	<span>이전</span>
	<span>1</span>
	<span>다음</span>
	<span>마지막</span>
</div>
<form action="#" id="actionForm" method="post">
	<input type="hidden" name="page" id="page" value="1"/>
	<input type="hidden" name="bNo" id="bNo" value="1"/>
	<div class="area_Search">
		<select name="searchGbn" class="select_Sch">
			<option value="0">제목</option>
			<option value="1">작성자</option>
			<option value="2">제목 + 작성자</option>
		</select>
		<input type="text" name="searchTxt" id="searchTxt" class="txt_Con"/>
		<input type="button" value="검색" id="searchBtn" class="btn_Con"/>
	</div>
</form>
</div>
</div>
</body>
</html>