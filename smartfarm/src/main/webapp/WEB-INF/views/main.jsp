<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<c:url value='/css/main.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
	<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=iaqlgvdj56"></script>
	
</head>
<body>
	<div id="sogae">
		<h1>안녕하세요<span>한울스마트팜</span>입니다.</h1>
		<p>한울스마트팜은 광주 서구 농성동에 위치한 50평 규모의 스마트팜입니다.</p>
		<p>굳이 바로 옆에 있지 않아도 식물 재배가 가능하다는 것을 배오고 직접 기기를 만들어보는 체험을 해볼 수 있으며,</p>
		<p>온도, 습도, 일조량 등을 컴퓨터나 스마트폰으로 데이터를 받아보고 자동으로 제어하는 장치를 자신이 원하는대로 커스터마이징할 수 있습니다.</p>
	</div>
	<div id="vision">
		<div class="vision_head">
			<h1>비전</h1>
			<h3>미래에 필요한 농업시스템을 직접 체험할 수 있는 도심농장</h3>
		</div>
		<div class="vision_main">
			<div>
				<img alt="plant" src='/smartfarm/img/plant.png' />
				<h3>어디서든</h3>
				<p>공간제약없이 어디서나</p>
			</div>
			<div>
				<img alt="nature" src='/smartfarm/img/nature.png' />
				<h3>안전하게</h3>
				<p>환경오염에서 안전한</p>
			</div>
			<div>
				<img alt="plant" src='/smartfarm/img/water.png'/>' />
				<h3>친환경적</h3>
				<p>친환경적 재배</p>
			</div>
		</div>
	</div>
	<hr>
	<div id="jido">
		<div><h1>오시는 길</h1></div>
		<div class="magin_bottom_30">
		<div id="map" style="width:100%; height:400px;"/>
		</div>
		<div><h2>Address</h2></div>
		<div><p>광주광역시 서구 경열로 3 302호</p></div>
		<div><h2>교통정보</h2></div>
		<div><h3>지하철</h3></div>
		<div>
			<div class=jido_text><span class="jihachul">광주 1호선</span><p class=jihachulp>농성역 │ 7번 출구 도보6분</p></div>
			<div class=jido_text> <span class="jihachul">광주 1호선</span><p class=jihachulp>돌고개역 │ 3번 출구 도보13분</p></div>
		</div>
		<div><h3>버스</h3></div>
		<div>
			<div class=jido_text><span class="busgansun">간선</span><p class="busp">금호36 │ 문흥39 │ 봉선37 │ 송정19 │ 수완12 │ 지원25</p></div>
			<div class=jido_text><span class="busjisun">지선</span><p class="busp">1187 │ 송암68 │ 송암72 │ 지원56</p></div>
			<div class=jido_text><span class="busgwang">광역</span><p class="busp">160 │ 161</p></div>
			<div class=jido_text><span class="busnung">농어촌</span><p class="busp">200</p></div>
		</div>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f66b96847a2059f0fcba4e3f2429b255"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(35.15345, 126.888), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(35.15345, 126.888); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		var iwContent = '<div style="padding:5px;transform: translateX(18%);">한울 스마트팜</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwPosition = new kakao.maps.LatLng(35.15345, 126.888); //인포윈도우 표시 위치입니다
	    
	    var infowindow = new kakao.maps.InfoWindow({
	        map: map, // 인포윈도우가 표시될 지도
	        position : iwPosition, 
	        content : iwContent
	    });
	    
	 	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	    infowindow.open(map, marker); 
	</script>
</body>
</html>