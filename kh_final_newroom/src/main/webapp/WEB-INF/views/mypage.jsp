<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rUrl" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="kr">
<head>
<link rel="stylesheet" type="text/css" href="${rUrl}/resources/css/style.css" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0">
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<title>마이페이지</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp" />

<!--content-->
<div class="container text-center col-lg-12">
	<h2 class="pt-5 py-5">마이 페이지</h2>
    <div class="col-md-12 py-3">
        <div id="tap1" style="border-bottom: 2px solid #000; font-weight:bold;" class="col-md-3 d-inline pr-5 pl-5 py-3 mypageMenu">
        	<a style="color: #000;" href="#">내 정보</a>
        </div>
        <div id="tap2" style="border-bottom: 1px solid #666; font-weight:light;" class="col-md-3 d-inline pr-5 pl-5 py-3 mypageMenu">
        	<a style="color: #6c757d;" href="#">정보 수정</a>
        </div>
        <div id="tap3" style="border-bottom: 1px solid #666; font-weight:light;" class="col-md-3 d-inline pr-5 pl-5 py-3 mypageMenu">
        	<a style="color: #6c757d;" href="#" data-toggle="modal" data-target="#delete">탈퇴하기</a>
        </div>
    </div>
</div>

<!--내 정보-->
<div id="con1" class="collapse mt-5 my-auto pt-5 pb-5">
	<div class="content container">
       	<div class="form form-group">
       		<div class="form-group row justify-content-center col-md-11">
                 <label class="col-md-2 col-form-label text-right" style="position: relative; top: 7px;">회원 사진</label>
               	 <div class="col-md-3">
                    <img width="80px;" height="70px;" src="${rUrl }/resources/img/userimg/${loginInfo.img}">
                 </div>
           </div>
           	<div class="form-group row justify-content-center col-md-11">
                 <label class="col-md-2 col-form-label text-right">아이디</label>
               	 <div class="col-md-3" style="position: relative; top: 5px;">
                    ${loginInfo.userid}
                 </div>
           </div>
          
          <div class="form-group row justify-content-center col-md-11">
               <label class="bg-transparent col-md-2 col-form-label text-right ">이름</label>
               <div class="col-md-3" style="position: relative; top: 5px;">
                    ${loginInfo.username}
               </div>
          </div>
          <div class="form-group row justify-content-center col-md-11">
               <label class="col-md-2 col-form-label text-right">이메일</label>
               <div class="col-md-3" style="position: relative; top: 5px;">
                   ${loginInfo.useremail}
               </div>
          </div>
          <div class="form-group row justify-content-center col-md-11">
               <label class="col-md-2 col-form-label text-right">전화번호</label>
               <div class="col-md-3" style="position: relative; top: 5px;">
                   ${loginInfo.userphone}
               </div>
          </div>
       </div>
   </div>
</div>

<!--정보수정-->
<div id="con2" class="collapse mt-5 my-auto pt-5 pb-5">
      <div class="content container">
            <div class="form form-group">
	            <div class="form-group row justify-content-center col-md-11">
	                 <label class="col-md-2 col-form-label text-right" style="position: relative; top: 7px;">회원 사진</label>
	               	 <div class="col-md-3">
	                    <img width="80px;" height="70px;" src="${rUrl }/resources/img/userimg/${loginInfo.img}">
	                 </div>
	           </div>
      		<form id="modifyInfo">
	            <div class="form-group row justify-content-center col-md-11">
            		<label for="modifyImg" class="col-md-2 col-form-label text-right" style="position: relative; left: 10px; font-size:12px; color: blue;"><b>사진 변경</b></label>
	            	<div class="col-md-3">
		                <input type="file" id="modifyImg" name="report">
	            	</div>
	           </div>
                <div class="form-group row justify-content-center col-md-11">
                    <label class="col-md-2 col-form-label text-right">아이디</label>
                    <div class="col-md-3">
                        <input type="text" name="userid" class="form-control" value="${loginInfo.userid}" readonly>
                    </div>
                </div>
            	<div class="form-group row justify-content-center col-md-11">
                    <label for="userpwCheck" class="col-md-2 col-form-label text-right">비밀번호<span
                            style="color: red;">*</span></label>
                    <div class="col-md-3">
                        <input type="password" autoComplete="off" name="userpw" id="userpwCheck" class="form-control" placeholder="비밀번호 재입력.">
                    </div>
                </div>
                <div class="form-group row justify-content-center col-md-11">
                    <label for="usernameModify" class="col-md-2 col-form-label text-right">이름<span
                            style="color: red;">*</span></label>
                    <div class="col-md-3">
                        <input type="text" name="username" id="usernameModify" class="form-control" value="${loginInfo.username}">
                    </div>
                </div>
                <div class="form-group row justify-content-center col-md-11">
                    <label for="useremailModify" class="col-md-2 col-form-label text-right">이메일<span
                            style="color: red;">*</span></label>
                    <div class="col-md-3">
                        <input type="email" name="useremail" id="useremailModify" class="form-control"
                            value="${loginInfo.useremail}">
                    </div>
                </div>
                <div class="form-group row justify-content-center col-md-11">
                    <label for="userphoneModify" class="col-md-2 col-form-label text-right">전화번호<span
                            style="color: red;">*</span></label>
                    <div class="col-md-3">
                        <input type="tel" name="userphone" id="userphoneModify" class="form-control" value="${loginInfo.userphone}">
                    </div>
                </div>
                </form>
                <div class="row justify-content-center">
                	<button id="modifyMember" class="btn btn-outline-danger col-md-3 mt-3 mb-5">수정완료</button>
                </div>
          </div>
     </div>
