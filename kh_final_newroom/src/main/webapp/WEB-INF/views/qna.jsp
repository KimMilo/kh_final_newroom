<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rUrl" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="kr">
<head>
<link rel="icon" href="/favicon.ico">
<style>
#app {
    font-family:Avenir,Helvetica,Arial,sans-serif; webkit-font-smoothing:antialiased; moz-osx-font-smoothing:grayscale;
    text-align:center;color:#2c3e50
    }
</style>
<link rel="stylesheet" type="text/css" href="${rUrl}/resources/css/comment.css" />
<link rel="stylesheet" type="text/css" href="${rUrl}/resources/css/style.css" />
<title>NewRoom-Q&A</title>
<script src="${rUrl}/resources/static/js/chunk-vendors.b161de55.js"></script>
<script src="${rUrl}/resources/static/js/app.e909676c.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="app">
		<br>
		<br>
		<h3><a href="<%=request.getContextPath() %>/qna" class="router-link-exact-active router-link-active" aria-current="page">QnA</a></h3>
		<div>
			<nav class="container navbar navbar-expand-sm navbar-light">
				<button id="btnWrite" class="btn btn-outline-primary">질문하기</button>
				<form class="navbar-nav ml-auto">
					<div class="form-group mr-1">
						<select name="search_type" class="form-control">
							<option value="btitle">제목</option>
							<option value="bcontent">내용</option>
							<option value="userid">작성자</option>
						</select>
					</div>
					<div class="form-group mr-1">
						<input type="text" placeholder="검색어 입력." class="form-control">
					</div>
					<div class="form-group">
						<button id="btnWrite" class="btn btn-outline-primary">검색</button>
					</div>
				</form>
			</nav>
		<div class="container my-3">
			<form role="form" method="get">
				<table class="table table-hover">
					<thead>
						<tr>
							<th width="15%">번호</th>
							<th width="40%" class="text-center">제목</th>
							<th width="15%">조회수</th>
							<th width="15%">작성일</th>
						</tr>
					</thead>
				</table>
			</form>
		</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>