<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

    <!-- 비밀번호 찾기 컨테이너 -->
    <div class="container-fluid bg-secondary w-100 d-flex align-items-center" style="height: 80vh;">
    	<%-- 비밀번호 수정 --%>
    	<c:if test="${not empty user}">
    		<div class="container bg-light rounded" style="width: 700px;">
	            <h1 class="m-md-3">${user.userid}님의 비밀번호 수정</h1>
	            <form id="modifyPw" action="${rUrl}/member/modifyPw" method="post" class="m-md-3 py-md-3">
	            	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	            	<input type="hidden" name="userid" value="${user.userid}">
	                <div class="form-group row">
	                    <label for="newPw" class="col-md-2 col-form-label text-right">새 비밀번호</label>
	                    <div class="col-md-10">
	                    	<input id="newPw" autoComplete="off" name="userpw" type="password" class="form-control" placeholder="비밀번호 입력" required>
	                    </div>
	                </div>
	                <div class="form-group row">
	                    <label for="newPw_check" class="col-md-2 col-form-label text-right">새 비밀번호 확인</label>
	                    <div class="col-md-10">
	                        <input id="newPw_check" name="newPw_check" autoComplete="off" type="password" class="form-control" placeholder="비밀번호 확인" required>
	                    </div>
	                </div>
	                <div class="form-group row justify-content-center">
	                    <button class="btn" style="background-color: orange; color:white;">비밀번호 수정</button>
	                </div>
	            </form>
	        </div>
    	</c:if>
    	
        <!-- 비밀번호 찾기 내용 -->
        <sec:authorize access="!isAuthenticated()">
	        <div class="container bg-light rounded" style="width: 700px;">
	            <h1 class="m-md-3">비밀번호 찾기</h1>
	            <form action="${rUrl}/member/findPw" method="post" class="m-md-3 py-md-3">
	            	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	                <div class="form-group row">
	                    <label for="username" class="col-md-2 col-form-label text-right">이름</label>
	                    <div class="col-md-10">
	                        <input name="username" type="text" class="form-control" placeholder="이름" required>
	                    </div>
	                </div>
	                <div class="form-group row">
	                    <label for="userid" class="col-md-2 col-form-label text-right">아이디</label>
	                    <div class="col-md-10">
	                        <input name="userid" type="text" class="form-control" placeholder="아이디" required>
	                    </div>
	                </div>
	                <div class="form-group row">
	                    <label for="userphone" class="col-md-2 col-form-label text-right">전화번호</label>
	                    <div class="col-md-10">
	                        <input name="userphone" type="tel" class="form-control" placeholder="010-xxxx-xxxx" required>
	                    </div>
	                </div>
	                <div class="form-group row justify-content-center">
	                    <button class="btn" style="background-color: orange; color:white;">비밀번호 찾기</button>
	                </div>
	            </form>
	        </div>
       </sec:authorize>
    </div>
    <!-- Footer -->
    <jsp:include page="footer.jsp" />
<script>
	var message = "${findResult}";
	if(message == 'fail'){
		alert('일치하는 회원정보가 없습니다. 다시 확인 해주세요!!');
	}

 	$('#modifyPw').submit(function(){ 
 		if($('#newPw').val() == $('#newPw_check').val()){
 			return true;
 		} else {
 			alert('비밀번호가 다릅니다. 다시 입력해주세요');
 			return false;
 		}
 	});
 </script>
 <sec:authorize access="isAuthenticated()">
 <script>
 	alert("이미 로그인 상태입니다 :() 메인으로 이동");
 	location.href="${rUrl}";
 </script>
 </sec:authorize>
</body>

</html>