<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rUrl" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	body{background-color:#f7bfbf; text-align:center}
</style>
<title>error 404 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
</head>
<body>
<img src="${rUrl }/resources/img/remove.png" width='100%'><br>
죄송합니다.<br>
요청하신 <b>${url}</b> 이 존재하지 않습니다.
<hr>
${message}
<div>
   <button onclick="location.href='${rUrl}'" class="btn btn-outline" style="backgroud-color:orange; color:white;">NewRoom</button>
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