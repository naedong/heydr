<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div class="d-flex" id="wrapper">
	<!-- Sidebar-->
	<div class="border-end bg-white col-sm-2" id="sidebar-wrapper">
	
		<div class="list-group list-group-flush">
		<c:choose>
			<c:when test="${sessionNUM == 1}">
			<a	class="list-group-item list-group-item-action list-group-item-light p-3"
				href="${pageContext.request.contextPath }/member/memberMypage">프로필</a>
			<a	class="list-group-item list-group-item-action list-group-item-light p-3"
				href="${pageContext.request.contextPath }/member/memberMypage_list">관리자</a> 
			<a  class="list-group-item list-group-item-action list-group-item-light p-3"
				href="#!">??</a> 
			<a	class="list-group-item list-group-item-action list-group-item-light p-3"
				href="#!">Events</a> 
			<a	class="list-group-item list-group-item-action list-group-item-light p-3"
				href="#!">Profile</a> 
			<a  class="list-group-item list-group-item-action list-group-item-light p-3"
				href="#!">Status</a>
			</c:when>
			
			<c:when test="${sessionNUM != null}">
			<a	class="list-group-item list-group-item-action list-group-item-light p-3"
				href="${pageContext.request.contextPath }/member/memberMypage">프로필</a>
			<a	class="list-group-item list-group-item-action list-group-item-light p-3"
				href="${pageContext.request.contextPath }/member/memberMypage_list">예약 목록</a> 
			<a  class="list-group-item list-group-item-action list-group-item-light p-3"
				href="#!">??</a> 
			<a	class="list-group-item list-group-item-action list-group-item-light p-3"
				href="#!">Events</a> 
			<a	class="list-group-item list-group-item-action list-group-item-light p-3"
				href="#!">Profile</a> 
			<a  class="list-group-item list-group-item-action list-group-item-light p-3"
				href="#!">Status</a>
			</c:when>
			
			<c:when test="${sessionDNUM != null}">
			<a	class="list-group-item list-group-item-action list-group-item-light p-3"
				href="${pageContext.request.contextPath }/member/memberMypage">프로필</a>
			<a	class="list-group-item list-group-item-action list-group-item-light p-3"
				href="${pageContext.request.contextPath }/member/memberMypage_list">예약 목록</a> 
			<a  class="list-group-item list-group-item-action list-group-item-light p-3"
				href="#!">??</a> 
			<a	class="list-group-item list-group-item-action list-group-item-light p-3"
				href="#!">Events</a> 
			<a	class="list-group-item list-group-item-action list-group-item-light p-3"
				href="#!">Profile</a> 
			<a  class="list-group-item list-group-item-action list-group-item-light p-3"
				href="#!">Status</a>
			</c:when>
			</c:choose>
		</div>
	</div>
	
				