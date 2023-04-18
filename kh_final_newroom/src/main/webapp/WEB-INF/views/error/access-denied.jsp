<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.springframework.security.core.userdetails.UserDetails" %>
<%@ page import="org.springframework.security.core.userdetails.UserDetailsService" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="rUrl" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${rUrl }/resources/css/access-denied.css" />
<title>Access denied</title>
</head>
<body>
	<div class="container">
		<img src="${rUrl }/resources/img/access-denied.jpg" width="480px;"/>
		<br>
		<h3>
		<%
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			Object principal = auth.getPrincipal();
			if(principal instanceof UserDetails){
				String username = ((UserDetails) principal).getUsername();
				String password = ((UserDetails) principal).getPassword();
				out.println("아이디 : " + username.toString()+" ");
			}
		%>
		계정은 <br>해당 ${url } 에 대한 권한이 없습니다.<br>
		담당자에게 문의하여 주시기 바랍니다.<br></h3>
		<a class="buton" href="${rUrl }">Main</a>
	</div>
</body>
</html>