<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rUrl" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="kr">
<head>
<style>
#app {
    font-family:Avenir,Helvetica,Arial,sans-serif; webkit-font-smoothing:antialiased; moz-osx-font-smoothing:grayscale;
    text-align:center;color:#2c3e50
    }
</style>
<link rel="stylesheet" type="text/css" href="${rUrl}/resources/css/comment.css" />
<link rel="stylesheet" type="text/css" href="${rUrl}/resources/css/style.css" />
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<title>NewRoom-Q&A</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	
	 <div class="container text-center mt-5" style="margin-bottom:0">
        <h3>QnA</h3>
    </div>
    
    <div class="container text-center mt-5" style="margin-bottom:0">
        <h3>
        	<c:choose>
        		<c:when test="${typeName eq 'btitle' }">
		        	<span style="color: orange;">제목</span>(으)로 
		        	<span style="color: orange;">'${keyword}'</span>을 검색한 결과입니다.
        		</c:when>
        		<c:when test="${typeName eq 'bcontent' }">
        			<span style="color: orange;">내용</span>(으)로 
        			<span style="color: orange;">'${keyword}'</span>을 검색한 결과입니다.
        		</c:when>
        		<c:when test="${typeName eq 'userid' }">
        			<span style="color: orange;">작성자</span>(으)로 
        			<span style="color: orange;">'${keyword}'</span>을 검색한 결과입니다.
        		</c:when>
        		<c:otherwise>
        			<span style="color: orange;">자주묻는 질문</span>입니다. 
        		</c:otherwise>
        	</c:choose>
        	
        </h3>
    </div>
    	
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">질문하기</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form action="${rUrl }/qna" method="post">
	        	<input type="hidden" name="${_csrf.headerName }" value="${_csrf.token }">
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">작성자 : </label>
	            <input type="text" class="form-control" id="useridQna" name="userid" value="${loginInfo.userid }" disabled>
	          </div>
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">제목 : </label>
	            <input type="text" class="form-control" id="btitle" name="btitle">
	          </div>
	          <div class="mb-3">
	            <label for="message-text" class="col-form-label">내용 : </label>
	            <textarea rows="15" class="form-control" id="bcontent" name="bcontent"></textarea>
	          </div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button  id="btnInsert" type="button" class="btn btn-primary">등록</button>
	      </div>
	    </div>
	  </div>
	</div>
	<div id="detailModal" class="modal fade" role="dialog">
	  	<div class="modal-dialog">
	    	<div class="modal-content">
	      		<div class="modal-body container bg-light" id="detailContent" style="width: 700px; height: 700px; font-size: 20px;">
	      		</div>
	      		<div class="modal-body container bg-light" id="detailComment" style="width: 700px;">
		     	</div>
	     		<div class="modal-footer container bg-light" style="width: 700px;">
		      		<button type="button" class="btn btn-outline-secondary updateGo" data-dismiss="modal"
		      		data-toggle="modal" data-target="#updateModal">수정</button>
		       		<button type="button" class="btn btn-outline-danger" id="deleteQna" data-dismiss="modal">삭제</button>
		       		<button type="button" class="btn btn-outline-primary" data-dismiss="modal">닫기</button>
	     		</div>
	    	</div>
	  	</div>
	</div>
		
	<div id="updateModal" class="modal fade" role="dialog">
	  	<div class="modal-dialog">
			
	    <div class="modal-content">
	      <div class="modal-body container bg-light" id="detailContent" style="width: 700px; height: 700px; font-size: 20px;">
	       	<form>
		          <div class="mb-3">
		            <label for="recipient-name" class="col-form-label">작성자 : </label>
		            <input type="text" class="form-control" id="useridQna1" name="userid" value="${loginInfo.userid }" disabled>
		          </div>
		          <div class="mb-3">
		            <label for="recipient-name" class="col-form-label">제목 : </label>
		            <input type="text" class="form-control" id="btitle1" name="btitle" placeholder="">
		          </div>
		          <div class="mb-3">
		            <label for="message-text" class="col-form-label">내용 : </label>
		            <textarea rows="15" class="form-control" id="bcontent1" name="bcontent" placeholder=""></textarea>
		          </div>
	        </form>
	      </div>
	      <div class="modal-footer container bg-light" style="width: 700px;">
	      <button type="button" class="btn btn-outline-secondary" id="updateQna" data-dismiss="modal">수정완료</button>
	        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	<div id="app">
		<div>
			<nav class="container navbar navbar-expand-sm navbar-light">
				<button id="btnWrite" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">질문하기</button>
				<c:if test="${typeName ne 'FAQ' }">
					<button id="btnFAQ" class="ms-3 btn" style="background-color: orange;"><b style="color:white;">FAQ가기</b></button>
				</c:if>
				<button class="ms-3 btn btn-outline-secondary" onclick="location.href='${rUrl}/qna'">목록</button>
				<div id="btnQnL">
				</div>
				<form class="navbar-nav ml-auto" action="${rUrl}/qna/search" method="get">
					<div class="form-group mr-1">
						<select name="search_type" class="form-control">
							<option value="btitle">제목</option>
							<option value="bcontent">내용</option>
							<option value="userid">작성자</option>
						</select>
					</div>
					<div class="form-group mr-1">
						<input id="searchKeyword" type="text" name="keyword" placeholder="검색어 입력" class="form-control">
					</div>
					<div class="form-group">
						<button id="btnSearch" class="btn btn-outline-primary">검색</button>
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
							<th width="15%">자세히</th>
						</tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${empty paging.page }">
							<tr><td colspan="5">검색된 결과가 없습니다.</td></tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="data" items="${paging.page }">
								<tr>
									<c:choose>
										<c:when test="${data.questionnum ne 0 }">
											<td width="15%" class="text-center">Re</td>
										</c:when>
										<c:otherwise>
											<td width="15%">${data.bnum }</td>
										</c:otherwise>
									</c:choose>
									<td width="40%" class="text-center">${data.btitle }</td>
									<td width="15%">${data.breadcnt }</td>
									<td width="15%">${data.bwritedate }</td>
									<td>
									<button type="button" class="btn btn-outline-secondary btn-sm qnaDetail" id="${data.bnum }"
									data-toggle="modal" data-target="#detailModal">Go</button>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</form>
		</div>
		</div>
	</div>
	
	<div class="container" style="margin-bottom:0">
    <div>
		<ul class="mt-2 pagination justify-content-center">
			<c:set var="pageNumber" value="${empty param.p ? 1 : param.p }" />
			<c:choose>
				<c:when test="${paging.prevPage eq - 1 or empty paging.page}">
					<li class="page-item disabled"><a class="page-link">prev</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="${rUrl }/qna/search?search_type=${typeName }&keyword=${keyword }&p=${paging.prevPage }">prev</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="pNum" items="${paging.pageList }">
				<li class="page-item ${pNum eq pageNumber ? 'active' : '' }"><a class="page-link" href="${rUrl }/qna/search?search_type=${typeName }&keyword=${keyword }&p=${pNum }">${pNum }</a></li>
			</c:forEach>
			<c:choose>
				<c:when test="${paging.nextPage eq - 1 or empty paging.page}">
					<li class="page-item disabled"><a class="page-link">next</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="${rUrl }/qna/search?search_type=${typeName }&keyword=${keyword }&p=${paging.nextPage}">next</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
  </div>
	
	<jsp:include page="footer.jsp" />
	
