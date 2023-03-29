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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>NewRoom-Q&A</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">질문하기</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form action="${rUrl }/qna" method="post">
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
		            <input type="text" class="form-control" id="useridQna1" name="userid" placeholder="" disabled>
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
		<br>
		<br>
		<h3><a href="<%=request.getContextPath() %>/qna" class="router-link-exact-active router-link-active" aria-current="page">QnA</a></h3>
		<div>
			<nav class="container navbar navbar-expand-sm navbar-light">
				<button id="btnWrite" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">질문하기</button>
				<form class="navbar-nav ml-auto" method="get">
					<div class="form-group mr-1">
						<select name="search_type" class="form-control">
							<option value="btitle">제목</option>
							<option value="bcontent">내용</option>
							<option value="userid">작성자</option>
						</select>
					</div>
					<div class="form-group mr-1">
						<input id="searchKeyword" type="text" placeholder="검색어 입력" class="form-control">
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
					<c:forEach var="d" items="${dto }">
						<tr>
							<th width="15%">${d.bnum }</th>
							<th width="40%" class="text-center">${d.btitle }</th>
							<th width="15%">${d.breadcnt }</th>
							<th width="15%">${d.bwritedate }</th>
							<th>
							<button type="button" class="btn btn-outline-secondary btn-sm qnaDetail" id="${d.bnum }"
							data-toggle="modal" data-target="#detailModal">Go</button>
							</th>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
	
<script>
$("#btnInsert").click(function(){
	$.ajax({
		url:'${rUrl}/qna',
		method: 'post',
		contentType: 'application/json', 
		data:JSON.stringify({
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
$(".qnaDetail").click(function(){
	$.ajax({
		url:'${rUrl}/qna/'+this.id,
		method: 'get',
		success: function(result){
			var html = '';
			html += '<style="padding: 15px 0px; font-size: 36px;"><b>제목 : ' + result.btitle + '</b><br><br>';
			html += '<style="padding: 15px 0px; font-size: 36px;"><b>작성자 : ' + result.userid + '</b> |';
            html += '<style="padding: 15px 0px; font-size: 36px;"><b>조회수 : ' + result.breadcnt + '</b><br><br>';
			html += '<class="card-text" style="white-space: pre-wrap"><b>내용 : <br><br>' + result.bcontent + '</b>';
            $("#detailContent").html(html);
            
           	detailNo = result.bnum;
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
 	    	if(result > 0){
  	    	alert("수정 하였습니다.");
 	    	}else{
 	    		alert("수정에 실패하였습니다.");
 	    	}
 	    	
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
	})
});

// var type = $("select[name=search_type]").val();
// var word = $("#keyword").val();
// $("#btnSearch").click(function(){
// 	$.ajax({
// 		url: '${rUrl}/qna/'+type+'/'+word,
// 		dataType: 'JSON',
// 		contentType: 'application/json; charset=utf-8',
// 		method: 'get',
// 		sucess:function(){
// 			var type = $("select[name=search_type]").val();
// 			var word = $("#keyword").val();
// 			location.href="${rUrl}/qna"
// 		}
// 	});
// });

// 		$("#btnSearch").click(function(){
// 			memberSearch();
// 		});
// 	});
	
// 	memberSearch = function(){
// 		var searchType = $("select[name=search_type]").val();
// 		var keyword = '%' + $("#searchKeyword").val() + '%';
		
// 		$.ajax({
// 			url : '${rUrl}/member/search',
// 			method : 'post',
// 			data:{'name' : userName},
// 			success:function(result){
// 				updateMemberList(result);
// 			},
// 			error : function(xhr, status, msg){
// 				console.log(status + " " + msg);
// 			}
// 		});
// 	}

</script>
</body>
</html>