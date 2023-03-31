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
           	<input type="text" id="searchKeyword" class="form-control" placeholder="회원 이름 검색">
           	<button id="nameSearch" class="btn btn-outline-primary">검색</button>
        </div>
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
					<tbody id="memberListTable"></tbody>
				</table>
			</div>
		</div>
		<input type="button" class="btn-success" id="setAdmin" value="관리자 설정">
		<input type="button" class="btn-danger" id="delAdmin" value="관리자 해제">
	</div>
	<!--content-->

	<!-- Footer -->
	<jsp:include page="footer.jsp" />
	
<script>
	$(function(){
		memberSearch();
		
		$("#setAdmin").click(function(){
			$(".chkMember:checked").each(function(){
				var userInfo = {'userid' : this.id, 'mrole': 1,};
				
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
				var userInfo = {'userid' : this.id, 'mrole': 0,};
				
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
		
		$("#nameSearch").click(function(){
			memberSearch();
		});
	});
	
	memberSearch = function(){
		var userName = '%' + $("#searchKeyword").val() + '%';
		
		$.ajax({
			url : '${rUrl}/member/search',
			method : 'post',
			data:{'name' : userName},
			success:function(result){
				updateMemberList(result);
			},
			error : function(xhr, status, msg){
				console.log(status + " " + msg);
			}
		});
	}
	
	updateMemberList = function(memberList){
		
		var content = '';
		if(memberList.length == 0){
			content += '<tr><td colspan="6">가입된 회원이 없습니다.</td></tr>';
		}else{
			for(var i = 0, member; member=memberList[i]; i++){
				content += '<tr>'
					+ '<td>' + (i+1) + '</td>'
					+ '<td>' + member.userid + '</td>'
					+ '<td>' + member.username + '</td>'
					+ '<td>' + member.useremail + '</td>'
					+ '<td>' + member.userphone + '</td>'
				if(member.mrole == '1'){
					content += '<td>관리자</td>'
				}else{
					content += '<td>일반회원</td>'
				}
				content += '<td><input type="checkbox" class="chkMember "' 
				+ 'id=' + member.userid+ '></td></tr>';
			}
		}
		$("#memberListTable").html(content);
	}
</script>
</body>