</div>  

<!-- 회원 탈퇴 -->
<div id="con3" class="collapse mt-5 my-auto pt-5 pb-5">
	<div class="modal-body text-center">
          <p>정말 탈퇴하시겠습니까?</p>
          <button class="btn btn-outline-danger" id="delMember">확인</button>
          <button class="btn btn-outline-secondary" id="cancelMember">취소</button>
    </div>
</div>

<!--content-->

<!-- Footer -->
<jsp:include page="footer.jsp" />
<script>
$(function () {
    $("#con1").css("display", "block");
    $(".mypageMenu").on("click", function () {
        let words = $(this).attr("id");
        var num = words.substr(3, 1);
        console.log(num);
        let currentCon = "con" + num;
        $("#" + currentCon).css("display", "block");
        
        let currentDiv = "tap" + num;
        $("#" + currentDiv).children('a').css("color", "#000");
        $("#" + currentDiv).children('a').css("font-weight", "bold");
        $("#" + currentDiv).css("border-bottom", "2px solid #000");

        //나머지 콘텐츠 숨기기
        for (let i = 1; i <= 3; i++) {
            if (i == num) continue;
            let hideCon = "con" + i;
            $("#" + hideCon).css("display", "none");
            
            let hideDiv = "tap" + i;
            $("#" + hideDiv).children('a').css("color", "#666");
            $("#" + hideDiv).children('a').css("font-weight", "none");
            $("#" + hideDiv).css("border-bottom", "1px solid #666");
        }

        return false;
    });
            
     // 탈퇴 확인 버튼누르면 탈퇴 진행
     $("#delMember").click(function(){
     	$.ajax({
     		url : '${rUrl}/member/${loginInfo.userid}',
     		method: 'delete',
     		beforeSend : function(xhr){ xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");},
     		contentType: 'application/json; charset=utf-8',
     	    success:function(response){
     	    	if(response == 'success'){
      	    		alert("탈퇴 하였습니다.");
					location.href="${rUrl}";
     	    	}else{
     	    		alert("탈퇴에 실패하였습니다.");
     	    		location.href="${rUrl}/member/mypage";
     	    	}
     	    },
     	    error : function(xhr, status, msg){
		console.log(status + " " + msg);
	}
     	});
     });  
     
     // 탈퇴 취소 버튼 클릭 시 마이페이지로 이동
     $("#cancelMember").click(function(){
    	location.href='${rUrl}/member/mypage'; 
     });
            
       	// 수정 버튼 누르면 수정 진행
         $("#modifyMember").click(function(){
        	var pwCheck = $('#userpwCheck').val();
        	if(pwCheck == ""){
        		alert("비밀번호 확인이 필요합니다.")
        	} else {
	         	var form = $('#modifyInfo')[0];
	         	var formData = new FormData(form);
	         	$.ajax({
	         		url : '${rUrl}/member/mypage',
	         		method: 'post',
	         		enctype:'multipart/form-data',
	         		beforeSend : function(xhr){ xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");},
	         		data: formData,
	         		processData: false,
				    contentType: false,
	         	    success:function(response){
	         	    	if(response == 'success'){
	          	    	alert("수정 하였습니다.");
	         	    	}else{
	         	    		alert("수정에 실패하였습니다.");
	         	    	}
	         	    	
	        	    	location.href="${rUrl}/member/mypage";
	         	    },
	         	    error : function(xhr, status, msg){
	 					console.log(status + " " + msg);
	 				}
	         	    
	         	});
        	}
         });   
     });
</script>
</body>
</html>