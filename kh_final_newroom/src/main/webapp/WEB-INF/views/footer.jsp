<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rUrl" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="kr">
<head>
<style>
  .footer_style{
  	width: 100%;
    position: absolute;
    bottom: 0;
    background: #5eaeff;
   }
 </style>
<link rel="stylesheet" type="text/css" href="${rUrl}/resources/css/style.css" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0">
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">	
<title>footer </title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
</head>
<body>
<!-- Footer -->
<footer id="footer" class="footer bg-light py-3 my-md-3">
    <!-- 사이트 맵 -->
    <div class="row justify-content-end">
      	<div class="col-3">
       		<i class="bg-opacity-0  logo material-symbols-outlined text-muted" style="font-size:55px;">Home_Work</i>
       		<small class="text-muted">© 2023</small>
      	</div>
    <div class="col-3">
        <h3>Features</h3>
        	<ul class="list-unstyled">
          		<li><a href="${rUrl}/noticeList" class="text-muted">공지사항</a></li>
         		<li><a href="${rUrl}/qna" class="text-muted">Q&A</a></li>
        	</ul>
      	</div>
      		<div class="col-3">
        		<h3>About</h3>
        		<ul class="list-unstyled">
         			<li><a href="${rUrl}/introduction" class="text-muted">소개</a></li>
        		</ul>
      		</div>
    	</div>
    	
    	<div>
    		<c:if test="${loginInfo.mrole eq 1">
				<a href="${rUrl }/chatManager" class="text-muted">채팅</a>
    		</c:if>
    		<c:if test="${loginInfo.mrole eq 0">
    			<a href="${rUrl }/chat" class="text-muted">채팅</a>
    		</c:if>
    	</div>
    	
	<!-- CopyRight -->
    <div class="container">
     	 <span class="text-muted float-right">Copyright 2023. 김태룡. ALL RIGHTS RESERVED</span>
    </div>    
</footer>
</body>

</html>