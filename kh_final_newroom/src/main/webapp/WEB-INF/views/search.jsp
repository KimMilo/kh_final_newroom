<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="rUrl" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="kr">
<head>
<style type="text/css">
    #map {
        width: 45%;
        height: 1000px;
    }
     
     .interest:hover{
    	cursor: pointer;
    }
</style>
<link rel="stylesheet" type="text/css" href="${rUrl}/resources/css/style.css" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0">
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<title>매물검색</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
</head>
<body>
<spring:eval expression="@property['key']" var="key"/>
	<jsp:include page="header.jsp" />

	<!-- Contents -->
	<div class="container-fluid contents">
		<%-- 시/도, 구/군, 동 데이터 읽어와 갱신 --%>
		<script type="text/javascript">
		
			$(function(){
				// 시도 옵션 리스트 목록
				$.ajax({
					url:'${rUrl}/map/sido',
					type : 'GET',
					contextType : 'application/json;charset=utf-8',
					dataType : 'json',
					success : function(result){
						var optionList = '';
						for(let i = 0; i < result.length; i++){
							optionList += '<option value="';
							optionList += result[i]["sidoCode"] + '">';
							optionList += result[i]["sidoName"]
							optionList += '</option>';
						}
						$("#sido").append(optionList);
					},
					error : function(xhr, status, msg){
						console.log(status + " " + msg);									
					}
				});
				
				// 시도에 따른 구군 옵션 리스트 목록
				$("#sido").change(function(){
					$.ajax({
						url:'${rUrl}/map/gugun/'+$("#sido").val(),
						type : 'GET',
						contextType : 'application/json;charset=utf-8',
						dataType : 'json',
						success : function(result){
							$("#gugun").empty();
							$("#gugun").append("<option selected disabled>구/군</option>");
							var optionList = '';
							for(let i = 0; i < result.length; i++){
								optionList += '<option value="';
								optionList += result[i]["gugunCode"] + '">';
								optionList += result[i]["gugunName"]
								optionList += '</option>';
							}
							$("#gugun").append(optionList);
						},
						error : function(xhr, status, msg){
							console.log(status + " " + msg);									
						}
					});
				});
				
				// 구군에 따른 동 옵션 리스트 목록
				$("#gugun").change(function(){
					$.ajax({
						url:'${rUrl}/map/dong/'+$("#gugun").val(),
						type : 'GET',
						contextType : 'application/json;charset=utf-8',
						dataType : 'json',
						success : function(result){
							$("#dong").empty();
							$("#dong").append("<option selected disabled>동</option>");
							var optionList = '';
							for(let i = 0; i < result.length; i++){
								optionList += '<option value="';
								optionList += result[i]["dong"] + '">';
								optionList += result[i]["dong"]
								optionList += '</option>';
							}
							$("#dong").append(optionList);
						},
						error : function(xhr, status, msg){
							console.log(status + " " + msg);									
						}
					});
				});
			});		        	 	
		</script>
		
		<!-- 매물 등록 -->
		<div class="modal" id="insert">
		<div class="modal-dialog modal-dialog-centered">
		<form name="f" action="${rUrl}/search/insert" method="post" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header justify-content-center">
					<h4 class="modal-title">매물등록</h4>
				</div>
				<!-- Modal body -->
				<sec:authorize access="hasRole('ROLE_ADMIN')">
				<c:if test="${not empty dealList}">
					<div class="modal-body">
						<div class="pl-5 pr-5 form form-group">
							<div class="insert"></div>
						</div>					
					</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="submit" class="btn btn-success">등록</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
				</div>					
				</c:if>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_MEMBER')">
					<b style="color: red;">관리자 확인이 필요한 서비스에요~ 관리자에게 문의 해주시기 바랍니다.</b>	
				</sec:authorize>
			</div>
		</form>
		</div>
	</div>
	
		
		<!-- 매물 전체 검색화면 navbar -->
		<form action="${rUrl}/search" method="get" class="form-inline justify-content-between mt-md-2">
			<div class="form-group">
				<div class="form-group mx-md-1">
					<select name="sido" id="sido" class="form-control" placeholder="시/도">
								<option selected disabled>시/도</option>
					</select>
				</div>
				<div class="form-group mx-md-1">
					<select name="gugun" id="gugun" class="form-control" placeholder="구/군">
								<option selected disabled>구/군</option>
					</select>
				</div>
				<div class="form-group">
					<select name="dong" id="dong" class="form-control" placeholder="동">
							<option selected disabled>동</option>
					</select>
				</div>
				<div class="form-group mx-md-1">
					<select name="houseType" id="houseType" class="form-control">
						<option selected disabled>주거/매물형태</option>
						<option value="apt">아파트</option>
						<option value="houses">연립주택</option>
						<option value="opist">오피스텔</option>
					</select>
				</div>
				<div class="form-group mx-md-1">
					<select name="sortType" id="sortType" class="form-control">
						<option selected disabled>정렬기준</option>
						<option value="price">가격순</option>
						<option value="area">면적순</option>
						<option value="floor">층별</option>
					</select>
				</div>
				<div class="form-group">
				<input name="aptName" type="text" class="form-control mx-md-1"
					placeholder="아파트 이름 입력" style="border: 0; font-size: 24px">
				</div>
			</div>
			<div class="form-group detailArea">
			</div>
		</form>
		<hr>
		<!-- 매물 목록 -->
		<div id="item-list" class="d-inline-block w-50 sticky-top overflow-auto float-left" style="height: 90vh;">
			<header >
				<h3>전체 매물 :  ${fn:length(dealList)} 개</h3>
				<hr>
			</header>
			<c:choose>
				<c:when test="${not empty dealList}">
					<c:set var="itemIdx" value="0"></c:set>
					<%--매물 반복문 도는곳 --%>
					<c:forEach items="${dealList}" var="dto"> 
						<div id="item__${itemIdx}" class="card d-inline-block"
							style="position: relative 0 0; border: none; width: 160px; height: 100px;">
							<%--로그인 정보 있으면 찜한 매물은 꽉 찬 하트 --%>
							<sec:authorize access="isAuthenticated()">
								<img class="heartIcon" id="interest${dto.dealId}" src="" width="20px" height="20px"/>
								<script>						
									$(function(){
										$.ajax({
											url:'${rUrl}/interest/chk/${dto.dealId}',
											method:'get',
											success:function(result){
												if(result == 'true'){
													$("#interest${dto.dealId}").attr('src', './resources/img/heart_fill.png');
												}else {
													$("#interest${dto.dealId}").attr('src', './resources/img/heart_empty.png');
												}
											},
										});
									})
								</script>
							</sec:authorize>	
   							
   							<c:if test= "${dto.img eq null}">
								<img src="${rUrl}/resources/img/room_sample1.png" alt=""
									style="width: 140px; height: 100px;">
   							</c:if>
							<c:if test= "${dto.img ne null}">
								<img src="${rUrl}/resources/img/houseinner/${dto.img}" alt=""
									style="width: 140px; height: 100px;">
   							</c:if>
   							
   							<div class="card-body p-md-1">
									<h5 style="overflow: hidden; width: 130px; height: 25px;" class="font-weight-bold">${dto.aptName}</h5>
									<h5><button class="btn btn-sm btn-primary disabled">아파트</button></h5>
								<p class="card-text font-weight-bold">${dto.dtype }
									${dto.dealAmount}</p>
								<p class="card-text">${dto.floor}층, ${dto.area}㎡</p><br>
							</div>
						</div>
						<sec:authorize access="isAuthenticated()">
						<script type="text/javascript">
							$('#item__${itemIdx}').click( function(event) {
								var className = $(event.target).attr('class');
								var idName = $(event.target).attr('id');
								
								// 찜 등록 및 해제
								if(className == 'heartIcon'){
									if($("#"+idName).attr('src') == './resources/img/heart_fill.png'){
                    	    			$.ajax({
											url:'${rUrl}/interest/${dto.dealId}',
											method:'delete',
											beforeSend : function(xhr){ xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");},
											success:function(){
												$("#"+idName).attr('src', './resources/img/heart_empty.png');
                    	    					alert("찜 목록에서 해제 되었습니다.");
											}
										});
                    	    		}else if($("#"+idName).attr('src') == './resources/img/heart_empty.png'){
										$.ajax({
											url:'${rUrl}/interest/${dto.dealId}',
											method:'get',
											success:function(){
												$("#"+idName).attr('src', './resources/img/heart_fill.png');
                    	    					alert("찜 목록에 등록이 되었습니다.");
											}
										});
                    	    		}
								}
								// 매물 상세 정보 
								else{
									    $.get("https://maps.googleapis.com/maps/api/geocode/json"
												,{	key:'${key}'
													, address: "${dto.dong}" + "+" + "${dto.aptName}" + "+" + "${dto.jibun}"
												}
												, function(data, status) {
													tmpLat = data.results[0].geometry.location.lat;
													tmpLng = data.results[0].geometry.location.lng;
													addHouseMarker({lat:tmpLat, lng:tmpLng, name:"${dto.aptName}", type:'house'}, null);
												}
												, "json"
											);//get	
											
										$('#item-list').empty();
										let insert = '<input type="hidden" name="no" class="my-2 form-control col-md-12 d-inline" value="${dto.no}">'
										         + '<input type="text" name="dealAmount" class="form-control col-md-12 d-inline my-2" placeholder="희망가격" required>'
												 + '<input type="text" name="dealYear" class="form-control col-md-12 d-inline my-2" placeholder="희망년도" required>'
												 + '<input type="text" name="dealMonth" class="form-control col-md-12 d-inline my-2" placeholder="희망월" required>'
												 + '<input type="text" name="dealDay" class="form-control col-md-12 d-inline my-2" placeholder="희망일자" required">'
												 + '<input type="text" name="area" class="form-control col-md-12 d-inline my-2" placeholder="면적" required>'
												 + '<input type="text" name="floor" class="form-control col-md-12 d-inline my-2" placeholder="층" required>'
												 + '<select name="dtype" class="form-control my-2">'
												 + '<option selected disabled>거래타입</option>'
												 + '<option value="매매">매매</option>'
												 + '<option value="전세">전세</option>'
												 + '<option value="월세">월세</option></select>'
												 + '<input type="test" name="rentMoney" class="form-control col-md-12 d-inline my-2" placeholder="임대료">'
												 + '매물 도면<input type="file" name="report" class="form-control col-md-12 d-inline">'
											
										let area = '<button type="button" id="btn__safetyHospital" class="btn border btn-sm">주변 병원</button>'
												 + '<button type="button" id="btn__land" class="btn border btn-sm">주변 부동산</button>'
												 + '<button type="button" id="btn__busstop"	class="btn border btn-sm">주변 버스 정류소</button>'
											
										let str = '<header><div class="d-flex justify-content-between"><button id="back" class="btn btn-outline-secondary btn-sm me-2"><b class="fas fa-arrow-left">≪</b></button>'
											+ '<h3>' + "${dto.aptName}" + '</h3>' 
											+ '<button class="btn btn-warning btn-sm" type="button" data-toggle="modal" data-target="#insert">'
											+ '<b>매물 등록</b></button></div>'
											+ '<hr> </header><div class="item container w-100"><img src="${rUrl}/resources/img/housescatch/'
											+ "${dto.scatchImg}" +'"alt="" width="100%">' 
											+ '<div class="item__content container px-md-5"><h1 class="font-weight-bold">'
					                    	+ "${dto.dtype}" + "${dto.dealAmount}" + '</h1>'
					                    	+ '<p>' + '확인 날짜 : ${dto.dealYear}-${dto.dealMonth}-${dto.dealDay}' + '<br>'
						                    + '<hr class="mb-md-3" style="border-color: orange;">'
						                    + '</p>'
						                    + '<table class="table">'
						                    + '<tr>'
						                    + '<th>전용 면적</th>'
						                    + '<td>' + '${dto.area}㎡' + '</td>'
											+ '</tr>'
											+ '<tr>'
											+ '<th>거래 구분</th>'
											+ '<td>아파트</td>'
											+ '</tr>'
											+ '<tr>'
											+ '<th>층</th>'
											+ '<td>' + '${dto.floor}층' + '</td>'
											+ '</tr>'
											+ '</table>'
											+ '</div></div>';
											
										$('.insert').append(insert);
										$('.detailArea').append(area);
										$('#item-list').append(str);
										$('#back').click(function(){
											location.href = "${rUrl}/search";
										});
										$(function(){        	
					        				//  병원 지도에 표시
					         				function markCoronaHospitalPlace(place, type){
					         					$.get(
					        							"https://maps.googleapis.com/maps/api/geocode/json"
					 								,{	key:'${key}'
					 									, address: place.address
					 								}
					 								, function(data, status) {
					 									tmpLat = data.results[0].geometry.location.lat;
					 									tmpLng = data.results[0].geometry.location.lng;
					 									addMarker({lat:tmpLat, lng:tmpLng, name:place["hospitalName"], type:type}, place);
					 								}
					 								, "json"
					 							);        		  
					         				};
								
					         				// 병원 조회 버튼 눌렀을 때 : type hospital
					         				$("#btn__safetyHospital").click(function(){
					         	  				$.ajax({
					         						url : '${rUrl}/hospital/safety/${dto.dealId}',
					         						method : 'get',
					         						success : function(hospitalList){
					         							for(var i = 0; i < hospitalList.length; i++){
					         								markCoronaHospitalPlace(hospitalList[i], "hospital");
					         							}
					         						},
					         						error : function(xhr, status, msg){
					 									console.log(status + " " + msg);									
					 								}
					         					});
					         				});
					         				
					         				// 부동산 지도 표시
					         				function markLand(place, type){
					        					$.get(
					          						"https://maps.googleapis.com/maps/api/geocode/json"
					   								,{	key:'${key}'
					   									, address: place.address
					   								}
					   								, function(data, status) {
					   									console.log("구글 맵" + data);
					   									tmpLat = data.results[0].geometry.location.lat;
					   									tmpLng = data.results[0].geometry.location.lng;
					   									addLandMarker({lat:tmpLat, lng:tmpLng, name:place["title"], type:type}, place);
					   								}
					   								, "json"
					   							);
					        				}
								

					        				//주변 부동산 버튼 눌렀을 떄
					        				$("#btn__land").click(function(){
					        					var sidoName = '${dto.city}';
					        					var gugunName = '${dto.gugun}';
					        					var dongName = '${dto.dong}';
					        					
					        					var keyword = '';
					        					if(dongName != '동'){
					        						keyword = sidoName + " " 
					        								+ gugunName + " "
					        								+ dongName + " 부동산";
					        					}else if(gugunName != '구/군'){
					        						keyword = sidoName + " " 
													+ gugunName + " 부동산";
												}else if(sidoName != '시/도'){
					        						keyword = sidoName + " 부동산"; 
												}else{
													keyword = '부동산';
												}
					        						
					        					$.ajax({
					        						url : '${rUrl}/land',
					        						method: 'post',
					        						dataType: 'JSON',
					        						contextType: 'application/json; charset:UTF-8;',
					        						beforeSend : function(xhr){ xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");},
					        						data : {'keyword' : keyword,},
					        						success : function(landList){
					        							var items = landList['items'];
					        							for(var i = 0; i < items.length; i++){
					        								console.log(items[i]);
						        							markLand(items[i], "land");
					        							}
					        						},
					        						error : function(xhr, status, msg){
					        							console.log(status + " " + msg);
					        						}
					        					});
					        				});		
					        				

					        				//버스 정류장 버튼 눌렀을 떄
					        				$("#btn__busstop").click(function(){
				        						$.ajax({
						       						url : '${rUrl}/busstop/${dto.lat}/${dto.lng}',
						       						method: 'get',
						       						dataType: 'XML',
						       						contextType: 'application/xml; charset:UTF-8;',							       						
						       						success : function(busstopList){
						       							var items = $(busstopList).find('item');
						       							for(var i = 0; i < items.length; i++){
						       								addBusstopMarker(items[i], "bus");
						       							}
						       						},		
						       						error : function(xhr, status, msg){
				 		       							console.log(status + " " + msg);
					       							}
					       						});
					        				});
					        				
					        			});
										setCenterSelectedItem("${dto.lat}", "${dto.lng}");
									}
								});
                        </script>
                        </sec:authorize>
                        <c:set var="itemIdx" value="${itemIdx + 1}"></c:set>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<h1>해당 매물은 없습니다.</h1>
				</c:otherwise>
			</c:choose>
		</div>

		<!-- 지도 -->
		<div id="map" class="d-inline-block w-40 m-md-2">
			<script
				src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
			<script defer
				src="https://maps.googleapis.com/maps/api/js?key=${key }&callback=initMap"></script>
			<script type="text/javascript">
//                     const labels = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
//                     let labelIndex = 0;
                    
                    var map;
                    var start = {lat: 37.5665734, lng: 126.978179};
                    
                    const iconBase = "./resources/img/marker_icon/";
                    const icons = {
                      house: {
                        icon: iconBase + "home.jpg",
                      },
                      hospital: {
                        icon: iconBase + "hospital.jpg",
                      },
                      bus: {
                        icon: iconBase + "busstop.jpg",
                      },
                      land: {
                      	icon: iconBase + "land.png",
                      },
                    };

                    // 맵 초기화
                    function initMap() {
                        map = new google.maps.Map(document.getElementById('map'), {
                            zoom: 14,
                            center: start
                        });
                    }
					
                    function setCenterSelectedItem(tmpLat, tmpLng){
                    	map.setZoom(17);
                    	map.setCenter({lat : tmpLat, lng:tmpLng});
                    }
                    
                 	// 매물 위치에 마커 표시 하기
                    function addHouseMarker(place, dto){   
                   		const marker = new google.maps.Marker({
                   			position: new google.maps.LatLng(parseFloat(place.lat),parseFloat(place.lng)),
                   			label: {
                   				color: 'black',
                   				fontWeight: 'bold',
                   				fontSize: '25px',
                   				text: place.name,
                   			},
   							title: place.name,
							icon: {
   								labelOrigin: new google.maps.Point(30, 80),
   							    url: icons[place.type].icon,
   							},
   							map: map,
                   		})
                   		
						marker.addListener('click', function() {
							map.setZoom(17);
							map.setCenter(marker.getPosition());
						});

						map.setZoom(14);
						marker.setMap(map);
						map.setCenter(marker.getPosition());
                    }
                    
//                     // 종류별로 해당 위치에 마커 표시 하기
                    function addMarker(place, dto){   
                   		const marker = new google.maps.Marker({
                   			position: new google.maps.LatLng(parseFloat(place.lat),parseFloat(place.lng)),
							icon: {
   								labelOrigin: new google.maps.Point(30, 80),
   							    url: icons[place.type].icon,
   							},
   							map: map,
                   		})
                   		
                   		if(dto != null){
	                   		var info = dto.hospitalName+"<br>"
	                   		+ "<span style='color:#999; font-size:13px;'>"
	                   		+ dto.diagnosisType
	                   		+ "</span><br><br>"
	                   		+ "주소 : "+dto.address+"<br>"
	                   		+ "전화번호 : "+dto.phone+"<br>";
	                   		
	                   		if(dto.weekTime){
	                   			info += "[운영 시간]<br>";
	                   			info += "주중 : " + dto.weekTime + '<br>';
	                   		}
	                   		if(dto.saturdayTime){
	                   			info += "토요일 : " + dto.saturdayTime + '<br>';
	                   		}
	                   		if(dto.hoildayTime){
	                   			info += "주말 : " + dto.holidayTime + '<br>';
	                   		}
	                   		attachInfo(marker, info);
                   		}
						marker.addListener('click', function() {
							map.setZoom(17);
							map.setCenter(marker.getPosition());
						});

						map.setZoom(15);
						marker.setMap(map);
						map.setCenter(marker.getPosition());
                    }
                    
                    
                    
                 // 부동산 정보 마커 표시 하기
                    function addLandMarker(place, dto){   
                   		const marker = new google.maps.Marker({
                   			position: new google.maps.LatLng(parseFloat(place.lat),parseFloat(place.lng)),
   							icon: {
   								labelOrigin: new google.maps.Point(30, 80),
   							    url: icons[place.type].icon,
   							},
   							map: map,
                   		})
                   		
                   		var info = dto.title+" 상세 정보<br>"
                   		+ "<span style='color:#999; font-size:13px;'>"
                   		+ dto.category
                   		+ "</span><br><br>"
                   		+ "주소 : "+dto.roadAddress+"<br>"
                   		+ "( "+dto.address+" )<br>";
                   		
                   		attachInfo(marker, info);
                   		
						marker.addListener('click', function() {
							map.setZoom(17);
							map.setCenter(marker.getPosition());
						});

						map.setZoom(15);
						marker.setMap(map);
						map.setCenter(marker.getPosition());
                    }
                 
                 // 버스 정류장 정보 마커 표시 하기
                    function addBusstopMarker(place, type){   
                   		const marker = new google.maps.Marker({
                   			position: new google.maps.LatLng(parseFloat($(place).find('gpslati').text()),parseFloat($(place).find('gpslong').text())),
   							icon: {
   								labelOrigin: new google.maps.Point(30, 80),
   							    url: icons[type].icon,
   							},
   							map: map,
                   		})
                   		
                   		var info = $(place).find('nodeno').text()+" 정류장<br>";
                   		
                   		attachInfo(marker, info);
                   		
						marker.addListener('click', function() {
							map.setZoom(17);
							map.setCenter(marker.getPosition());
						});

						map.setZoom(15);
						marker.setMap(map);
						map.setCenter(marker.getPosition());
                    }
                    
                    function attachInfo(marker, info) {
                    	const infowindow = new google.maps.InfoWindow({
                    		content: info,
                    	});
                    	
                    	marker.addListener('click', function() { //클릭하면 상세정보 출력
                    		infowindow.open(marker.get("map"), marker);
						});
                    } 
                </script>
		</div>
	</div>
	
	<!-- Footer -->
	<jsp:include page="footer.jsp" />
	<script>
		var insertR = '${insertR}';
		if(insertR != ""){
			location.href="${rUrl}/search";
			alert(insertR);
		}
	</script>
</body>

</html>