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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>header</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>

<body>
    <!-- Navbar -->
	<nav class="ms-2 navbar navbar-expand-sm navbar-default py-3 border-bottom justify-content-between">
		<div class="navbar navbar__logo">
			<span class="bg-opacity-0 logo material-symbols-outlined" style="color: orange; font-size: 24px;">Home</span>
			<a class="navbar-brand happy-font title" style="color: orange;" href="${rUrl}/"><b>NewRoom</b></a>
		</div>
		<div class="navbar navbar__menu">
			<ul class="navbar-nav menu mx-md-3" id="navMenu">
			</ul>
		</div>
	</nav>

    <!--Modal-->
	<!--로그인-->
	<div class="modal" id="login">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header justify-content-center">
					<h4 class="modal-title">로그인</h4>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="pl-5 pr-5 form form-group">
						<input type="text" name="userid" id="useridLogin"
							class="my-2 form-control col-md-12 d-inline" placeholder="아이디"><br>
						<input type="password" name="userpw" id="userpwLogin"
							class="form-control col-md-12 d-inline" placeholder="패스워드">
						<div style="float: left;">
							<a href="${rUrl}/member/findid" class="text-secondary float-right py-2"
								style="font-size: 13px;">아이디 찾기</a>
						</div>
						<div>
							<a href="${rUrl}/member/findpw" class="text-secondary float-right py-2"
								style="font-size: 13px;">비밀번호 찾기</a>
						</div>
						<button id="submitLogin" class="btn btn-outline-secondary col-md-12">로그인</button>
					</div>					
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<!--회원가입-->
	<div class="modal" id="join">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header justify-content-center">
					<h4 class="modal-title">회원가입</h4>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="pl-3 pr-1 form form-group">
						<div class="form-inline form-group col-14">
							<label for="useridJoin" class="control-label col-3">아이디<span
								style="color: red;">*</span></label>
							<div class="col-9">
								<input type="text" class="form-control" id="useridJoin" name="userid"
									placeholder="아이디를 입력하세요">
								<button id="idcheck" type="submit" class="btn">중복체크</button><br>
							</div>
						</div>

						<div class="form-inline form-group col-14">
							<label for="userpwJoin" class="col-3 control-label">비밀번호<span
								style="color: red;">*</span></label>
							<div class="col-9">
								<input type="password" class="form-control" id="userpwJoin" name="userpw"
									placeholder="비밀번호를 입력하세요">
							</div>
						</div>

						<div class="form-inline form-group col-14">
							<label for="name" class="col-3 control-label">이름<span
								style="color: red;">*</span></label>
							<div class="col-9">
								<input type="text" class="form-control" id="name" name="username"
									placeholder="이름을 입력하세요">
							</div>
						</div>

						<div class="form-inline form-group col-14">
							<label for="address" class="col-3 control-label">이메일<span
								style="color: red;">*</span></label>
							<div class="col-9">
								<input type="email" class="form-control" id="email"
									name="useremail" placeholder="newroom@naver.com">
							</div>
						</div>

						<div class="form-inline form-group col-14">
							<label for="phone" class="col-3 control-label">전화번호<span
								style="color: red;">*</span></label>
							<div class="col-9">
								<input type="text" class="form-control" id="phone" name="userphone"
									placeholder="010-xxxx-xxxx">
							</div>
						</div>
						<button id="submitJoin" class="btn btn-outline-secondary col-sm-10 ml-4">회원가입</button>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
