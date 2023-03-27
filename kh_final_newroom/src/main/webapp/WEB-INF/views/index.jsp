<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="r" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="kr">
<head>
<style type="text/css">
	.card-text {
		border-radius: 5px;
		background-color: rgb(255, 255, 255);
		margin-bottom: 0px;
	}
	
	h4 {
		margin-bottom: 0px;
	}
	
	#gotoInterDetail {
		float: right;
	}

</style>
<link rel="stylesheet" type="text/css" href="${r}/resources/css/style.css" />
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<title>메인페이지</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	
	
	
	<!-- Contents -->
	<div class="container contents">
		<div class="jumbotron text-center bg-transparent pb-0">
			<h6 class="display-4">
				당신이 원하는 <span style="color: orange;">NewRoom</span><br>여기서 <span style="color: orange;">찾아</span> 보세요!
			</h6>
			<hr class="my-4">
			<div class="btn-group">
				<form action="${r}/search" method="post" class="form-inline">
					<div class="form-group mx-md-1">
						<select name="sido" id="sido" class="form-control">
							<option selected disabled>시/도</option>
						</select>
					</div>
					<div class="form-group mx-md-1">
						<select name="gugun" id="gugun" class="form-control">
							<option selected disabled>구/군</option>
						</select>
					</div>
					<div class="form-group">
						<select name="dong" id="dong" class="form-control">
							<option selected disabled>동</option>
						</select>
					</div>
					<div class="form-group mx-md-1">
						<select name="houseType" id="houseType" class="form-control">
							<option selected disabled>주거/매물형태</option>
							<option value="apt">아파트</option>
							<option value="houses">연립주택</option>
						</select>
					</div>
					<div class="form-group">
						<input name="aptName" type="text" class="form-control mx-md-1"
							placeholder="아파트(주택)명 검색">
						<button class="btn btn-secondary" type="submit">찾아보기</button>
					</div>
				</form>
			</div>
			<hr class="my-5" style="width: 70%">
		</div>
		<div class="container product-container" id="simpleInterestList" style="margin-left:100px;"></div>
	</div>

	<!-- Footer -->
	<jsp:include page="footer.jsp" />
	
</body>

</html>