<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="./sidebar/sidebar_header.jsp" flush="true"></jsp:include>
<!-- include 제거  -->
<style>
/* 	.table1 :hover { */
		
/* 	} */
</style>


<div class="container">
<article>
	<header>
		<h1>전체 병원</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>

		<%-- 리팩토링 해야 함 --%>
<table class="table1 table table-hover" style="text-align: center;">
	<thead>
		<tr>
			<th>병원명</th>
			<th>위치</th>
			<th>전화번호</th>
			<th>진료과목</th>
		</tr>
	</thead>

	<tbody>
<%-- 		<%-- for start --%> 
<%-- 		<c:forEach var="e" items="${list }"> --%>
<!-- 			<tr> -->
<%-- 				<td class="linktd">${e.hnum }</td> --%>
<%-- 				<td class="linktd"><a href="hospitalDetail?num=${e.hnum }"> ${e.hname }</a></td> --%>
<%-- 				<td class="linktd">${e.hloc }</td> --%>
<%-- 				<td class="linktd">${e.otime }~${e.ctime }</td> --%>
<%-- 				<td class="linktd">${e.hcate }</td> --%>
<!-- 			</tr> -->
<%-- 		</c:forEach> --%>
<%-- 		<%-- for end --%> 
	</tbody>
</table>

</article>
</div>
<jsp:include page="./sidebar/sidebar_footer.jsp" flush="true"></jsp:include>
<!-- 이전 jquery 임포트 코드 ...!!! -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
// $(function(){
// 	$('.linktd').click(function(){
// 		var href = $(this).parent("tr").children("td").children("a").attr("href")
// // 		alert(href);
// 		window.location = href;
// 	});
//});

$(function(){
   //alert("test");
   //Ajax
   $.ajax({
   //url:'http://192.168.0.113:9000/myjson/loadJson',
//    url:'http://192.168.0.63:9000/hospital/hospitalListJsonP',
    url:'http://192.168.0.120:9000/hospital/hospitalListJsonP',
    type:'GET',
    dataType:'jsonp',
    jsonp:'callback',
    success:function(data){
        console.log(data);
        console.log(data.columns);
        console.log(data.data);
        let tbodyData =[];
        let j=0;
           for (var i of data.data[0]) {
           	tbodyData.push('<tr style="cursor:pointer;">'+
           	'<td  id="listBtn" >'+(j+1)+'</td>'+
           	'<td  id="listBtn" >'+i.hos_name+'</td>'+
           	'<td  id="listBtn" >'+i.hos_address+'</td>'+
           	'<td  id="listBtn" >'+i.hos_tel+'</td>'+
           	'<td  id="listBtn" >'+i.hos_loc+'</td>')
           	j++;
           }
           document.querySelector('.table1 > tbody').innerHTML = tbodyData.join('');
       },
       error: function(err){
          console.log('Error => '+err);
       }
    
   });
//-----------------------------------------------
// 병원 목록 클릭 ajax
//$(".table1").on("click","tr", function(){
$(".jb").on("click",".jb-image",function(){
	var hos_value=$(this).text();
	//var hos_value=$(this).text();
	
	console.log("td값 => "+$(this).text());
	setTimeout(function() { 
	 
	$.ajax({
       url: 'http://192.168.0.63:9000/map/detail?name='+hos_value+'&',
       type: 'GET',
       dataType: 'jsonp',
       jasonp: 'callback',
       contentType : "application/jsonp; charset: UTF-8",
       success: function(data){
           var hos_marker = {}
           
           for(var i =0; i < data.data[0].length; i++){
           	hos_marker[data.columns[i]]=data.data[0][i];
           }
           console.log('결과1= '+hos_marker['hos_x']);
           console.log('결과2= '+hos_marker['hos_y']);
           console.log('병원이름= '+hos_marker['hos_name']);
           var x =hos_marker['hos_x']
           var y =hos_marker['hos_y']
           var name =hos_marker['hos_name']
           
           
           <!-- 지도 생성! -->
   		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
   		mapOption = {
   			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
   			level : 5 // 지도의 확대 레벨 
   		
   		};
   		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
   		<!-- 지도 크기 조절 이벤트 -->
   		var zoomControl = new kakao.maps.ZoomControl();
   		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
   		
   		<!-- 현재위치 좌표얻어오기! -->
		navigator.geolocation.getCurrentPosition(function(position) {

		var lat = position.coords.latitude, // 위도
		lon = position.coords.longitude; // 경도

		var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
   		var positions = [
   			{
   		        title: '현재위치', 
   		        latlng: locPosition
   		    },
   			{
   		        title: hos_marker['hos_name'], 
   		        latlng: new kakao.maps.LatLng(hos_marker['hos_y'], hos_marker['hos_x'])
   		    }];
   		
   		console.log('=============== ')
   		console.log('현위치 - lat = '+lat)
   		console.log('현위치 - lon = '+lon)
   		console.log('목적지 - marker_y = '+hos_marker['hos_y'])
   		console.log('목적지 - marker_x = '+hos_marker['hos_x'])
   		console.log('---------------')
   		console.log('중간위치 - y = '+(lat+hos_marker['hos_y'])/2)
   		console.log('중간위치 - x = '+(lon+hos_marker['hos_x'])/2)
   		
   		var center_x = (lon+hos_marker['hos_x'])/2
   		var center_y = (lat+hos_marker['hos_y'])/2
   		var center_xy= new kakao.maps.LatLng(center_y,center_x)
   		for (var i = 0; i < positions.length; i ++) {
   		// 마커를 생성합니다 
   		
		var marker = new kakao.maps.Marker({ // 마커를 생성합니다 
			map : map,
			position : positions[i].latlng,
			title : positions[i].title
		});
   		
		var iwContent = positions[i].title, // 인포윈도우에 표시할 내용
		iwRemoveable = true;
		
		var infowindow = new kakao.maps.InfoWindow({ // 인포윈도우를 생성합니다
			content : iwContent,
			removable : iwRemoveable
		});
		// 인포윈도우를 마커위에 표시합니다 
		infowindow.open(map, marker);
		// 마커를 지도에 표시합니다
		marker.setMap(map);
   		}
		var level = map.getLevel();
		
		infowindow.open(map, marker); // 인포윈도우를 마커위에 표시합니다 
		map.setLevel(level + 2);
		map.setCenter(center_xy); // 지도 중심좌표를 접속위치로 변경합니다
   		});
		$('#loadBtn').click(function(){
			location.href="https://map.kakao.com/link/to/"+name+","+y+","+x;
		})
       } // - success 함수 
	
	}); // - ajax
	}, 500);
}); // table1 클릭 ajax 끝

});

</script>








