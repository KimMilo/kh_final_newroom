<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="rUrl" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜하기 목록</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<section class="text-center" style="background:none; margin-top: 3rem!important;">
	    <div class="container">
	      <h3 style="padding-bottom: 3rem!important;">찜한 매물 목록</h3>
	    </div>
  	</section>
	<div class="album py-1">
	  <div class="container">
	    <div class="row">
	    <c:choose>
		    <c:when test="${not empty interList}">
			    <c:forEach items="${interList}" var="inter">
			    <div class="col-md-4">
			        <div class="card mb-4 shadow-sm">
			          	<c:if test= "${inter.img eq null}">
							<img src="${rUrl}/resources/img/room_sample.PNG" alt="" style="width: 100%; height: auto;">
    					</c:if>
						<c:if test= "${inter.img ne null}">
							<img src="${rUrl}/resources/img/houseinner/${inter.img}" alt="" style="width: 100%; height: auto;">
    					</c:if>
			          <div class="card-body">
			          	<div style="overflow: hidden; height:30px; width:100%;"><h4>${inter.aptName}</h4></div>
			            <p class="card-text text-right" style="margin-bottom:0px;">
			           	<p class="card-text" style="font-size:20px;"><b>매매     ${inter.dealAmount}</b></p>
			            <p style="margin-bottom:0px;">${inter.floor}층</p>
			            <p style="margin-bottom:5px;">면적 ${inter.area}㎡
			            </p>
			            <div class="d-flex justify-content-between align-items-center">
			              <div class="btn-group">
			            	<button type="button" class="btn btn-outline-primary detailBtn" id="${inter.dealId }"
			            	 data-toggle="modal" data-target="#myModal">자세히 보기</button>
			              </div>
			            </div>
			          </div>
			        </div>
			      </div>
			    </c:forEach>
		    </c:when>
		    <c:otherwise>
		    	<h1>찜한 매물이 없습니다.</h1>
		    </c:otherwise>
		</c:choose>
	    </div>
	  </div>
	</div>
	
	<div id="myModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <div class="modal-content">
	      <div class="modal-body" id="detailContent">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-outline-danger" id="deleteInterest" data-dismiss="modal">찜하기 취소</button>
	        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	
	  </div>
	</div>
	
	<jsp:include page="footer.jsp" />


<script>
		var detailNo = '';
		$(function(){
			$(".detailBtn").click(function(){
				$.ajax({
					url:'interest/detail/'+this.id,
					method: 'get',
					success: function(result){
						var html = '';
						html += '<h3 style="padding: 15px 0px;">' + result.aptName + '</h3>';
						if(result.img == null){
							html += '<img src="${rUrl}/resources/img/room_sample.PNG" alt="" style="width: 140px; height: 100px;">';
						}else{
							html += '<img src="${rUrl}/resources/img/houseinner/' + result.img + '" alt="" style="width: 400px; height: 320px;">';
						}
						html += '<p class="card-text" style="font-size:20px; margin-top: 10px;"><b>매매     ' + result.dealAmount + '</b></p>';
			            html += '<p style="margin-bottom:0px;">' + result.floor + '층, ';
			            html += '<p style="margin-bottom:5px;">' + result.area + '㎡</p>';
			            html += '<p>' + result.dealYear + '년 ' + result.dealMonth + '월 ' + result.dealDay + '일 </p>';
			            $("#detailContent").html(html);
			            
			           	detailNo = result.dealId;
					},
				});
			});
			
			$("#deleteInterest").click(function(){
				$.ajax({
					url:'${rUrl}/interest/'+detailNo,
					method:'delete',
					beforeSend : function(xhr){ xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");},
					success:function(){
    					alert("찜 목록에서 해제 되었습니다.");
    					location.href="${rUrl}/interest";
					}
				})
			});
		});
</script>
</body>
</html>