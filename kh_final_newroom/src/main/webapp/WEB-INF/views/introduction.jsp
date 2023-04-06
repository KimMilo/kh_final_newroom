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
<link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0">
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<title>NewRoom 소개</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
</head>
<body>
	<div>
		<!-- Navbar -->
		<nav id="header" class="navbar navbar-expand-sm navbar-default py-3 border-bottom justify-content-between">
			<div class="ms-2 navbar navbar_logo">
				<span class="bg-opacity-0  logo material-symbols-outlined" style="color: gray; font-size:30px;">Home</span>
				<a class="navbar-brand happy-font title" href="${rUrl}/" style="color: gray; font-size:30px;"><b>NewRoom</b></a>
			</div>
		</nav>
		<div id="con01_slide" class="">
			<div class="slider01_txt">
				<div>
					<h1>
						신뢰 기반 서비스 제공<br>Find your NewRoom
					</h1>
				</div>
				<div>
					<p>
						<strong>당신의 부동산 전문가</strong><br><strong>NewRoom</strong>
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
		<div id="con02_intro" class="">
			<div class="con02_in">
				<div class="intro_ttl">
					<h3>서비스 소개</h3>
					<p>다양한 서비스 제공을 약속 드립니다.
					<p>
				</div>
				<ul class="intro_box">
					<li class="intro_box00">
						<div id="box_active1">
							<h4>매물 검색</h4>
							<p>SEARCH PROPERTY</p>
						</div>
						<div id="box_hover00">
							<p>
								내가 사는 지역의 동별, 아파트별<br> 매물을 검색해보고 찜 해보세요<br>
							</p>
						</div>
					</li>
					<li class="intro_box01">
						<div id="box_active2">
							<h4>주변 상권</h4>
							<p>NEARBY AREAS</p>
						</div>
						<div id="box_hover01">
							<p>
								관심 매물 주변에 위치한<br>병원, 부동산, 버스정류소 등을 찾아보세요
							</p>
						</div>
					</li>
					<li class="intro_box02">
						<div id="box_active3">
							<h4>채팅 상담</h4>
							<p>CAHT CONSULTATION</p>
						</div>
						<div id="box_hover02">
							<p>
								상담원과 1:1 채팅 상담을 시작해보세요<br>자주 묻는 FAQ를 확인할 수 있어요 
							</p>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div id="con03_end" class="">
			<div class="con03_left">
				<div class="img">
					<img src="${rUrl}/resources/img/web_img.png" />
				</div>
			</div>
			<div class="con03_right">
				<div class="ttl">
					<h2>아파트 가격을 한 눈에</h2>
					<p>
						집에서도 쉽고 간편하게<br>집 구할 때 꼭 필요한 정보 확인하세요!!
					</p>
					<button class="btn btn-outline-primary btn-sm" onclick="location.href='${rUrl}/'" style="color: white; background-color: rgb(184, 134, 11);"><b>NewRoom 서비스 이용하기</b></button>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
		<div id="menu">
			<ul id="menu_circle">
				<a href="#con01_slide">
					<li id="section-top" class="" data-menuanchor="firstPage"></li>
				</a>
				<a href="#con02_intro">
					<li id="section-middle" class="" data-menuanchor="secondPage"></li>
				</a> 
				<a href="#con03_end">
					<li id="section-bottom" class="" data-menuanchor="3rdPage"></li>
				</a>
			</ul>
		</div>
	</div>

<script>
top = $("#section-top").position().top;
middle = $("#section-middle").position().top +380;
bottom = $("#section-bottom").position().top +800;

$(window).scroll(function(){
	var scroll = $(window).scrollTop();

	if (scroll < middle) 
	{
	  $("#section-top").addClass("active");
	  $("#section-middle").removeClass("active");
	  $("#section-bottom").removeClass("active");
	} 
	else if (middle <= scroll && scroll < bottom) 
	{
	  $("#section-top").removeClass("active");
	  $("#section-middle").addClass("active");
	  $("#section-bottom").removeClass("active");
	} 
	else if (bottom <= scroll) 
	{
	  $("#section-top").removeClass("active");
	  $("#section-middle").removeClass("active");
	  $("#section-bottom").addClass("active");
	}
});
</script>

<!-- script> 
$('#box_active1').on("click", pageMoveHandler);
$('#box_active2').on("click", pageMoveHandler);
$('#box_active3').on("click", pageMoveHandler1);
	
function pageMoveHandler(){
	location.href="<--%=request.getContextPath()%>/";

function pageMoveHandler1(){
	location.href="<--%=request.getContextPath()%>/chat";

</script-->
</body>
</html>