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
<style>
	table{
		width: 800px;
	}
	table, th, td{
		border-collapse:collapse;
		border:1px solid gray;
	}
</style>
<head>
	
<title>Access denied</title>
</head>
<body>
<div>
	<div>
		접근 권한이 없습니다.<br>
		담당자에게 문의하여 주시기 바랍니다.<br>
		$[SPRING_SECURITY_403_EXCEPTION]<br>
		<%
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			Object principal = auth.getPrincipal();
			if(principal instanceof UserDetails){
				String username = ((UserDetails) principal).getUsername();
				String password = ((UserDetails) principal).getPassword();
				out.println("Account : " + username.toString() + "<br>");
			}
		%>
		<a href="${rUrl }">확인</a>
	</div>
</div>
  <h1>Company Website</h1>
  <hr>
  <p>
    Access Denied - you are not authorized to access this page
  </p>
  <hr>
  <p>
    <a href="${ pageContext.request.contextPath }/">Back to Landing Page</a>
  </p>
 
<script>
	$(document).ready(function(){
		
	});
</script>
</body>
</html>