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
		$("#searchBtn").on("click", function() {
			$("#page").val("1");
			/* test1로 가라 */
			$("#actionForm").attr("action", "test1");
			$("#actionForm").submit();
		});

		$("#searchTxt").on("keypress", function() {
			if (event.keyCode == 13) {
				$("#searchBtn").click()
				return false;
			}
		});

		$(".paging_area").on("click", "span", function() {
			$("#page").val($(this).attr("name"));
			$("#actionForm").attr("action", "test1");
			$("#actionForm").submit();
		});

		$("tbody").on("click", "tr", function() {
			$("#no").val($(this).attr("name"));
			$("#actionForm").attr("action", "test2");
			$("#actionForm").submit();
		});
		
		$("#writeBtn").on("click", function() {
			location.href = "test3";
		});
	});
</script>
</head>
<body>
	<!-- # : 아무것도 하지 않겠다 -->
	<form action="#" method="post" id="actionForm">
		<input type="hidden" name="page" id="page" value="${page}" /> 
		<input type="hidden" name="no" id="no" /> 
		<select name="searchGbn">
			<c:choose>
				<c:when test="${param.searchGbn eq 0}">
					<option value="0" selected="selected">제목</option>
				</c:when>
				<c:otherwise>
					<option value="0">제목</option>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${param.searchGbn eq 1}">
					<option value="1" selected="selected">작성자</option>
				</c:when>
				<c:otherwise>
					<option value="1">작성자</option>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${param.searchGbn eq 2}">
					<option value="2" selected="selected">제목 + 작성자</option>
				</c:when>
				<c:otherwise>
					<option value="2">제목 + 작성자</option>
				</c:otherwise>
			</c:choose>
		</select> <input type="text" name="searchTxt" id="searchTxt" value="${param.searchTxt}" /> 
			<input type="button" id="searchBtn" value="검색" />
			<input type="button" id="writeBtn" value="등록" />
	</form>
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>작성자</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="data" items="${list}">
				<tr name="${data.NO}">
					<th>${data.NO}</th>
					<th>${data.TITLE}</th>
					<th>${data.DT}</th>
					<th>${data.WRITER}</th>
					<th>${data.HIT}</th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
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
</body>
</html>