<script>
    	var idChk = false;
    	var userName = '';
    	$(function(){
    		updateNavMenu();
    		 $(document).on("click","#logout",function(event){
    			 $.ajax({
     				url : '${rUrl}/member/logout',
     				method:'get',
     				success:function(result){
     					if(document.location.href.split("8090")[1] != '/nr/#' && 
     							document.location.href.split("8090")[1] != '/nr/search#'){
							location.href='/nr';
     					}else{
     						updateNavMenu();
     					}
     				}
     			});
    	    });
    		
    		$("#idcheck").click(function(){
    			if(!$('#useridJoin').val()){
    				alert("ID를 입력하세요.");
    			}else{
    				$.ajax({
    					url:'${rUrl}/member/idCheck/'+$("#useridJoin").val(),
    					method: 'get',
    					success: function(result){
    						if(result == "true"){
    							alert("사용 가능한 ID 입니다.");
    							idChk = true;
    						}else{
    							alert("사용 불가한 ID 입니다.");
    							idChk = false;
    						}
    					},
    					error:function(){
    						console.log('ajax error');
    					}
    				})
    			}
    		});
    		
    		$("#useridJoin").change(function(){
    			idChk = false;
    		});
    		
    		$("#submitJoin").click(function(){
    			if(idChk == false){
    			 	alert("ID 중복 체크해주세요.");
    				return false;
    			}else {
    				$.ajax({
    					url:'${rUrl}/member/join',
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
    		
    		$("#submitLogin").click(function(){
    			$.ajax({
    				url: '${rUrl}/member/login',
    				method: 'post',
    				data:{
    					'userid' : $("#useridLogin").val(),
    					'userpw' : $("#userpwLogin").val(),
    				},
    				success:function(result){
    					if(result == "false"){
    						alert("아이디 또는 비밀번호를 확인해주세요");
    					}else{
    			    		updateNavMenu();
							$("#useridLogin").val("");
    						$("#userpwLogin").val("");
    						
    						alert("로그인 성공!!!");
    						location.href="${rUrl}";
    						
    					}
    				},
    				error: function(){
    					console.log('ajax error');
    				}
    			});
    		});
    	});
    	
    	var updateNavMenu = function(){
    		$.ajax({
				url : '${rUrl}/member/getUserId',
				method: 'get',
				success: function(user){
					var content = '';
					if(user.userId){
						userName = user.name;
		    			content += '<li class="nav-item">';
		    			content += '<a href="${rUrl}/noticeList" ';
		    			content += 'class="nav-link font-weight-bold text-dark">공지사항 </a></li>';
		    			content += '<li class="nav-item">';
		    			content += '<a href="${rUrl}/qna" ';
		    			content += 'class="nav-link font-weight-bold text-dark">QnA </a></li>';
		    			content += '<li class="nav-item">';
		    			content += '<a href="${rUrl}/search" ';
		    			content += 'class="nav-link font-weight-bold text-dark">실거래가 검색 </a></li>';
		    			content += '<li class="nav-item">';
		    			content += '<a href="${rUrl}/interest" ';
		    			content += 'class="nav-link font-weight-bold text-dark">찜한 매물 </a></li>';
		    			
		    			if(user.admin == "true"){
		    				content += '<li class="nav-item">';
		    				content += '<a href="${rUrl}/member/list" ';
		    				content += 'class="nav-link text-dark"><b>회원 목록</b></a></li>';
		    			}    				
		    				
		    			content += '<li class="nav-item">';
		    			content += '<a href="${rUrl}/member/mypage" ';
		    			content += 'class="nav-link text-dark"><b>마이페이지</b></a></li>';
		    			content += '<li class="nav-item mr-4">';
		    			content += '<a href="" id="logout" ';
		    			content += 'class="nav-link text-dark"><b>로그아웃</b></a></li>';
		    			content += '<li class="nav-item ml-3 nav-link text-dark">';
		    			content += '<b>' + user.name + '</b>';
		    			content += '(' + user.userId + ')님 환영합니다 :D</li>';
		    			
		    			updateInterestLogin();
		    		}else{
		    			content += '<li class="nav-item mr-2">';
		    			content += '<button class="btn btn-outline-secondary mr-2" ';
		    			content += 'data-toggle="modal" data-target="#join">회원가입</button></li>';
		    			content += '<li class="nav-item mr-2">';
		    			content += '<button class="btn btn-outline-secondary" data-toggle="modal" ';
		    			content += 'data-target="#login">로그인</button></li>';
		    			
		    			updateInterestLogout();
		    		}
		   			$("#navMenu").html(content);
				},
				error: function(){
					console.log("ajax error");
				}
    		});
    	};
    	
    	// 로그인 되면 찜목록 보여주기
    	updateInterestLogin = function(){
    		$.ajax({
    			url : '${rUrl}/interest/list',
    			method : 'get',
    			success : function(result){
    				var content = '<nav class="navbar navbar-expand-md navbar-light bg-transparent pl-0 pb-0">';
    				content += '<ul class="navbar-nav"><li class="nav-item">';
    				content += '<a href="" class="nav-link active font-weight-bold">';
    				content += '<h3>'+userName+'님이 찜한 매물</h3></a></li></ul>';
    				content += '<a href="${rUrl}/interest" id="gotoInterDetail">+ 자세히보기</a></nav>';
    				content += '<div class="container text-center">';
    				content += '<div class="card d-inline-block" style="position:relative 0 0; width: 1080px; border:none;">';
    				if(result == null){
    					content = '<p class="pl-md-2">아직 찜한 매물이 없습니다. </p>';
    				}else{
    					for(var i = 0; i < result.length; i++){
    						if(i >= 3) break;
    						
    						content += '<div class="card-body p-md-1 float-left text-left mr-2" ';
    						content += 'style="width: 280px; height: 325px;"> ';
    						
    						if(result[i].img == null){
    							content += '<p class="card-text pt-1"><img src="${rUrl}/resources/img/room_sample.PNG" alt="" style="width: 280px; height: 186px;"></p>';
    						}else{
    							content += '<p class="card-text pt-1"><img src="${rUrl}/resources/img/houseimg/' + result[i].img + '" alt="" style="width: 280px; height: 186px;"></p>';
    						}
    						content += '<h5 class="card-text pt-2">' + result[i].aptName + '</h5>';
    						content += '<p class="card-text pt-1" style="font-size:20px;">';
    						content += '<b>매매 ' + result[i].dealAmount + '만원</b></p>';
    						content += '<p class="card-text pt-1"  style="font-size:14px; color:#333;">';
    						content += '<span>' + result[i].floor + '층</span></p>';
    						content += '<p class="card-text pt-1" style="font-size:14px; color:#666;">';
    						content += '<span style="font-size:15px;">면적 </span><span>' + result[i].area + 'm</span></p>';
    						content += '</div>';
    					}
    				}
    				content += '</div>';
    				$("#simpleInterestList").html(content);
    			},
    			error:function(){
    				console.log("ajax error");
    			}
    		});
    	}
    	
    	// 로그아웃 하면 찜목록 없애기
    	updateInterestLogout = function(){
    		$("#simpleInterestList").html('');
    	}
    	
    </script>
</body>
</html>
