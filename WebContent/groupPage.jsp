<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>

<title>스터디메이트(StudyMate)-빠른 스터디 매칭을 경험해보세요</title>

<link href="assets/css/groupDetail.css" type="text/css" rel="stylesheet" />
<link href="assets/css/font-awesome.min.css" type="text/css" rel="stylesheet" />

</head>
<body>
	<div id="container">
		<!-- 그룹페이지 메인화면 상단 container -->
		<div class="bg-container"
			style="background-image: url('images/cafe.jpg');">
			<!-- text를 강조하기 위해 사진배경을 어둡게 하는 기능 -->
			<div class="bg-container-overlay"></div>
			<!-- text를 입력하기 위한 container -->
			<div class="header-container">
				<!-- 카테고리 대/소 container-->
				<ul class="category-container">
					<li>
						<div class="category">영어</div>
						<div class="category">토익</div>
					</li>
				</ul>
				<!-- 스터디그룹 타이틀 -->
				<div class="study-title">스터디그룹 타이틀</div>
				<!--  그룹장, 등록일, 찜하기, 신청하기버튼을 위한 container -->
				<ul class="user-container">
					<li>
						<div class="user-info">그룹장</div>
						<div class="regdate">
							등록일 <span class="number">2016.10.26</span>
						</div>
					</li>
					<li class="pull-right hidden-xs">
						<div class="main-button-container">
							<button class="line-main-button compliment-button">
								<em class="icon fa fa-heart-o"></em> <span>0</span> 찜하기
							</button>
							<button class="main-button"
								onclick="$('#login-Modal-link').trigger('click');">
								<em class="fa fa-pencil-square-o"></em> 신청하기
							</button>
						</div>
					</li>
				</ul>
				<!-- 화면이 작을경우 찜하기, 신청하기 버튼을 아래쪽으로 이동시키는 기능 -->
				<div class="shown-xs main-button-container">
					<button class="line-main-button compliment-button">
						<em class="fa fa-heart-o"></em> <span>0</span> 찜하기
					</button>
					<button class="main-button" data-toggle="modal"
						data-target="#no-identityAuth">
						<em class="fa fa-pencil-square-o"></em> 신청하기
					</button>
				</div>
			</div>
		</div>

		<!-- 컨텐츠 컨테이너 -->
		<div class="contents-container">
			<ul class="contents-list">
				<li>
					<div class="contents-title">그룹 정보</div>
					<div class="contents-wrap">
						<div class="custom-table first">
							<div class="custom-table-cell-title">목표</div>
							<div class="custom-table-cell">토익 950점 이상 취득</div>
						</div>
						<div class="custom-table">
							<div class="custom-table-cell-title">모집 대상</div>
							<div class="custom-table-cell">대학생</div>
						</div>
						<div class="custom-table">
							<div class="custom-table-cell-title">모집 인원</div>
							<div class="custom-table-cell number">6명</div>
						</div>
						<div class="custom-table">
							<div class="custom-table-cell-title">회비</div>
							<div class="custom-table-cell date">5000원</div>
						</div>
						<div class="custom-table">
							<div class="custom-table-cell-title">모집 기간</div>
							<div class="custom-table-cell date">2016.10.01 - 2016.10.31</div>
						</div>
						<div class="custom-table">
							<div class="custom-table-cell-title">가능 시간</div>
							<div class="custom-table-cell date">
								<div class="time-table" id="time-table-lg">
									<div class="time-table-cell">
										<div class="time-table-cell-top">월</div>
										<div class="time-table-cell-bottom">
											<span class="text-muted"></span>
										</div>
									</div>
									<div class="time-table-cell">
										<div class="time-table-cell-top">화</div>
										<div class="time-table-cell-bottom">
											<span class="text-muted"></span>
										</div>
									</div>
									<div class="time-table-cell">
										<div class="time-table-cell-top">수</div>
										<div class="time-table-cell-bottom">
											<span class="text-muted"></span>
										</div>
									</div>
									<div class="time-table-cell">
										<div class="time-table-cell-top">목</div>
										<div class="time-table-cell-bottom">
											<span class="text-muted"></span>
										</div>
									</div>
									<div class="time-table-cell">
										<div class="time-table-cell-top">금</div>

										<div class="time-table-cell-bottom">
											<span class="no-letter-spacing">19시~21시</span>
										</div>
									</div>
									<div class="time-table-cell">
										<div class="time-table-cell-top">토</div>
										<div class="time-table-cell-bottom">
											<span class="text-muted"></span>
										</div>
									</div>
									<div class="time-table-cell">
										<div class="time-table-cell-top">일</div>
										<div class="time-table-cell-bottom">
											<span class="text-muted"></span>
										</div>
									</div>
								</div>
								<!--모바일-->
								<div id="time-table-xs">
									<div class="custom-table">
										<div class="custom-table-cell-title">월요일</div>

										<div class="custom-table-cell">
											<span class="no-letter-spacing"> </span>
										</div>
									</div>
									<div class="custom-table">
										<div class="custom-table-cell-title">화요일</div>

										<div class="custom-table-cell">
											<span class="no-letter-spacing"> </span>
										</div>
									</div>
									<div class="custom-table">
										<div class="custom-table-cell-title">수요일</div>

										<div class="custom-table-cell">
											<span class="no-letter-spacing"> </span>
										</div>
									</div>
									<div class="custom-table">
										<div class="custom-table-cell-title">목요일</div>

										<div class="custom-table-cell">
											<span class="no-letter-spacing"> </span>
										</div>
									</div>
									<div class="custom-table">
										<div class="custom-table-cell-title">금요일</div>
										<div class="custom-table-cell">
											<span class="no-letter-spacing">19시~21시</span>
										</div>
									</div>
									<div class="custom-table">
										<div class="custom-table-cell-title">토요일</div>

										<div class="custom-table-cell">
											<span class="no-letter-spacing"> </span>
										</div>
									</div>
									<div class="custom-table">
										<div class="custom-table-cell-title">일요일</div>

										<div class="custom-table-cell">
											<span class="no-letter-spacing"> </span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="custom-table">
							<div class="custom-table-cell-title">장소</div>
							<div class="custom-table-call">
								<div class="col-xs-9" style="margin-bottom:30px;">
									<span class="location main-location"><b>에스투 </b> 서울 강남구 역삼동 818-11</span>
								</div>
								<div id="map" style="width:700px; height:450px;"></div>
							</div> 
						</div>
					</div>
					<div class="custom-table last">
						<div class="custom-table-cell-title">모임 소개</div>
						<div class="custom-table-cell">
							<pre>
