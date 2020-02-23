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
	
	if(${sBmNo} == ${data.BM_NO}) {
		$("#updateBtn").css("display", "inline-block");
		$("#deleteBtn").css("display", "inline-block");
	} else {
		$("#updateBtn").css("display", "none");
		$("#deleteBtn").css("display", "none");
	}
	
	$("#listBtn").on("click", function() {
		location.href = "aList";
	});
	
	$("#logoutBtn").on("click", function() {
		location.href = "aLogout";
	});
	
	$("#deleteBtn").on("click", function() {
		if(confirm("삭제하시겠습니까?")) {
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post", //데이터 전송방식
				url : "aDeleteAjax", //주소
				dataType : "json", //데이터 전송 규칙
				data : params, //보낼 데이터
				// {키:값, 키:값,...} -> json
				success : function(result) {
					if(result.res == "SUCCESS") {
						alert("삭제되었습니다.");
						location.href = "aList";
					} else {
						alert("삭제에 실패하였습니다.");
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
	
	$("#updateBtn").on("click", function() {
		$("#actionForm").attr("action", "aUpdate");
		$("#actionForm").submit();
	});
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

.gbn {
	display: block;
	font-size: 15pt;
	margin-bottom: 10px;
	font-weight: bold;
}

.middle {
	display: block;
	width: 800px;
	height: 300px;
	border: 1px solid #D3D3D3;
	padding: 15px;
	padding-top: 20px;
	padding-bottom: 0px;
	margin-bottom: 10px;
}

.bTitle {
	display: block;
	width: 100%;
	height: 20px;
	margin-bottom: 15px;
	font-weight: bold;
	font-size: 14px;
	border-bottom: dashed 1px #c3c3c3;
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
	border: solid 0px #CCCCCC;
	outline: none;
}

.txt:focus {
	outline: none;
}

.txtarea{
	width: 600px;
	height: 150px;
	resize: none;
	outline: none;
	border: none;
	margin-left: 35px;
	margin-top: 35px;
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
	background-color: #FFFFFF;
	border: 1px solid #D3D3D3;
	color: #333333;
	outline: none;
	margin-left: 10px;
	float: right;
}

.btn_Con:hover {
	cursor: pointer;
}

#deDtTxt {
	display: inline-block;
	float: right;
	font-size: 11px;
	color: #b3b3b3;
	height: 12px;
	width: 95px;
}

#deTitleTxt {
	display: inline-block;
}

.bProfile_Img{
	width: 20px;
	height: 20px;
}

#bDeWriter {
	display: inline-block;
	position: relative;
	bottom: 5px;
}

.b_Hit {
	display: inline-block;
	font-size: 10pt;
	height: 20px;
	position: relative;
	top: 15px;
}

#deHitTxt {
	height: 15px;
}

.bottom {
	width: 832px;
	height: 50px;
}

#deleteBtn, #updateBtn {
	display: none;
}
</style>
</head>
<body>
<form action="#" id="actionForm" method="post">
<input type="hidden" name="bmNo" id="bmNo" value="${sBmNo}" />
<input type="hidden" name="bNo" id="bNo" value="${data.B_NO}"/>
<div class=area>
<div class="bar">
<span id="userbar"><b>${sBmNm}</b>님 환영합니다.</span>
<input type="button" class="btn" name="logoutBtn" id="logoutBtn" value="로그아웃"/>
</div>
<span class="gbn">상세보기</span>
<div class="middle">
<div class="bTitle">
<div id="deTitleTxt">${data.B_TITLE}</div>
<input type=text name="deDtTxt" id="deDtTxt" class="txt" value="${data.B_DT}" readonly="readonly"/>
</div>
<div class="bProfile">
<img class="bProfile_Img" src="resources/images/profile.png" alt="profile"/>
<div id="bDeWriter">${data.BM_NM}</div>
</div>
<div>
<textarea name="deConTxt" id="deConTxt" class="txtarea" readonly="readonly">${data.B_CON}</textarea>
<div class="b_Hit">조회수 : <input type="text" name="deHitTxt" id="deHitTxt" class="txt" value="${data.B_HIT}" readonly="readonly"/></div>
</div>
</div>
<div class="bottom">
<input type="button" name="listBtn" id="listBtn" class="btn_Con" value="목록"/>
<input type="button" name="deleteBtn" id="deleteBtn" class="btn_Con" value="삭제"/>
<input type="button" name="updateBtn" id="updateBtn" class="btn_Con" value="수정"/>
</div>
</div>
</form>
</body>
</html>