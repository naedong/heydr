<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.hcategory {
	background-color: #3478f5;
	padding-top: 40px;
	height: 100%;
}

.hboard {
	background-color: #efefef;
	border-radius: 8px;
	margin: 40px;
}

a {
	text-decoration: none;
	color: white;
}

.searchForm input {
	border: solid 1px #3478f5;
	border-radius: 16px 0 0 16px;
	background-color:
}

.searchForm button {
	background-color: #3478f5;
	width: 64px;
	border-radius: 0 16px 16px 0;
}

.searchForm img {
	width: 18px;
}

.card {
	color: #232323;
	width: 430px;
}

.card-body button {
	font-size: 8px;
	max-width: 200px;
}

.card-text p {
	margin-top: 16px;
	text-decoration: none;
}

.card-title span {
	margin-left: 16px;
	font-size: 14px;
	background-color: #3478f5;
	padding: 4px 12px;
	border-radius: 16px;
	color: white;
}
</style>

<div class="container-fluid">
	<div class="row justify-content-around">
		<!-- 카테고리 영역 -->
		<div class="col-2 hcategory ">
			<!-- 카테고리 프로필 (이쪽 세션 처리 하셔야합니다)-->
			<div
				class="d-flex flex-column align-items-start justify-content-center ps-5"
				style="height: 160px;">
				<img src="/taejin/img/doc3.svg" alt="프로필사진" style="height: 40%;"
					class="mb-3">
				<h5 class="hanna text-white">게스트 님</h5>
				<span class="nanum text-white" style="font-size: 12px;"> 일반회원
					・ <a href="">마이페이지</a>
				</span>
			</div>
			<!-- 카테고리 프로필 끝 -->

			<!-- 카테고리 리스트 -->
			<div>
				<ul class="nav flex-column">
					<li class=" nav-item pt-5 pb-2 ps-4"><a
						class="DcategoryAll nav-link active text-white" aria-current="page"
						href="#">모든 진료과</a></li>
					<c:forEach var="e" items="${dcategory }" varStatus="status">
						<li class=" nav-item pt-2 pb-2 ps-4" 
							value="${e.dmajor }" 
							>
							<a 
							class="hcatebtn nav-link text-white" href="#">${e.dmajor}</a></li>
						
					</c:forEach>
				</ul>
			</div>
			<!-- 카테고리 리스트 끝 -->
		</div>
		<!-- 카테고리 영역 끝 -->

		<!-- 컨텐츠 (연회색배경) -->
		<div class="col-10 flex-column">
			<div class="hboard pt-2 ps-3 pe-3 pb-3">
				<h3 class="hanna p-4" style="text-align: center;">의사 리스트</h3>
				<div
					class="input-group searchForm mt-3 mb-3 w-100 justify-content-center">
					<button class="btn btn-outline-secondary dropdown-toggle"
						type="button" data-bs-toggle="dropdown" aria-expanded="false"
						style="border: solid 1px #3478f5; border-radius: 16px 0 0 16px; background: #3478f5; color: white; width: 100px;">진료과</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">Action</a></li>
						<li><a class="dropdown-item" href="#">Another action</a></li>
						<li><a class="dropdown-item" href="#">Something else here</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">Separated link</a></li>
					</ul>
					<input type="text" class="form-control col-lg-5">
					<button type="submit" class="btn searchBtn" name="searBtn"
						id="searBtn">
						<img alt="검색아이콘" src="/img/search.png">
					</button>
				</div>
				<div class="row row-cols-1 row-cols-md-2 g-4 justify-content-center">
					<c:forEach var="e" items="${dlist }">
						<c:forEach var="f" items="${e.doctorVO}">
					<div class="col-md-5">
						<div class="card" style="width : 400px; height:180px; margin:auto;">
							<div class="row g-0">
								<div class="col-3 text-center">
									<img src=/img/doctor.png class="m-3 w-100" alt="..." />
								</div>
								<div class="col-9">
									<div class="card-body">
										<h5 class="card-title">
											<strong> ${f.dname} 의사</strong>
										</h5>
										<p class="card-text">${e.hname }
										<br>
										<small class="text-muted"> ${e.otime}~ ${e.ctime } </small>
										</p>
										
										
										<div class="d-flex flex-start">
											<button class="btn btn-primary me-1 disabled" type="button">
												${f.dmajor }</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
					</c:forEach>
				</div>
				<!-- 페이지 네이션 -->
				<ul class="pagination justify-content-center p-3">
							<c:choose>
								<c:when test="${startPage < 6 }">
									<li class="page-item disabled"><a class="page-link"
										href="#" tabindex="-1" aria-disabled="true">Previous</a></li>
									<!-- 	<li class="disable">이전으로</li> -->
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="doctorList?cPage=${startPage-1}&category=${category}&search=${search}">Previous</a></li>
								</c:otherwise>
							</c:choose>
							<!-- 							<li class="page-item"><a class="page-link" href="#">1</a></li> -->
							<!-- 							<li class="page-item"><a class="page-link" href="#">2</a></li> -->
							<!-- 							<li class="page-item"><a class="page-link" href="#">3</a></li> -->

							<c:forEach varStatus="i" begin="${startPage}" end="${endPage}"
								step="1">
								<c:choose>
									<c:when test="${i.index == nowPage}">
										<li class="page-item now"><a class="page-link"
											style="background: #3478F5; color: white;">${i.index }</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="doctorList?cPage=${i.index}&category=${category}&search=${search}">${i.index}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:choose>
								<c:when test="${endPage >= totalPage}">
									<li class="page-item disabled"><a class="page-link"
										aria-disabled="true">Next</a></li>
								</c:when>
								<c:when test="${totalPage > (nowPage+pagePerBlock)}">
									<li>
									<li class="page-item"><a class="page-link"
										href="doctorList?cPage=${endPage+1 }&category=${category}&search=${search}">Next</a></li>
								</c:when>
								<c:otherwise>
									<li>
									<li class="page-item"><a class="page-link"
										href="doctorList?cPage=${endPage+1 }&category=${category}&search=${search}">Next</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
				<!-- -- -->
			</div>
		</div>
		<!-- 컨텐츠 영역 끝 -->
	</div>
</div>

<script type="text/javascript">
	$('.DcategoryAll').click(function() {
		location.href='${pageContext.request.contextPath}/hospital/hospitalList'
	});
</script>