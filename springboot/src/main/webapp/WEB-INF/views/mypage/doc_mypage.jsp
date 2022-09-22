<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="./sidebar/sidebar_header.jsp" flush="true"></jsp:include>

<!-- Sidebar-->
	<div class="container py-4"
		style="width: 80%; margin: auto; padding: 10px 5px; height: 100%;">
			<h1 class="display-5 fw-bold">의사 프로필 정보</h1>
			    <div id='calendar'></div>
			    </div>
			
	<jsp:include page="./sidebar/sidebar_footer.jsp" flush="true"></jsp:include>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css' rel='stylesheet'>
<link href='/taejin/fullcalendar/lib/main.css' rel='stylesheet' />
    <script src='/taejin/fullcalendar/lib/main.js'></script>
   <script>
   var today = new Date();
   var year = today.getFullYear();
   var month = ('0' + (today.getMonth() + 1)).slice(-2);
   var day = ('0' + today.getDate()).slice(-2);
   var dateString = year + '-' + month  + '-' + day;
   var res;
   var ref;
   var name;
   var sta;
   var arr = [];
   var arrt = [];
   var arrc = [];
   var dict = {};
   var j = 0;
   var calendar;
   var step;
   
   document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
	    	$.ajax({
	    		url:'doctorReserveList',
	    		success:function(data){
	    			console.log(data[0].reserveVO[0].rdate)
	    			console.log(data[0].reserveVO[0].memberVO.name)
	    			var datas = data[0].reserveVO;
	    			for(var i of datas){
	    				f = new Date(i.rdate)
	    				console.log(typeof(f))
	    				console.log('f = ' +f)
	    				console.log('today = ' +today)
	    				console.log(typeof(today))
	    				
	    				if(f < today){
	    					arr.push({'start' : dateFormat(i.rdate)+'T'+i.rtime+':00',
	    	    				'title' : ' '+i.memberVO.num+' - '+ i.memberVO.name, 'color' : "#FF0000", 'textColor' : "#FF0001"
	    	    			});
	    				}else{
	    					arr.push({'start' : dateFormat(i.rdate)+'T'+i.rtime+':00',
	    	    				'title' : ' '+i.memberVO.num+'. '+ i.memberVO.name,
	    	    			});
	    				}
	    			
	    			
	    			}
	    			console.log('나온arr',arr)
		    
		     calendar = new FullCalendar.Calendar(calendarEl, {
		      headerToolbar: {
		        left: 'prev,next today',
		        center: 'title',
		        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
		      },
		      themeSystem: 'bootstrap5',
		      initialDate: dateString,
		      navLinks: true, // can click day/week names to navigate views
		      businessHours: true, // display business hours
		      editable: true,
		      selectable: true,
		      eventClick: function(info) {
				
				console.log('클릭이벤트! ' + info.event.title)
				/*$.ajax({
					type:'GET',
					url:,
					data:{},
					
				})*/
		      },
		      dateClick: function(info){
		    	  res = info.dateStr
		    	  console.log('날짜 클릭! = '+res)
		      },
		      events:arr
		    	  
		      });
		    // calendar - 끝
		    calendar.render();
		    		}// success - 끝
		    });// ajax - 끝
		    
		    	
	   });
   
   function dateFormat(res){		//작성일 기준 2022-03-25
		var date = new Date(res);
   console.log('date => ' +date)
		var yyyy = date.getFullYear();
		var mm = ('0' + (date.getMonth() + 1)).slice(-2);
		var dd = ('0' + date.getDate()).slice(-2);
		
		return yyyy+'-'+mm+'-'+dd;
	}
</script>
		