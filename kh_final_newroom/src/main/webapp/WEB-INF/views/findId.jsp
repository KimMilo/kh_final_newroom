<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="rUrl" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="kr">
<head>
<link rel="stylesheet" type="text/css" href="${rUrl}/resources/css/style.css" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<title>비밀번호 찾기</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous">
</script>
</head>
<body>
	<!-- Header -->
    <jsp:include page="header.jsp" />
    	
        <!-- 아이디 찾기 내용 -->
        <c:if test="${empty user}">
	        <div class="container bg-light rounded" style="width: 700px;">
	            <h1 class="m-md-3">아이디 찾기</h1>
	            <form action="${rUrl}/member/findId" method="post" class="m-md-3 py-md-3">
	            	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	                <div class="form-group row">
	                    <label for="username" class="col-md-2 col-form-label text-right">이름</label>
	                    <div class="col-md-10">
	                        <input name="username" type="text" class="form-control" placeholder="이름" required>
	                    </div>
	                </div>
	                <div class="form-group row">
	                    <label for="useremail" class="col-md-2 col-form-label text-right">이메일</label>
	                    <div class="col-md-10">
	                        <input name="useremail" type="email" class="form-control" placeholder="이메일" required>
	                    </div>
	                </div>
	                <div class="form-group row">
	                    <label for="userphone" class="col-md-2 col-form-label text-right">전화번호</label>
	                    <div class="col-md-10">
	                        <input name="userphone" type="tel" class="form-control" placeholder="010-xxxx-xxxx" required>
	                    </div>
	                </div>
	                <div class="form-group row">
	                    <label for="userpw" class="col-md-2 col-form-label text-right">비밀번호</label>
	                    <div class="col-md-10">
	                        <input name="userpw" autoComplete="off" type="password" class="form-control" placeholder="비밀번호 입력" required>
	                    </div>
	                </div>
	                <div class="form-group row justify-content-center">
	                    <button class="btn" style="background-color: orange; color:white;">아이디 찾기</button>
	                </div>
	            </form>
	        </div>
       </c:if>
    <!-- Footer -->
    <jsp:include page="footer.jsp" />
<script>
	var message = "${findResult}";
	if(message == 'fail'){
		alert('일치하는 회원정보가 없습니다. 다시 확인 해주세요!!');
	} else if(message == 'success') {
		var findId = '${user.userid}';
		alert('해당 아이디는 [' + findId + '] 입니다.' );
		location.href="${rUrl}";
	}
 </script>
</body>

</html>