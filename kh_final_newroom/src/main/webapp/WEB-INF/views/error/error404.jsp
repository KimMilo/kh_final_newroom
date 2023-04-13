<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	//jQuerystring 의도적 오류 접근 404 에러 별도 처리
	var msg = '${msg }' + 'url 조작 금지 :D;
	alert(msg);
	location.href="<%=request.getContextPath()%>";
</script>
	
</body>
</html>