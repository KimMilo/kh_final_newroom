<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rUrl" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${rUrl }/resources/css/error-common-style.css" />
<title>error 페이지</title>
</head>
<body>
<div class="centered">
  <div class="emoji"><img src="${rUrl }/resources/img/unicorn.gif" width="420px;"></div>
  <p class="title">Ooooops!</p>
  <p class="text">Error : ${url }<br>Looks like our server crashed 🙀<br>We're working on a quick fix, come back soon.</p>
  <div class="btn"><a class="buton" href="${rUrl }">Go NewRoom</a></div>
</div>  
</body>
</html>