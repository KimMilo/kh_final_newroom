<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rUrl" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="kr">
<head>
<link rel="stylesheet" type="text/css" href="${rUrl}/resources/css/style.css" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>회원 검색</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
 
	<!--content-->
	<div class="container text-center col-lg-12">
		<h2 class="pt-5 py-4">회원 검색</h2>
		<!--contents-->
		<div class="form-group col-mr-5">
			<form action="${rUrl }/member/list" method="get">
           	<input type="text" id="searchKeyword" name="name" class="form-control" placeholder="회원 이름 검색">
           	<button id="nameSearch" type="submit" class="btn btn-outline-primary">검색</button>
			</form>
        </div>
        <c:if test="${not empty keyword }">
	     <div class="container text-center mt-5" style="margin-bottom:0">
	       	<h3><span style="color: orange;">회원 이름</span>으로 <span style="color: orange;">'${keyword }'</span>을 검색한 결과입니다.</h3>
	   	</div>
	   	</c:if>
		<div class="container my-3">
			<div>
				<table class="table table-hover">
					<thead>
						<tr>
							<th width="7%">번호</th>
							<th width="15%">아이디</th>
							<th width="15%" class="text-center">이름</th>
							<th width="33%">이메일</th>
							<th width="20%">전화번호</th>
							<th width="15%">등급</th>
							<th></th>
						</tr>
					</thead>
					<tbody id="memberListTable">
						<c:choose>
							<c:when test="${empty paging.page }">
								<tr><td colspan="6">검색한 가입된 회원이 없습니다.</td></tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="data" items="${paging.page }">
									<tr>
										<td>${data.no }</td>
										<td>${data.userid }</td>
										<td>${data.username }</td>
										<td>${data.useremail }</td>
										<td>${data.userphone }</td>
										<c:choose>
											<c:when test="${data.mrole eq 'ROLE_ADMIN' }">
												<td>관리자</td>
											</c:when>
											<c:otherwise>
												<td>일반회원</td>
											</c:otherwise>
										</c:choose>
										<td>
											<input type="checkbox" class="chkMember" id="${data.userid }">
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
		<input type="button" class="btn-success" id="setAdmin" value="관리자 설정">
		<input type="button" class="btn-danger" id="delAdmin" value="관리자 해제">
	</div>
	
	<div>
		<ul class="mt-2 pagination justify-content-center">
			<c:set var="pageNumber" value="${empty param.p ? 1 : param.p }" />
			<c:choose>
				<c:when test="${paging.prevPage eq - 1 or empty paging.page}">
					<li class="page-item disabled"><a class="page-link">prev</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="${rUrl }/member/list?p=${paging.prevPage }">prev</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="pNum" items="${paging.pageList }">
				<li class="page-item ${pNum eq pageNumber ? 'active' : '' }"><a class="page-link" href="${rUrl }/member/list?p=${pNum }">${pNum }</a></li>
			</c:forEach>
			<c:choose>
				<c:when test="${paging.nextPage eq - 1 or empty paging.page}">
					<li class="page-item disabled"><a class="page-link">next</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="${rUrl }/member/list?p=${paging.nextPage}">next</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	<!--content-->

	<!-- Footer -->
	<jsp:include page="footer.jsp" />

	
<script>
		$("#setAdmin").click(function(){
			$(".chkMember:checked").each(function(){
				var userInfo = {'userid' : this.id, 'mrole': 'ROLE_ADMIN',};
				
				$.ajax({
					url:'${rUrl}/member/change',
					method:'put',
					contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify(userInfo),
					success:function(){
						location.href="${rUrl}/member/list";
					},
					error : function(xhr, status, msg){
						console.log(status + " " + msg);
					}
				})
			})
		});
		
		$("#delAdmin").click(function(){
			$(".chkMember:checked").each(function(){
				var userInfo = {'userid' : this.id, 'mrole': 'ROLE_MEMBER',};
				
				$.ajax({
					url:'${rUrl}/member/change',
					method:'put',
					contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify(userInfo),
					success:function(){
						location.href="${rUrl}/member/list";
					},
					error : function(xhr, status, msg){
						console.log(status + " " + msg);
					}
				})
			})
		});
</script>
</body>