<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="./sidebar/sidebar_header.jsp" flush="true"></jsp:include>
<div class="d-flex flex-column align-items-start justify-content-center ps-5"
				style="height: 160px;">
				<c:choose>
				<c:when test="${sessionNUM != null }">
				<img src="${pageContext.request.contextPath }/imgfile/${sessionProfimg}" alt="/taejin/img/doc3.svg" style="height: 40%;" class="rounded-circle img-fluid">
				<h5 class="hanna text-white">${sessionNAME } 님</h5>
				<span class="nanum text-white" style="font-size: 12px;"> 일반회원
					・ <a href="">마이페이지</a>
				</span>
				</c:when>
				<c:when test="${sessionNUM == null }">
				<img src="/taejin/img/doc3.svg" alt="/taejin/img/doc3.svg" style="height: 40%;" class="rounded-circle img-fluid">
				<h5 class="hanna text-white">게스트 님</h5>
				<span class="nanum text-white" style="font-size: 12px;"> 
				<a href="${pageContext.request.contextPath }/member/memberLoginForm">로그인</a> ・ <a href="${pageContext.request.contextPath }/member/joinForm">회원가입</a>
				</span>
				</c:when>
				</c:choose>
			</div>

<!-- Sidebar-->
			    <div id='calendar'></div>

<jsp:include page="./sidebar/sidebar_footer.jsp" flush="true"></jsp:include>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css' rel='stylesheet'>
<link href='/taejin/fullcalendar/lib/main.css' rel='stylesheet' />
    <script src='/taejin/fullcalendar/lib/main.js'></script>
   <script>
   var today = new Date();

   var res;
   var ref;
   var name;
   var sta;
   var arr = [];
   var arrt = [];
   var arrc = [];
   var dict = {};
   var calendar;
   
   document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
	    	$.ajax({
	    		url:'doctorReserveList',
	    		success:function(data){
	    			// 예약이 있을경우
	    			if(data.length != 0){
	    				console.log(data)
	    			console.log(data[0].reserveVO[0].rdate)
	    			console.log(data[0].reserveVO[0].memberVO.name)
	    			var datas = data[0].reserveVO;
	    			for(var i of datas){
	    				f = new Date(i.rdate)
	    				console.log(typeof(f))
	    				//console.log('f = ' +f)
	    				//console.log('today = ' +today)
	    				//console.log(typeof(today))
	    				// 월이 10 이하일경우 -> 9 => 09
	    				if(f < today){
	    					arr.push({'start' : i.rdate+'T'+i.rtime,
	    	    				'title' : ' '+i.memberVO.num+' - '+ i.memberVO.name, 'color' : "#FF0000"
	    	    			});
	    				}else{
	    					arr.push({'start' : i.rdate+'T'+i.rtime,
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
		      initialDate: dateFormat(today),
		      navLinks: true, // can click day/week names to navigate views
		      businessHours: true, // display business hours
		      editable: true,
		      selectable: true,
		      eventClick: function(info) {
				console.log('클릭이벤트! ' + info.event.title)
		      },
		      dateClick: function(info){
		    	  res = info.dateStr
		    	  console.log('날짜 클릭! = '+res)
		      },
		      events:arr
		    	  
		      });
		    // calendar - 끝
		    calendar.render();
		    
	    			}else{
	    				console.log('예약없음!!')
	    		// 예약이 없을경우
			     calendar = new FullCalendar.Calendar(calendarEl, {
			      headerToolbar: {
			        left: 'prev,next today',
			        center: 'title',
			        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
			      },
			      themeSystem: 'bootstrap5',
			      initialDate: dateFormat(today),
			      navLinks: true, // can click day/week names to navigate views
			      businessHours: true, // display business hours
			      editable: true,
			      selectable: true,
			      eventClick: function(info) {
			      },
			      dateClick: function(info){
			    	  res = info.dateStr
			    	  console.log('날짜 클릭! = '+res)
			      }
			     });
			    // calendar - 끝
			    calendar.render();
	    	    	}
		    	}// success - 끝
		    });// ajax - 끝
	   
	   });
   //날짜 변환 function
   function dateFormat(res){		
		var date = new Date(res);
   console.log('date => ' +date)
		var yyyy = date.getFullYear();
		var mm = ('0' + (date.getMonth() + 1)).slice(-2);
		var dd = ('0' + date.getDate()).slice(-2);
		return yyyy+'-'+mm+'-'+dd;
	}
</script>
		