<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rUrl" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="kr">
<head>
<link rel="icon" href="/favicon.ico">
<style>
#app {
    font-family:Avenir,Helvetica,Arial,sans-serif; webkit-font-smoothing:antialiased; moz-osx-font-smoothing:grayscale;
    text-align:center;color:#2c3e50
    }
</style>
<link rel="stylesheet" type="text/css" href="${rUrl}/resources/css/comment.css" />
<link rel="stylesheet" type="text/css" href="${rUrl}/resources/css/style.css" />
<title>NewRoom-Q&A</title>
<script src="${rUrl}/resources/static/js/chunk-vendors.b161de55.js"></script>
<script src="${rUrl}/resources/static/js/app.e909676c.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
<!-- 	<div class="modal" id="join"> -->
<!-- 		<div class="modal-dialog modal-dialog-centered"> -->
<!-- 			<div class="modal-content"> -->

<!-- 				Modal Header -->
<!-- 				<div class="modal-header justify-content-center"> -->
<!-- 					<h4 class="modal-title">회원가입</h4> -->
<!-- 				</div> -->

<!-- 				Modal body -->
<!-- 				<div class="modal-body"> -->
<!-- 					<div class="pl-3 pr-1 form form-group"> -->
<!-- 						<div class="form-inline form-group col-14"> -->
<!-- 							<label for="useridJoin" class="control-label col-3">아이디<span -->
<!-- 								style="color: red;">*</span></label> -->
<!-- 							<div class="col-9"> -->
<!-- 								<input type="text" class="form-control" id="useridJoin" name="userid" -->
<!-- 									placeholder="아이디를 입력하세요"> -->
<!-- 								<button id="idcheck" type="submit" class="btn">중복체크</button><br> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="form-inline form-group col-14"> -->
<!-- 							<label for="userpwJoin" class="col-3 control-label">비밀번호<span -->
<!-- 								style="color: red;">*</span></label> -->
<!-- 							<div class="col-9"> -->
<!-- 								<input type="password" class="form-control" id="userpwJoin" name="userpw" -->
<!-- 									placeholder="비밀번호를 입력하세요"> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="form-inline form-group col-14"> -->
<!-- 							<label for="name" class="col-3 control-label">이름<span -->
<!-- 								style="color: red;">*</span></label> -->
<!-- 							<div class="col-9"> -->
<!-- 								<input type="text" class="form-control" id="name" name="username" -->
<!-- 									placeholder="이름을 입력하세요"> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="form-inline form-group col-14"> -->
<!-- 							<label for="address" class="col-3 control-label">이메일<span -->
<!-- 								style="color: red;">*</span></label> -->
<!-- 							<div class="col-9"> -->
<!-- 								<input type="email" class="form-control" id="email" -->
<!-- 									name="useremail" placeholder="newroom@naver.com"> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="form-inline form-group col-14"> -->
<!-- 							<label for="phone" class="col-3 control-label">전화번호<span -->
<!-- 								style="color: red;">*</span></label> -->
<!-- 							<div class="col-9"> -->
<!-- 								<input type="text" class="form-control" id="phone" name="userphone" -->
<!-- 									placeholder="010-xxxx-xxxx"> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<button id="submitJoin" class="btn btn-outline-secondary col-sm-10 ml-4">회원가입</button> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
	<div id="app">
		<br>
		<br>
		<h3><a href="<%=request.getContextPath() %>/qna" class="router-link-exact-active router-link-active" aria-current="page">QnA</a></h3>
		<div>
			<nav class="container navbar navbar-expand-sm navbar-light">
				<button id="btnWrite" class="btn btn-outline-primary">질문하기</button>
				<form class="navbar-nav ml-auto">
					<div class="form-group mr-1">
						<select name="search_type" class="form-control">
							<option value="btitle">제목</option>
							<option value="bcontent">내용</option>
							<option value="userid">작성자</option>
						</select>
					</div>
					<div class="form-group mr-1">
						<input type="text" placeholder="검색어 입력." class="form-control">
					</div>
					<div class="form-group">
						<button id="btnWrite" class="btn btn-outline-primary">검색</button>
					</div>
				</form>
			</nav>
		<div class="container my-3">
			<form role="form" method="get">
				<table class="table table-hover">
					<thead>
						<tr>
							<th width="15%">번호</th>
							<th width="40%" class="text-center">제목</th>
							<th width="15%">조회수</th>
							<th width="15%">작성일</th>
						</tr>
					</thead>
				</table>
			</form>
		</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
	
<script>
$("#btnWrite").click(function(){
	if(idChk == false){
	 	alert("ID 중복 체크해주세요.");
		return false;
	}else {
		$.ajax({
			url:'${rUrl}/qna',
			method : 'post',
			data:{
				'userid' : $("#useridJoin").val(),
				'userpw' : $("#userpwJoin").val(),
				'username' : $("#name").val(),
				'useremail' : $("#email").val(),
				'userphone' : $("#phone").val(),
			},
			success: function(result){
				if(result.length > 0){
					alert(result);
				}else{
					$("#useridJoin").val("");
					$("#userpwJoin").val("");
					$("#name").val("");
					$("#email").val("");
					$("#phone").val("");
					
					alert("회원가입 성공!!!");
					location.href="${rUrl}";
				}
			},
			error : function(){
				console.log('ajax error');
			}
		});
	}
});
</script>
</body>
</html>