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
<body class="centered">
  <div class="emoji"><img src="${rUrl }/resources/img/unicon.gif" width=250></div>
  <p class="title">Ooooops!</p>
  <p class="text">${url }Error : ${exception }<br>Looks like our server crashed 🙀<br>We're working on a quick fix, come back soon.</p>

  <a class="buton" href="${rUrl }">NewRoom 가기</a>

</body>
</html>