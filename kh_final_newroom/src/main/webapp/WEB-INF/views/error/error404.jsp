<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rUrl" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${rUrl }/resources/css/error-404-style.css" />
<title>Error 404 - Page Not Found!</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
</head>
<body>
<div class="container">
    <img src="${rUrl }/resources/img/404.svg" />
    <br />
    <h3>This Page : <b style="color:black;">${url}</b>  Doesn't exist.</h3> 	
    <a class="buton" href="${rUrl }/introducion">Our NewRoom</a>
</div>
<script>
	//jQuerystring 의도적 오류 접근 404 에러 별도 처리
	var msg = '${msg }'; 
	if(${not empty msg}){
		alert(msg);
		location.href="${rUrl}";	
	}
</script>
</body>
</html>