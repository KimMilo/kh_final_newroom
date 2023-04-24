<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="rUrl" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="kr">
<head>
<link rel="stylesheet" type="text/css" href="${rUrl}/resources/css/chat-style.css" />
<link rel="stylesheet" type="text/css" href="${rUrl}/resources/css/style.css" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0">
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">	
<title>footer </title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
</head>
<%
Date today = new Date();
SimpleDateFormat df = new SimpleDateFormat("hh:mm aa");
String time = df.format(today);
%>
<body>
<!-- Footer -->
<footer id="footer" class="footer py-3 my-md-3" style="background-color: rgb(238, 221, 130);">
    <!-- 사이트 맵 -->
    <div class="row d-flex justify-content-end">
      	<div class="col-3">
       		<i class="bg-opacity-0  logo material-symbols-outlined text-muted" style="font-size:55px;">Home_Work</i>
       		<small class="text-muted">© 2023</small>
      	</div>
    	<div class="col-3">
        	<h3>Features</h3>
        	<ul class="list-unstyled">
          		<li><a href="${rUrl}/noticeList" class="text-muted">공지사항</a></li>
         		<li><a href="${rUrl}/qna" class="text-muted">Q&A</a></li>
        	</ul>
      	</div>
   		<div class="col-3">
     		<h3>About</h3>
     		<ul class="list-unstyled">
      			<li><a href="${rUrl}/introduction" class="text-muted">소개</a></li>
     		</ul>
   		</div>
	    	<!-- CopyRight -->
	    <div class="container">
	     	 <span class="me-2 text-muted" style="float:right;">Copyright 2023. 김태룡. ALL RIGHTS RESERVED</span>
	    </div> 
    </div>
    
    
    <sec:authorize access="hasRole('ROLE_MEMBER')">
    <div id="chat_icon"></div>
	<div id="chat_content">
		<div class="chYXNL">
			<div data-ch-testid="back-button" class="pTkUZ">
				<div name="back3" size="18" class="kpjiFD"></div>
			</div>
			<div class="TmRQW">
				<div class="ifoTHc">
					<div class="jyCzTS">NewRoom</div>
					<div name="offhours" size="22" width="22" height="22" class="fVdwuK"></div>
				</div>
				<div class="gLDehK">1:1 상담사와 연결 됩니다.</div>
			</div>
			<div
				class="jOQCgr">
				<div class="ePYepb">
					<div name="close2" size="18" width="30" height="30" class="closeBtn"></div>
				</div>
			</div>
		</div>
		<div class="UserChatsstyled__Content-j27mpg-0 cxfUhJB">
			<div data-ch-testid="user-chat"
				class="UserChatstyled__Wrapper-sc-1to4g9-0 jlSJnZ">
				<div class="UserChatstyled__Body-sc-1to4g9-1 eXGIrr">
					<div class="Messengerstyled__Wrapper-sc-1e1ufgm-2 gEPVqv">
						<div class="MessageStreamstyled__Wrapper-sc-1hff8rl-7 eEnBHd">
							<div id="chatList" class="iwuPmL kWDOaK">
							</div>
						</div>
						<div class="MessengerFooterstyled__Wrapper-i9sssu-0 hZzROU">
							<div class="MessengerFooterstyled__Dropzone-i9sssu-1 drHBgO"
								aria-disabled="false" style="position: relative;">
								<input type="file" multiple="" autocomplete="off"
									style="position: absolute; top: 0px; right: 0px; bottom: 0px; left: 0px; opacity: 1e-05; pointer-events: none;">
							</div>
							<div class="MessengerFooterstyled__Emoji-i9sssu-2 iNHUFb"></div>
							<textarea id="chatContent" data-ch-testid="messenger-footer-text-area"
								placeholder="메시지를 입력해주세요."
								class="MessengerFooterstyled__TextArea-i9sssu-4 fDjmca"
								style="height: 56px;"></textarea>
							<div data-ch-testid="messenger-footer-send-button" onclick="submitFunction();" class="MessengerFooterstyled__Send-i9sssu-5 giExZC"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</sec:authorize>

	<sec:authorize access="hasRole('ROLE_ADMIN')">
	<div id="chat_icon"></div>
	<div id="chat_content">
		<div class="chYXNL">
			<div data-ch-testid="back-button" class="pTkUZ">
				<div name="back3" size="18" class="kpjiFD"></div>
			</div>
			<div class="TmRQW">
				<div class="ifoTHc">
					<div class="jyCzTS">관리자 모드</div>
					<div name="offhours" size="22" width="22" height="22" class="fVdwuK"></div>
				</div>
				<div class="gLDehK">1:1 채팅 상담 메신저</div>
			</div>
			<div
				class="jOQCgr">
				<div class="ePYepb">
					<div name="close2" size="18" width="30" height="30" class="closeBtn"></div>
				</div>
			</div>
		</div>
		
		<div id="chatRoom" class="cxfUhJB">
			<div data-ch-testid="user-chat"
				class="UserChatstyled__Wrapper-sc-1to4g9-0 jlSJnZ">
				<div class="UserChatstyled__Body-sc-1to4g9-1 eXGIrr">
					<div class="Messengerstyled__Wrapper-sc-1e1ufgm-2 gEPVqv">
						<div class="MessageStreamstyled__Wrapper-sc-1hff8rl-7 eEnBHd">
							<div id="chatList" class="iwuPmL kWDOaK">
							</div>
						</div>
						<div class="MessengerFooterstyled__Wrapper-i9sssu-0 hZzROU">
							<div class="MessengerFooterstyled__Dropzone-i9sssu-1 drHBgO"
								aria-disabled="false" style="position: relative;">
								<input type="file" multiple="" autocomplete="off"
									style="position: absolute; top: 0px; right: 0px; bottom: 0px; left: 0px; opacity: 1e-05; pointer-events: none;">
							</div>
							<div class="MessengerFooterstyled__Emoji-i9sssu-2 iNHUFb"></div>
							<textarea id="chatContent" data-ch-testid="messenger-footer-text-area"
								placeholder="메시지를 입력해주세요."
								class="MessengerFooterstyled__TextArea-i9sssu-4 fDjmca"
								style="height: 56px;"></textarea>
							<div data-ch-test onclick="submitFunction();" class="giExZC"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="roomList" class="fiwphP">
		</div>
	</div>
	</sec:authorize>
	
	<sec:authorize access="hasRole('ROLE_MEMBER')">
	<sec:authentication property="principal.username" var="userid"/>
		<script>
			$(function() {
				chatListFunction(); //기존 채팅방 목록
				
				$('#chat_icon').click(function() {
										
					$('#chat_content').css("display", "block");
					$('#chat_icon').css("display", "none");
					getInfiniteChat();//기존 채팅목록 갱신
					//스크롤 자동 내림
					$('.hZzROU')[0].scrollIntoView(false);
				})
				
				$('.closeBtn').click(function(){ //닫기 버튼
					$('#chat_content').css("display", "none");
					$('#chat_icon').css("display", "block");
					
					//메시지 갱신 중지
					clearInterval(setNewMessage);
				})
				$('.kpjiFD').css("display", "none"); //뒤로 가기 버튼 안보이게
				
			})
			
			//새로운 메시지 전송
			function submitFunction(){ 
				var chatContent = $('#chatContent').val();
				$.ajax({
					url: "${rUrl}/chat",
					type: 'post',
					beforeSend : function(xhr){ xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");},
					contentType: "application/json",
					data: JSON.stringify({
						fromID: "${userid}",
						toID: "admin",
						chatContent: chatContent,
					}),
					success: function(result){
						console.log("전송 완료");
					},
					error: function(error){
						console.log(error);
					}
				});
				$('#chatContent').val('');
			}
			var lastID = 0; //가장 마지막에 받은 메시지 아이디
			
			//기존에 주고받은 채팅 목록
			function chatListFunction(){ 
				$.ajax({
					url : '${rUrl}/chat/${userid}/admin',
					method : 'get',
					success: function(result){
						if(result != ""){
							for(var i=0; i<result.length; i++){
								if(result[i]["fromID"] == "${userid}"){ //내가 쓴거
									addMyMessage(result[i]["fromID"], result[i]["chatContent"], result[i]["chatTime"], result[i]["img"])
								}
								else{ //상대방이 쓴거
									addYourMessage(result[i]["chatContent"], result[i]["chatTime"])
								}
								if(i == result.length-1) lastID = result[i]["chatID"]; //마지막 메시지번호
								 
							}
						}
						var chatTime = '<%= time %>';
						addHelloMessage(chatTime); //첫 인사말 한번만
						 //스크롤 자동 내림
					},
					error: function(error){
						console.log(error);
					}
				});
			}
			
			//새로운 작성한 메시지가 있는지
			function chatLoadNewMessage(){
				$.ajax({
					url : '${rUrl}/chat/'+lastID+'/${userid}/admin',
					method : 'get',
					success: function(result){
						if(result == "") return;
						for(var i=0; i<result.length; i++){
							if(result[i]["fromID"] == "${userid}"){ //내가 쓴거
								addMyMessage(result[i]["fromID"], result[i]["chatContent"], result[i]["chatTime"], result[i]["img"])
							}
							else{ //상대방이 쓴거
								addYourMessage(result[i]["chatContent"], result[i]["chatTime"])
							}
							lastID = result[i]["chatID"];
						}
					},
					error: function(error){
						console.log(error);
					}
				});
			}
			
			//화면에 보여줌 1.내 메시지
			function addMyMessage(fromID, chatContent, chatTime, img){ 
				$('#chatList').append('<div class="me kZiNZK">' + 
						'<div class="hzdYcJ">'+
						'<div class="me_ttl">'+
						'<div class="brWGXU">'+fromID+'</div>'+
						'<div class="cQwzqb">'+chatTime+'</div>'+
						'</div>'+
						'<div class="me_content">'+
						'<div class="me_inner">'+
						'<div class="bWMjYC">'+
						'<div>'+
						'<div class="kHnNft gETHTV">'+chatContent+'</div>'+
						'</div></div></div></div></div>'+
						'<div class="krXYna"><div size="24" class="user_profile" style="background-image: url(${rUrl}/resources/img/userimg/'+img+')"></div></div></div>'
				);
				
			}
			
			//화면에 보여줌 2. 상대방 메시지
			function addYourMessage(chatContent, chatTime){ 
				$('#chatList').append('<div class="kZiNZK dWAxCX">'+
						'<div class="krXYna">'+
						'<div size="24" class="iPebcS"></div>'+
						'</div><div class="hzdYcJ"><div class="dQDbhd"><div class="brWGXU">NewRoom</div>'+
						'<div class="cQwzqb">'+chatTime+
						'</div></div><div class="gDLhWw"><div class="iJraMc">'+
						'<div class="bWMjYC"><div><div lass="kHnNft gETHTV">' +chatContent+
						'<br></div></div></div></div></div></div></div>'
				);
			}
			
			//화면에 보여줌 3. 첫 인사말
			function addHelloMessage(chatTime){
				var faqList = [];
				//FAQ가져오기
				$.ajax({
					url : '${rUrl}/qna/'+"faq",
					method : 'get',
					success: function(result){
						if(result == "") return;
						$('#chatList').append('<div class="DayDividerstyled__DayDivider-sc-1jh9g36-0 fhpiwB">오늘</div>'+
								'<div class="kZiNZK dWAxCX">'+
								'<div class="krXYna">'+
								'<div size="24" class="iPebcS"></div>'+
								'</div><div class="hzdYcJ"><div class="dQDbhd"><div class="brWGXU">NewRoom</div>'+
								'<div class="cQwzqb">'+chatTime+
								'</div></div><div class="gDLhWw"><div id="hello_msg" class="iJraMc">'+
								'<div class="bWMjYC"><div><div lass="kHnNft gETHTV">안녕하세요 :) 무엇을 도와드릴까요?</div></div></div></div></div></div></div>'
						);
						
						$('#hello_msg').append(
							'<div class="faq_list" style="margin-top: 15px; border-radius: 12px; padding: 10px; background-color: #fff;"><b>🔹 자주 묻는 질문🔹</b></div>'
						);
						
						for(var i=0; i<result.length; i++){
							$('.faq_list').append(
								'<p style="margin-bottom: 0px; font-size: 14px; color:#2e64fe;" class="qnaContent">Q. '+result[i]["btitle"]+'</p>'+
								'<p style="display:none;">'+result[i]["bcontent"]+'</p>'
							);
						}
					
					},
					error: function(error){
						console.log(error);
					}
				});
			}
			
			//faq제목 누르면 내용 답변으로 보여주기
			$(document).on('click', '.qnaContent', function(){
				var chatContent = $(this).next().text();
				var chatTime = '<%= time %>';
				addYourMessage(chatContent, chatTime);
				//스크롤 자동 내림
				$('.hZzROU')[0].scrollIntoView(false);
			})
			
			$(document).on('mouseover', '.qnaContent', function(){
				$(this).css({"cursor":"pointer"});
				$(this).css({"text-decoration":"underline"});
				$(this).css({'color':'#2e64fe'});
			})
			
			$(document).on('mouseleave', '.qnaContent', function(){
				$(this).css({"text-decoration":"none"});
			})
			
			var setNewMessage;
			//3초마다 새로운 메시지가 있는지 확인
			function getInfiniteChat(){
				setNewMessage = setInterval(function(){
					//스크롤 자동 내림
					$('.hZzROU')[0].scrollIntoView(false);
					chatLoadNewMessage();
				}, 100);
			}
		</script>
	</sec:authorize>
	
	<sec:authorize access="hasRole('ROLE_ADMIN')">
	<sec:authentication property="principal.username" var="userid"/>
		<script>
			$(function(){
				loadRoomList(); //기존 채팅방 목록
			})
			
			//아이콘 이벤트
			$('#chat_icon').click(function() {
				$('#chat_content').css("display", "block");
				$('#chat_icon').css("display", "none");
				
				//채팅창 보이고 방 목록 안보이게
				$('#chatRoom').css("display","none");
				$('#roomList').css("display","block");
				$('.kpjiFD').css("display", "none"); //뒤로 가기 버튼
				getInfiniteRoomList(); //새로운 채팅방 확인
			})
			
			//채팅 접기
			$('.closeBtn').click(function(){
				$('#chat_content').css("display", "none");
				$('#chat_icon').css("display", "block");
				
				//채팅창 안보이고 방 목록 보이게
				$('#chatRoom').css("display","none");
				$('#roomList').css("display","block");
				$('.kpjiFD').css("display", "none"); //뒤로 가기 버튼
				
				$('#chatList *').remove(); //채팅방 비워주기
				
				//채팅방 목록, 메시지 갱신 중지
				clearInterval(setNewMessage);
				clearInterval(setNewRoom);
				
			})
			
			var lastRoomID = 0;
			
			//1. 전체 채팅방 리스트 조회
			function loadRoomList(){
				$.ajax({
					url : '${rUrl}/chat',
					method : 'get',
					success: function(result){
						if(result == ""){
							addRoomNull();
						}
						for(var i=0; i<result.length; i++){
							addRoomList(result[i]["userID"]);
							if(i == result.length-1) lastRoomID = result[i]["roomID"]; //마지막 채팅방 번호
						}
						//채팅창 안보이고 방 목록 보이게
						$('#chatRoom').css("display","none");
						$('#roomList').css("display","block");
						$('.kpjiFD').css("display", "none"); //뒤로 가기 버튼
					},
					error: function(error){
						console.log(error);
					}
				});
			}
			
			//2. 채팅방 목록 만들기
			function addRoomList(userID){
				userID = userID;
				$('#roomList').append('<div class="iBmKCq">' +
					'<div class="iMwzAU">'+
					'<div class="iIghyK"><div size="34" class="jSVhCe"></div></div>'+
					'<div class="WeNVhtT"><div class="giWeYY">'+userID+'님이</div>'+
					'<div class="dtIHNN">1:1 채팅 상담을 요청했습니다.<br></div></div></div>'+
					'<div class="dMDwgI"><div data-ch-testid="new-chat-button" class="chatBtn dMDtzc" id='+userID+'>'+
					'<div name="new-chat" width="16" height="16" size="16" class="fefFpu"></div>'+
					'채팅방 바로가기</div></div></div>'
				);
			}
			
			//채팅방 목록이 없는 경우
			function addRoomNull(){
				$('#roomList').append('<div id="roomNull" class="iBmKCq">' +
					'<div class="iMwzAU">'+
					'<div class="WeNVhtT"><div class="giWeYY"></div>'+
					'<div class="dtIHNN" style="padding: 15px 10px;">아직 도착한 메시지가 없습니다.<br></div></div></div></div>'
				);
			}
			
			var lastID = 0; //가장 마지막에 받은 메시지 아이디
			var userID = null;
			
			//3. 각 채팅방 바로가기
			$(document).on('click', '.chatBtn', function(){
				userID = this.id;
				//기존 채팅목록 가져오기
				$.ajax({
					url:'${rUrl}/chat/admin/'+ userID,
					method: 'get',
					success : function(result){
						if(result == "") return;
						for(var i=0; i<result.length; i++){
							if(result == "") return;
							for(var i=0; i<result.length; i++){
								if(result[i]["fromID"] == "admin"){ //내가 쓴거
									addMyMessage(result[i]["fromID"], result[i]["chatContent"], result[i]["chatTime"])
								}
								else{ //상대방이 쓴거
									addYourMessage(result[i]["fromID"], result[i]["chatContent"], result[i]["chatTime"], result[i]["img"])
								}
								if(i == result.length-1) lastID = result[i]["chatID"]; //마지막 메시지번호
								 //스크롤 자동 내림
								$('.hZzROU')[0].scrollIntoView(false);
							}
						}
					},
					error: function(error){
						console.log(error);
					}
				})
				
				//채팅창 보이고 방 목록 안보이게
				$('#chatRoom').css("display","block");
				$('#roomList').css("display","none");
				$('.kpjiFD').css("display", "block"); //뒤로 가기 버튼
				
				//채팅 메시지 갱신
				getInfiniteChat(userID);
			});

			
			//채팅방에서 뒤로가기 버튼
			$('.kpjiFD').on('click', function(){
				//채팅창 안보이고 방 목록 보이게
				$('#chatRoom').css("display","none");
				$('#roomList').css("display","block");
				$('.kpjiFD').css("display", "none"); //뒤로 가기 버튼
				
				$('#chatList *').remove(); //채팅방 비워주기
				clearInterval(setNewMessage); //채팅방 갱신 중단
			})
			
			function addMyMessage(fromID, chatContent, chatTime){ 
				$('#chatList').append('<div class="me kZiNZK">' + 
						'<div class="hzdYcJ">'+
						'<div class="me_ttl">'+
						'<div class="brWGXU">NewRoom</div>'+
						'<div class="cQwzqb">'+chatTime+'</div>'+
						'</div>'+
						'<div class="me_content">'+
						'<div class="me_inner">'+
						'<div class="bWMjYC">'+
						'<div>'+
						'<div class="kHnNft gETHTV">'+chatContent+'</div>'+
						'</div></div></div></div></div>'+
						'<div class="krXYna"><div size="24" class="iPebcS"></div></div></div>'
				);
			}
			
			function addYourMessage(fromID, chatContent, chatTime, img){ 
				$('#chatList').append('<div class="kZiNZK dWAxCX">'+
						'<div class="krXYna">'+
						'<div size="24" class="user_profile" style="background-image: url(${rUrl}/resources/img/userimg/'+img+')"></div>'+
						'</div><div class="hzdYcJ"><div class="dQDbhd"><div class="your_brWGXU">'+fromID+'</div>'+
						'<div class="cQwzqb">'+chatTime+
						'</div></div><div class="gDLhWw"><div class="iJraMc">'+
						'<div class="bWMjYC"><div><div lass="kHnNft gETHTV">' +chatContent+
						'<br></div></div></div></div></div></div></div>'
				);
			}
			
			//새로운 메시지 전송
			function submitFunction(){ 
				var chatContent = $('#chatContent').val();
				
				$.ajax({
					url: '${rUrl}/chat',
					type: 'post',
					contentType: "application/json",
					beforeSend : function(xhr){ xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");},
					data: JSON.stringify({
						fromID: "${userid}",
						toID: userID,
						chatContent: chatContent,
					}),
					success: function(result){
						console.log("전송 완료");
						
					},
					error: function(error){
						console.log(error);
					}
				});
				 //스크롤 자동 내림
				$('.hZzROU')[0].scrollIntoView(false);
				$('#chatContent').val('');
			}
			
			//새롭게 생성된 채팅방이 있는지
			function chatLoadNewRoom(){
				$.ajax({
					url : '${rUrl}/chat/'+lastRoomID,
					method : 'get',
					success: function(result){
						if(result == "") return;
						$('#roomNull').remove();
						for(var i=0; i<result.length; i++){
							console.log("=============새로운 채팅방 생성: "+result[i]["userID"]);
							addRoomList(result[i]["userID"]);
							if(i == result.length-1) lastRoomID = result[i]["roomID"]; //마지막 채팅방 번호
						}
					},
					error: function(error){
						console.log(error);
					}
				});
			}
			
			
			//새롭게 작성한 메시지가 있는지
			function chatLoadNewMessage(userID){
				$.ajax({
					url : '${rUrl}/chat/'+lastID+'/admin/'+userID,
					method : 'get',
					success: function(result){
						if(result == "") return;
						for(var i=0; i<result.length; i++){
							if(result[i]["fromID"] == "admin"){ //내가 쓴거
								addMyMessage(result[i]["fromID"], result[i]["chatContent"], result[i]["chatTime"])
							}
							else{ //상대방이 쓴거
								addYourMessage(result[i]["fromID"], result[i]["chatContent"], result[i]["chatTime"], result[i]["img"])
							}
							if(i == result.length-1) lastID = result[i]["chatID"]; //마지막 메시지번호
							 //스크롤 자동 내림
							$('.hZzROU')[0].scrollIntoView(false);
						}
					},
					error: function(error){
						console.log(error);
					}
				});
			}
			
			var setNewRoom;
			var setNewMessage;
			
			//3초마다 새로운 채팅방이 생겼는지 확인
			function getInfiniteRoomList(){
				setNewRoom = setInterval(function(){
				console.log("=============새로운 채팅방이 있나 3초마다 확인");
					chatLoadNewRoom();
				}, 3000);
				
			}
			
			//3초마다 새로운 메시지가 있는지 확인
			function getInfiniteChat(userID){
				setNewMessage = setInterval(function(){
				console.log("=============새로운 메시지 있나 3초마다 확인:    현재 채팅 고객 "+userID);
					chatLoadNewMessage(userID);
				}, 3000);
			}
		</script>
	</sec:authorize>
	   
</footer>
</body>

</html>