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
<script type="text/javascript"
		src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	CKEDITOR.replace("conTxt", {
		resize_enabled : false,
		langage : "ko",
		enterMode : "2"
	});
	
	$("#logoutBtn").on("click", function() {
		location.href = "bLogout";
	});
	
	$("#updateBtn").on("click", function() {
		$("#conTxt").val(CKEDITOR.instances['conTxt'].getData());
		if($.trim($("#titleTxt").val()) == "") {
			alert("제목을 입력하세요.");
			$("#titleTxt").focus();
		} else if($.trim($("#conTxt").val()) == "") {
			alert("내용을 입력하세요.");
			$("#conTxt").focus();
		} else {
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "aUpdateAjax",
				dataType : "json",
				data : params,
				success : function(result) {
					if(result.res = "SUCCESS") {
						alert("수정되었습니다.")
						history.back();
					} else {
						alert("수정에 실패하였습니다.");
					}
				}, error : function(request, status, error) {
					console.log("status : " + request.status);
					console.log("text : " + request.responseText);
					console.log("error : " + error);
				}
			});
		}
	});
	
	$("#cancleBtn").on("click", function() {
		history.back();
	})
});
</script>
<style type="text/css">
.area{
	display: inline-block;
	width: 1080px;
}

.bar {
	display: block;
	height: 35px;
	margin-bottom: 20px;
	border-bottom: 4px ridge #5a6ff2;
}

.middle {
	display: block;
	width: 720px;
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
	height: 15px;
	background-color: #FFFFFF;
	border: solid 1px #D3D3D3;
	
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

.btn_Con {
	display: inline-block;
	width: 80px;
	height: 30px;
	margin-right: 20px;
	background-color: #FFFFFF;
	border: 1px solid #D3D3D3;
	color: #333333;
	outline: none;
	margin-right: 20px;
}

.btn_Con:hover {
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
/* 위에는 공용 */
table {
	font-size: 10pt;
	border-collapse: collapse;
	width: 100%;
	min-width: 720px;
	margin-bottom: 20px;
}

.table_attr{
	text-align: center;
	font-size: 10pt;
	height: 30px;
	width: 70px;
}

tr {
}

th {
	text-align: left;
}

#titleTxt {
	width: 400px;
}

#writerTxt {
	border: none;
	outline: none;
}

.table_con {
	height: 40px;
}

#bWriteBtn {
	margin-left: 200px;
}
</style>
</head>
<body>

<div class=area>
<div class="bar">
<span id="userbar"><b>${sBmNm}</b>님 환영합니다.</span>
<input type="button" class="btn" name="logoutBtn" id="logoutBtn" value="로그아웃"/>
</div>
<form action="#" id="actionForm" method="post">
<input type="hidden" id="bmNo" name="bmNo" value="${sBmNo}" />
<input type="hidden" id="bNo" name="bNo" value="${data.B_NO}" />
<div class="middle">
<span class="gbn">글쓰기</span>
<table colspan="1">
	<tbody>
		<tr>
			<th class="table_attr">제목</th>
			<th><input type="text" class="txt" name="titleTxt" id="titleTxt" placeholder="제목을 입력하세요." value="${data.B_TITLE}"/></th>
		</tr>
		<tr>
			<th class="table_attr">작성자</th>
			<th><input type="text" class="txt" name="writerTxt" id="writerTxt" readonly="readonly" value="${sBmNm}"/></th>
		</tr>
		<tr>
			<td colspan="2"><textarea class="txt" name="conTxt" id="conTxt" rows="10" cols="20">${data.B_CON}</textarea></td>
		</tr>
	</tbody>
</table>
<input type="button" name="updateBtn" id="updateBtn" class="btn_Con" value="수정완료"/>
<input type="button" name="cancleBtn" id="cancleBtn" class="btn_Con" value="취소"/>
</div>
</form>
</div>
</body>
</html>