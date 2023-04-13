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
<title>error 페이지</title>
</head>
<body>
죄송합니다.<br>
요청하신 <b>${url}</b> 처리에 오류가 발생했습니다.
<hr>
${exception}

<div class="d-flex flex-row-reverse">
   <button onclick="${rUrl}" class="btn" style="color:orange;"><b style="color:white; font-size: 30px;">NewRoom</b></button>
</div>

</body>
</html>