<script>
$('#btnFAQ').click(function(){
	location.href="${rUrl}/qna/search?search_type=FAQ&keyword=T";
});

$("#btnInsert").click(function(){
	$.ajax({
		url:'${rUrl}/qna',
		method: 'post',
		contentType: 'application/json', 
		beforeSend : function(xhr){ xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");},
		data:JSON.stringify({
			'bnum' : '',
			'userid' : $("#useridQna").val(),
			'btitle' : $("#btitle").val(),
			'bcontent' : $("#bcontent").val(),
		}),
		success: function(result){
			if(result.length > 0){
				alert(result);
			}else{
				$("#useridQna").val("");
				$("#title").val("");
				$("#context").val("");
				
				alert("질문등록 완료");
				location.href="${rUrl}/qna";
			}
		},
		error : function(){
			console.log('ajax error');
		}
	});
});

var detailNo = '';
var detailBtitle = '';
var detailBcontent = '';

$(".qnaDetail").click(function(){
	$.ajax({
		url:'${rUrl}/qna/'+ this.id,
		method: 'get',
		success: function(result){
			var html = '';
			var htmlBtn = '';
			html += '<style="padding: 15px 0px; font-size: 36px;"><b>제목 : ' + result.btitle + '</b><br><br>';
			html += '<style="padding: 15px 0px; font-size: 36px;"><b>작성자 : ' + result.userid + '</b> |';
            html += '<style="padding: 15px 0px; font-size: 36px;"><b>조회수 : ' + result.breadcnt + '</b><br><br>';
			html += '<class="card-text" style="white-space: pre-wrap"><b>내용 : <br><br>' + result.bcontent + '</b>';
			
            $("#detailContent").html(html);
            
           	detailNo = result.bnum;
           	detailBtitle = result.btitle;
           	detailBcontent = result.bcontent;
           	
           	if(result.questionnum == 0){
           		htmlBtn += '<div class="form-floating">';
           		htmlBtn += '<input type="hidden" id="replyUserid" value="${loginInfo.userid}">'
           		htmlBtn += '<textarea class="form-control qnaReply" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></textarea>';
           		htmlBtn += '<label for="floatingTextarea2"><img src="${rUrl }/resources/img/profile.5405d77c.png"  class="pe-1" width="25px" height="25px" alt="">Comment</label></div>';
           		htmlBtn += '<button type="button" id="btnInsertReply" class="btn btn-outline-success addComment" data-dismiss="modal" data-toggle="modal" data-target="#addModal" style="float:right;">답변 등록</button>';
           	}
			
           	$("#detailComment").html(htmlBtn);
           	
           	$("#btnInsertReply").click(function(){
           		$.ajax({
           			url:'${rUrl}/qna',
           			method: 'post',
           			contentType: 'application/json', 
           			beforeSend : function(xhr){ xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");},
           			data:JSON.stringify({
           				'bnum' : detailNo,
           				'userid' : $('#replyUserid').val(),
           				'btitle' : '└답변 : ' + detailBtitle,
           				'bcontent' : 'Q)<br>' + detailBcontent + '<br><br><hr><br><br>' + 'A)<br>' + $(".qnaReply").val(),
           			}),
           			success: function(result){
           				if(result.length > 0){
           					alert(result);
           				}else{
           					alert("답변 등록 완료");
           					location.href="${rUrl}/qna";
           				}
           			},
           			error : function(){
           				console.log('ajax error');
           			}
           		});
           	});

		}
	});
});


$(".updateGo").click(function(){
	$.ajax({
		url:'${rUrl}/qna/'+detailNo,
		method: 'get',
		success: function(result){
			$('#useridQna1').attr("value", result.userid);
			$('#btitle1').attr("value", result.btitle);
			$('#bcontent1').attr("placeholder", result.bcontent);
		
		}
	});
});

$("#updateQna").click(function(){
 	var dto = {
 		'bnum' : detailNo,
		'userid' : $("#useridQna1").val(),
		'btitle' : $("#btitle1").val(),
		'bcontent' : $("#bcontent1").val(),
 	}
 	$.ajax({
 		url : '${rUrl}/qna',
 		method: 'put',
 		contentType: 'application/json; charset=utf-8',
 		data: JSON.stringify(dto),
 	    success:function(result){
  	    	alert("수정 하였습니다.");
	    	location.href="${rUrl}/qna/";
 	    },
 	    error : function(xhr, status, msg){
				console.log(status + " " + msg);
			}
 	    
 	});
 });  

$("#deleteQna").click(function(){
	$.ajax({
		url:'${rUrl}/qna/'+detailNo,
		method:'delete',
		success:function(){
			alert("게시글이 삭제되었습니다.");
			location.href="${rUrl}/qna";
		}
	});
});
		
$(".updateGo").click(function(){
	$.ajax({
		url:'${rUrl}/qna/'+detailNo,
		method: 'get',
		success: function(result){
			$('#useridQna1').attr("value", result.userid);
			$('#btitle1').attr("value", result.btitle);
			$('#bcontent1').attr("placeholder", result.bcontent);
		
		}
	});
});

$("#updateQna").click(function(){
 	var dto = {
 		'bnum' : detailNo,
		'userid' : $("#useridQna1").val(),
		'btitle' : $("#btitle1").val(),
		'bcontent' : $("#bcontent1").val(),
 	}
 	$.ajax({
 		url : '${rUrl}/qna',
 		method: 'put',
 		contentType: 'application/json; charset=utf-8',
 		data: JSON.stringify(dto),
 	    success:function(result){
  	    	location.href="${rUrl}/qna";
 	    },
 	    error : function(xhr, status, msg){
				console.log(status + " " + msg);
			}
 	});
 });  

$("#deleteQna").click(function(){
	$.ajax({
		url:'${rUrl}/qna/'+detailNo,
		method:'delete',
		success:function(){
			alert("게시글이 삭제되었습니다.");
			location.href="${rUrl}/qna";
		}
	})
});
</script>
</body>
</html>