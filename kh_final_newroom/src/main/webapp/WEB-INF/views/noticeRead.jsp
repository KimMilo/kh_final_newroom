<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="rUrl" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="kr">
<head>
<style>
.delete{
	color: red;
}
</style>
<link rel="stylesheet" type="text/css" href="${rUrl}/resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="${rUrl}/resources/css/comment.css" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<title>공지사항 상세페이지</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container mt-5">
		<h3 class="text-center">공지 상세보기</h3>
		<div class="container">
			<form class="pl-5 pr-5 form form-group">
				<div class="form-group">
					<label for="btitle">제목</label> <input type="text" id="btitle"
						class="form-control" name="btitle" value="${dto.btitle}" readonly>
				</div>
				<div class="form-group row">
					<div class="col-sm-4">
						<label for="userid">작성자 </label> <input type="text" id="userid"
							class="form-control" name="userid" value="${dto.userid}" readonly>
					</div>
					<div class="col-sm-4">
						<label for="bwritedate">작성날짜</label> <input type="text"
							id="bwritedate" class="form-control" name="bwritedate"
							value="${dto.bwritedate}" readonly>
					</div>
					<div class="col-sm-4">
						<label for="breadcnt">조회수</label> <input type="text" id="breadcnt"
							class="form-control" name="breadcnt" value="${dto.breadcnt}"
							readonly>
					</div>
				</div>
				<div class="form-group">
					<label for="bcontent">내용</label>
					<textarea rows="10" style="height: 100%;" name="bcontent"
						id="bcontent" class="form-control" name="bcontent" readonly>${dto.bcontent}</textarea>
				</div>
				<div class="container row justify-content-center"
					style="margin-bottom: 0">
					<sec:authentication property="principal.username" var="userid"/>
					<c:if test="${userid eq dto.userid}">
						<input type="button" class="btn btn-outline-primary mr-1"
							value="수정하기"
							onclick="location.href='${rUrl}/noticeUpdate?bnum=${dto.bnum}'">
						<input type="button" class="btn btn-outline-danger mr-1"
							value="삭제하기"
							onclick="location.href='${rUrl}/noticeDelete?bnum=${dto.bnum}'">
					</c:if>
					<input type="button" class="btn btn-outline-secondary" value="목록"
						onclick="location.href='${rUrl}/noticeList'">
				</div>
			</form>
		</div>
		<div class="container bootdey">
			<div class="col-md-12 bootstrap snippets">
				<div class="panel">
					<div class="panel-body">
						<h4>전체 댓글</h4>
						<hr>
						<div id="cmtList">
						</div>
					</div>
				</div>
				<div class="panel">
					<div class="panel-body">
						<textarea id="cmt" class="form-control" rows="2"
							placeholder="댓글을 입력하세요"></textarea>
						<div class="mar-top clearfix">
							<button id="cmtBtn"
								class="btn btn-sm btn-outline-primary pull-right justify-content-end">
								<i class="fa fa-pencil fa-fw"></i> 댓글 등록
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp" />
	
<sec:authentication property="principal.username" var="userid"/>
<script type="text/javascript">
	function getCommentList(){
		$.ajax({
			url : '${rUrl}/comment',
			data : {'bnum':'${dto.bnum}'},
			method : 'get',
			contentType : "application/json; charset:UTF-8",
			success : function(result){
				console.log(result);
				if(result.length != 0){
					var cmtList = '';
					for(var i=0; i<result.length; i++){
						cmtList += '<div class="media-block">';
						cmtList += '<span class="media-left mr-1"><img class="img-circle img-sm" alt="Profile Picture" src="${rUrl}/resources/img/chat_profile_user.png"></span>'
						cmtList += '<div class="media-body"><div class="mar-btm"><span class="btn-link text-semibold media-heading box-inline">';	
						cmtList += result[i]['cwriter'];
						cmtList += '</span> &nbsp;';
						if('${userid}' == result[i]['cwriter']){
							cmtList += '<span><a href="" class="delete" id=';
							cmtList += result[i]['cnum'] + '>(삭제)</a></span>';
						}
						cmtList += '<p class="text-muted text-sm"><i class="fa fa-date fa-lg"></i>';
						cmtList += result[i]['cwriteDate'];
						cmtList += '</p>';
						cmtList += '</div>';
						cmtList += '<p>';
						cmtList += result[i]['ccontent'];
						cmtList += '</p>';
						cmtList += '</div>';
						cmtList += '</div>';
					}
				}else{
					var cmtList = '<p>등록된 댓글이 아직 없습니다</p>';
				}
				$('#cmtList').html(cmtList);
			},
			error : function(){
				console.log('ajax error');
			}
		})
	}
	
	$(function(){
		getCommentList();
		$('#cmtBtn').click(function(){
			$.ajax({
				url:"${rUrl}/comment",
				data:{'bnum':'${dto.bnum}', 'content':$('#cmt').val()},
				method:'post',
				beforeSend : function(xhr){ xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");},
				success:function(result){
					if(result == 'success'){
						getCommentList();
						$('#cmt').val('');
					}else{
						alert('로그인이 필요합니다.');
						location.href = "${rUrl}/";
					}
				},
				error:function(){
					console.log('ajax write error');
				}
			})
		})
		$(document).on('click', '.delete', function(){
			$.ajax({
				url:'${rUrl}/comment/' + this.id,
				method: 'delete',
				beforeSend : function(xhr){ xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");},
				success : function(){
					getCommentList();
				},
			})			
		})
	})
</script>
</body>

</html>