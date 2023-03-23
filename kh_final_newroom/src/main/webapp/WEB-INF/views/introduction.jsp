<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rUrl" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="kr">
<head>
<link rel="stylesheet" type="text/css" href="${rUrl}/resources/css/introduction.css"/>
<link rel="stylesheet" type="text/css" href="${rUrl}/resources/css/style.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0">
<title>NewRoom 소개</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
</head>
<body>
	<div>
		<!-- Navbar -->
		<nav id="header" class="navbar navbar-expand-sm navbar-default py-3 border-bottom justify-content-between">
			<div class="ms-2 navbar navbar__logo">
				<span class="bg-opacity-0  logo material-symbols-outlined" style="color: gray;">Home</span>
				<a class="navbar-brand happy-font title" href="${rUrl}/" style="color: gray;"><b>NewRoom</b></a>
			</div>
		</nav>
		<div id="con01_slide" class="">
			<div class="slider01_txt">
				<div class="slider_h01">
					<h1>
						신뢰 기반 서비스 제공<br>Find your NewRoom
					</h1>
				</div>
				<div class="slider_p01">
					<p>
						당신의 부동산 전문가<br> NewRoom
					</p>
				</div>
			</div>
			<!--마우스-->
			<div class="mouse_icon">
				<a href="#con02_intro"> <marquee align="top" height="100"
						direction="down" behavior="alternate" scrollamount="4">
						<img src="${rUrl}/resources/img/con01_mouse.png" alt="이미지 없음">
					</marquee>
				</a>
			</div>
		</div>
		<div id="con02_intro" class="justify-content-between">
			<div class="con02_in">
				<div class="intro_ttl">
					<h3>서비스 소개</h3>
					<p>다양한 서비스 제공을 약속 드립니다.
					<p>
				</div>
				<ul class="intro_box">
					<li class="intro_box00">
						<div id="box_active">
							<h4>매물 검색</h4>
							<p>SEARCH PROPERTY</p>
						</div>
						<div id="box_hover00" style="display: block; margin-top: 35%;">
							<p>
								내가 사는 지역의 동별, 아파트별<br> 매물을 검색해보고 찜해보세요<br>
							</p>
						</div>
					</li>
					<li class="intro_box01">
						<div id="box_active">
							<h4>주변 상권</h4>
							<p>NEARBY AREAS</p>
						</div>
						<div id="box_hover01" style="display: none; margin-top: 35%;">
							<p>
								관심 매물 주변에 위치한<br>병원, 진료소, 치안안전등급,<br>부동산, 버스정류소 등을 찾아보세요
							</p>
						</div>
					</li>
					<li class="intro_box02">
						<div id="box_active">
							<h4>채팅 상담</h4>
							<p>CAHT CONSULTATION</p>
						</div>
						<div id="box_hover02" style="display: none; margin-top: 35%;">
							<p>
								상담원과 1:1 채팅 상담을 시작해보세요<br>자주 묻는 FAQ를 확인할 수 있어요 
							</p>
						</div>
					</li>
				</ul>
			</div>
		</div>
<!-- 		<div id="con03_notice" class="section"> -->
<!-- 			<div class="con03_left"> -->
<!-- 				<div class="ttl"> -->
<!-- 					<h2>살기 좋은 아파트 찾기</h2> -->
<!-- 					<p> -->
<!-- 						관심있는 매물 주변의 범죄률을 지도에서 한눈에 파악해보세요<br>당신의 꼼꼼한 선택이 가족의 행복을 -->
<!-- 						지킵니다. -->
<!-- 					</p> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="con03_right"></div> -->
<!-- 			<ul class="box_ul"> -->
<!-- 				<li> -->
<!-- 					<div class="img"> -->
<%-- 						<img src="${rUrl}/resources/img/icon_1.png"> --%>
<!-- 					</div> -->
<!-- 					<h4>맞춤안전 지도</h4> -->
<!-- 					<p>주요 5대 범죄 위험도 확인</p> -->
<!-- 				</li> -->
<!-- 				<li> -->
<!-- 					<div class="img"> -->
<%-- 						<img src="${rUrl}/resources/img/icon_2.png"> --%>
<!-- 					</div> -->
<!-- 					<h4>신뢰성있는 데이터</h4> -->
<!-- 					<p> -->
<!-- 						경찰청에서 제공받은 밀도분석 정보<br> -->
<!-- 					</p> -->
<!-- 				</li> -->
<!-- 				<li> -->
<!-- 					<div class="img"> -->
<%-- 						<img src="${rUrl}/resources/img/icon_3.png"> --%>
<!-- 					</div> -->
<!-- 					<h4>범죄분포 시각화</h4> -->
<!-- 					<p>치안 사고 발생현황을 5등급으로 분류</p> -->
<!-- 				</li> -->
<!-- 			</ul> -->
<!-- 		</div> -->
<!-- 		<div id="con04_end" class="section"> -->
<!-- 			<div class="con04_left"> -->
<!-- 				<div class="img"> -->
<%-- 					<img src="${rUrl}/resources/img/web_img.png" /> --%>
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="con04_right"> -->
<!-- 				<div class="ttl"> -->
<!-- 					<h2>주변 아파트 가격을 한눈에!</h2> -->
<!-- 					<p> -->
<!-- 						집에서도 쉽고 간편하게!<br>집 구할 때 꼭 필요한 정보 놓치지 마세요 -->
<!-- 					</p> -->
<%-- 					<button class="btn btn-outline-primary btn-sm" onclick="location.href='${rUrl}/'">NewRoom 서비스 이용하기</button> --%>
<!-- 				</div> -->
<!-- 			</div> -->
<%-- 			<jsp:include page="footer.jsp" /> --%>
<!-- 		</div> -->
	</div>
</body>
</html>