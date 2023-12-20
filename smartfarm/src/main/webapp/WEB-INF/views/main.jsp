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
		<h1><span>B A R A G I</span></h1>
		
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
				<img alt="plant" src='/smartfarm/img/water.png'/>
				<h3>친환경적</h3>
				<p>친환경적 재배</p>
			</div>
		</div>
	</div>
	<hr>

	<div id="jido">
		
		<div><h1>오시는 길</h1></div>
		<div>
		<div id="map" style="width:100%; height:400px;"/>
		</div>
		<div><h2>Address</h2></div>
		<div><p id='adressp'>${vo.adress } ${vo.detailadress }</p></div>
		<div><h2>교통정보</h2></div>
		<div><h3>지하철</h3></div>
<!-- 		<div id="jihachul_data"> -->
<!-- 			<span class="jihachul1">광주 1호선</span><p class=jihachulp>농성역 │ 7번 출구 도보6분</p> -->
<!-- 			<span class="jihachul1">광주 1호선</span><p class=jihachulp>돌고개역 │ 3번 출구 도보13분</p> -->
<!-- 		</div> -->
		<div id="jihacul-list"></div>
		<div><h3>버스</h3></div>
		<div id="bus-list">
<!-- 			<span class="busgansun">간선</span><p class="busp">금호36 │ 문흥39 │ 봉선37 │ 송정19 │ 수완12 │ 지원25</p> -->
<!-- 			<span class="busjisun">지선</span><p class="busp">1187 │ 송암68 │ 송암72 │ 지원56</p> -->
<!-- 			<span class="busgwang">광역</span><p class="busp">160 │ 161</p> -->
<!-- 			<span class="busnung">농어촌</span><p class="busp">200</p> -->
		</div>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f66b96847a2059f0fcba4e3f2429b255&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(35.15345, 126.888), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		var adress=document.get
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${vo.adress }', function(result, status) {
			
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {

		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">한울스마트팜</div>'
		        });
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 


		}); 
		var places = new kakao.maps.services.Places();
		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		var callback = function(result, status) {
		    if (status === kakao.maps.services.Status.OK) {
			        var placeid = result[0].id;
			        var placeurl = "https://place.map.kakao.com/main/v/"+placeid;
			        var jihachul_data = '';
		    		var gansun=[];
		    		var jisun=[];
		    		var gwang=[];
		    		var nong=[];
			        var bus_data = '';
			        $.ajax({
			    		url: "<c:url value='/info'/>",
			    		data: { placeurl: placeurl }
			    	}).done(function( response ){
			    		console.log( 'result12',response)
				        jihachul_data = '';
			    		$( response.findway.subway ).each(function(){
			    			jihachul_data += 
			    			`<span class="jihachul1">광주 1호선</span><p class="jihachulp">\${this.stationSimpleName} │ \${this.exitNum}번 출구 도보\${this.toExitMinute}분</p>
			    			`;
			    		})
			    		$("#jihacul-list").html( jihachul_data )
			    		
				        
			    		$( response.findway.busstop ).each(function(){
			    			for(i=0;i<this.busInfo.length;i++){
			    				if(this.busInfo[i].busType=='지선'){
			    					jisun.push(...this.busInfo[i].busNames.split(", "))
			    				}else if(this.busInfo[i].busType=='간선'){
			    					gansun.push(...this.busInfo[i].busNames.split(", "))
			    				}else if(this.busInfo[i].busType=='광역'){
			    					gwang.push(...this.busInfo[i].busNames.split(", "))
			    				}else if(this.busInfo[i].busType=='농어촌'){
			    					nong.push(...this.busInfo[i].busNames.split(", "))
			    				}
			    			}
			    			

			    		})
			    		var resultjisun = jisun.reduce((unique, item) => {
			    			  return unique.includes(item) ? unique : [...unique, item];
			    		}, []);
			    		var resultgansun = gansun.reduce((unique, item) => {
			    			  return unique.includes(item) ? unique : [...unique, item];
			    		}, []);
			    		var resultgwang = gwang.reduce((unique, item) => {
			    			  return unique.includes(item) ? unique : [...unique, item];
			    		}, []);
			    		var resultnong = nong.reduce((unique, item) => {
			    			  return unique.includes(item) ? unique : [...unique, item];
			    		}, []);
			    		var jisunText='';
			    		var gansunText='';
			    		var gwangText='';
			    		var nongText='';
			    		for(i=0;i<resultjisun.length;i++){
			    			if(i==resultjisun.length-1){
			    				jisunText+=resultjisun[i];
			    			}else{
			    				jisunText+=resultjisun[i]+' | ';
			    			}
			    		}
			    		for(i=0;i<resultgansun.length;i++){
			    			if(i==resultgansun.length-1){
			    				gansunText+=resultgansun[i];
			    			}else{
			    				gansunText+=resultgansun[i]+' | ';
			    			}
			    		}
			    		for(i=0;i<resultgwang.length;i++){
			    			if(i==resultgwang.length-1){
			    				gwangText+=resultgwang[i];
			    			}else{
			    				gwangText+=resultgwang[i]+' | ';
			    			}
			    		}
			    		for(i=0;i<resultnong.length;i++){
			    			if(i==resultnong.length-1){
			    				nongText+=resultnong[i];
			    			}else{
			    				nongText+=resultnong[i]+' | ';
			    			}
			    		}
			    		bus_data = '';
			    		if(resultgansun.length>0){
			    			bus_data +=
			    				`<div class="buswrap"><div class="busimg"><span class="busgansun">간선</span></div><div><p class="busp">`+gansunText+'</p></div></div>';
			    		}
			    		if(resultjisun.length>0){
			    			bus_data +=
			    				`<div class="buswrap"><div class="busimg"><span class="busjisun">지선</span></div><div><p class="busp">`+jisunText+'</p></div></div>';
			    		}
			    		if(resultgwang.length>0){
			    			bus_data +=
			    				`<div class="buswrap"><div class="busimg"><span class="busgwang">지선</span></div><div><p class="busp">`+gwangText+'</p></div></div>';
			    		}
			    		if(resultnong.length>0){
			    			bus_data +=
			    				`<div class="buswrap"><div class="busimg"><span class="busnung">농어촌</span></div><div><p class="busp">`+nongText+'</p></div></div>';
			    		}
			    		$("#bus-list").html( bus_data )
			    	})
			    }
		};
		places.keywordSearch('${vo.adress }', callback);
		
	</script>
</body>
</html>