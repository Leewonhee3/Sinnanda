<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<link rel="stylesheet" href="/skydash/vendors/feather/feather.css">
	<link rel="stylesheet" href="/skydash/vendors/ti-icons/css/themify-icons.css">
	<link rel="stylesheet" href="/skydash/vendors/css/vendor.bundle.base.css">
	<!-- endinject -->
	<!-- Plugin css for this page -->
	<link rel="stylesheet" href="/skydash/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
	<link rel="stylesheet" href="/skydash/vendors/ti-icons/css/themify-icons.css">
	<link rel="stylesheet" type="text/css" href="/skydash/js/select.dataTables.min.css">
	<!-- End plugin css for this page -->
	<!-- inject:css -->
	<link rel="stylesheet" href="/skydash/css/vertical-layout-light/style.css">
	<!-- endinject -->
	<link rel="shortcut icon" href="/skydash/images/favicon.png" />
	
	<title>커뮤니티 페이지</title>
</head>
<body>
	<div class="container-scroller">
	
		<!-- [이승준] 마이 페이지 상단 내비바 - START -->
		<%@ include file="/WEB-INF/partials/myPageNavbar.jsp" %>
		<!-- [이승준] 마이 페이지 상단 내비바 - END -->
	
	    <!-- [이승준] 마이 페이지 본문 - START -->
		<div class="container-fluid page-body-wrapper">
		
			<!-- [이승준] 마이 페이지 좌측 사이드바 - START -->
			<%@ include file="/WEB-INF/partials/myPageSidebar.jsp" %>
			<!-- [이승준] 마이 페이지 좌측 사이드바 - END -->
			
			<!-- [이승준] 마이 페이지 본문 - END -->
		      <!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<!-- 내용1 -->
					<div class="row">
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card position-relative">
								<div class="card-body">
									<span class="subheading">
										<a href="myPage?memberNo=${loginUser.member.memberNo}">메인(내정보)</a> >
										내 리뷰 목록
									</span>
									
									<h1 style="margin-top: 10px;"><strong>내가 작성한 리뷰 목록</strong></h1>
									
								    <div class="container">
										<select id="reviewRecommend" name="reviewRecommend" class="form-control-sm" onchange="location.href=this.value" style="float: right; margin-bottom: 20px; height:35px;">
											<option value="">선택</option>
											<option value="myReviewList">전체</option>
											<option value="myReviewList?reviewRecommend=보통">보통</option>
											<option value="myReviewList?reviewRecommend=추천">추천</option>
											<option value="myReviewList?reviewRecommend=비추천">비추천</option>
										</select>
										
										<table class="table table-myPage" style="width: 100%;">
											<tr>
												<th>숙소이름</th>
												<th>객실이름</th>
												<th>리뷰내용</th>
												<th style="width: 7%;">평점</th>
												<th style="width: 10%;">추천여부</th>
												<th style="width: 15%;">작성일</th>
											</tr>
									
											<c:forEach items="${myReviewList}" var="review">
												<tr>
													<td style="text-align:center;">${review.accomName}</td>
													<td style="text-align:center;">${review.roomName}</td>				
													<td style="text-align:center;">
														<c:choose>
															<c:when test="${fn:length(review.reviewContent) > 20}">
																<a href="searchAccomOne?accomNo=${review.accomNo}">
															 		<c:out value="${fn:substring(review.reviewContent,0,20)}"/>...
															 	</a>
															</c:when>
														 	<c:otherwise>
										            			<a href="searchAccomOne?accomNo=${review.accomNo}"><c:out value="${review.reviewContent}"/></a>
										          			 </c:otherwise>
														</c:choose>
													</td>
													<td style="text-align:center;">${review.reviewRank}</td>
													<td style="text-align:center;">${review.reviewRecommend}</td>
													<td style="text-align:center;">
														<fmt:parseDate value="${review.createDate}" var="createDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
														<fmt:formatDate value="${createDate}" pattern="yy / MM / dd HH:mm"/>
													</td>
												</tr>
											</c:forEach>
										</table>
										
										<!-- Paging -->			
										<div class="row mt-5">
									    	<div class="col text-center">
									            <div class="block-27">
													<ul>
														<!-- '이전' 버튼 -->
														<c:if test="${beginRow >= (ROW_PER_PAGE * 10)}">
															<li><a href="myReviewList?currentPage=${pageNo-1}&reviewRecommend=${reviewRecommend}">&lt;</a></li>
														</c:if>
														
														<!-- Page 번호 -->
														<c:set var="doneLoop" value="false"></c:set>
														<c:forEach var="i" begin="${pageNo}" end="${pageNo + 9}">
														
															<!-- Page 숫자 10개 출력 -->
															<c:if test="${not doneLoop}">
																<c:choose>
																	<c:when test="${currentPage == i}">
																		<li class="active"><span>${i}</span></li>
																	</c:when>
												    				<c:otherwise>
																		<li><a href="myReviewList?currentPage=${i}&reviewRecommend=${reviewRecommend}">${i}</a></li>	
																	</c:otherwise>		
																</c:choose>
																<!-- LastPage이면 다음 페이지 번호를 출력하지 않는다 -->
																<c:if test="${i == lastPage}">
																	<c:set var="doneLoop" value="true"></c:set>
																</c:if>
															</c:if>
														</c:forEach>
														
														<!-- '다음' 버튼 -->
														<c:if test="${lastPage >= pageNo + 10}">
															<li><a href="myReviewList?currentPage=${pageNo+10}&reviewRecommend=${reviewRecommend}">&gt;</a></li>
														</c:if>
													</ul>
												</div>
											</div>
										</div>
										<!-- Paging -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- [이승준] 하단 Footer - SATRT -->
	<%@ include file="/WEB-INF/partials/footer.jsp" %>
	<!-- [이승준] 하단 Footer - END -->


  <!-- plugins:js -->
  <script src="/vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="/vendors/chart.js/Chart.min.js"></script>
  <script src="/vendors/datatables.net/jquery.dataTables.js"></script>
  <script src="/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
  <script src="/js/dataTables.select.min.js"></script>

  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="/js/off-canvas.js"></script>
  <script src="/js/hoverable-collapse.js"></script>
  <script src="/js/template.js"></script>
  <script src="/js/settings.js"></script>
  <script src="/js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="/js/dashboard.js"></script>
  <script src="/js/Chart.roundedBarCharts.js"></script>
  <!-- End custom js for this page-->
</body>

</html>