안녕하세요 토익스터디 그룹장 ABC입니다. 안. 
모두 열심히 해서 950점 이상 취득했으면 좋겠습니다. 안녕하세요 토
익스터디 그룹장 ABC입니다. 안녕터디 그룹장 ABC입니다.안녕하세요 토익스터디 그룹장 
								</pre>
						</div>
					</div>
				</li>
			</ul>
			<ul class="contents-list">
				<li>
					<div class="contents-title">회원 정보</div>
				 <div class="table-responsive">
  <table class="table">
    <thead>
      <tr>
        <th>이름</th>
        <th>성별</th>
        <th>나이</th>
        <th>지역</th>
        <th>연락처</th>
        <th>실력</th>
     	<th>하고 싶은 말</th>    
 		<th></th>
 		<th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>전승호</td> 
        <td>남</td> 
        <td>27</td>
        <td>인천</td>
        <td>010 4477 1978</td>
        <td>상</td> 
        <td>안녕하세요 </td>
        <td style="padding:0"><button type="button" class="btn btn-default" >수락</button></td>
        <td style="padding:0"><button type="button" class="btn btn-default" >거절</button></td>
      </tr>
    </tbody>
  </table> 
  </div>
			</ul>
			<ul class="contents-list">
				<li>
					<div class="contents-title">한 줄 게시판</div> 
					<div class="comment-box-wrap">  
						<form>								 
									<div class="comment-box-profile">
											전승호 
									</div>
									<div class="comment-inbox">
										<textarea id="textarea" class="comment-box-text" rows="3" cols="30" maxlength="200"></textarea>									
									</div>
										<div class="comment-box-write-count">
											<span id="counter" class="comment-box-count-num">0</span>
											<span class="total">/ 200</span>
										</div>
									   
								<div class="comment-box-upload">
									<input type="file" class="comment-box-btn-file" />
									<button type="button" class="btn btn-success">등록</button>
								</div>															
						</form>
					</div> 
			</ul>
		</div>


	</div>
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=0a21aad3c63779ac6768c5485927150c&libraries=services"></script>
	<script>
		$('#sub-nav').hide();
		$(window).scroll(function() {
			if ($(this).scrollTop() > 750) {
				$('#sub-nav').fadeIn();
			} else {
				$('#sub-nav').fadeOut();
			}
		});
				
		// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
		var infowindow = new daum.maps.InfoWindow({zIndex:1});

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  

		// 지도를 생성합니다     
		var map = new daum.maps.Map(mapContainer, mapOption); 

		// 장소 검색 객체를 생성합니다
		var ps = new daum.maps.services.Places(); 

		// 키워드로 장소를 검색합니다
		ps.keywordSearch('서울 강남구 역삼동 818-11', placesSearchCB); 

		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB (status, data, pagination) {
		    if (status === daum.maps.services.Status.OK) {

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        var bounds = new daum.maps.LatLngBounds();

		        for (var i=0; i<data.places.length; i++) {
		            displayMarker(data.places[i]);    
		            bounds.extend(new daum.maps.LatLng(data.places[i].latitude, data.places[i].longitude));
		        }       

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map.setBounds(bounds);
		    } 
		}

		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {
		    
		    // 마커를 생성하고 지도에 표시합니다
		    var marker = new daum.maps.Marker({
		        map: map,
		        position: new daum.maps.LatLng(place.latitude, place.longitude) 
		    });

		    // 마커에 클릭이벤트를 등록합니다
		    daum.maps.event.addListener(marker, 'click', function() {
		        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
		        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.title + '</div>');
		        infowindow.open(map, marker);
		    });
		}
		// 입력한 글자수를 표시하고 200자 초과시 알럿창을 띄우는 기능
$(function() {
      $('#textarea').keyup(function (e){
          var content = $(this).val();        
          $('#counter').html(content.length);
          
          if (content.length == 200) {
          	alert('글자수는 200자까지 입력할 수 있습니다.');
          }
      });
      $('#content').keyup();
});
	</script>
</body>
</html>











