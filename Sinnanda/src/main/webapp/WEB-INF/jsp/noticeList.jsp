<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Alex+Brush" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">

	<title>공지사항 목록 페이지</title>
</head>
<body>
	<!-- 상단 내비바 - START -->
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index">신난다</a>
			
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>
			
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item cta"><a href="/qnaList" class="nav-link">Q&A</a></li>
					<li class="nav-item active"><a href="/noticeList" class="nav-link">공지사항</a></li>
					<li class="nav-item cta"><a href="/noticeList" class="nav-link">신난다 소개</a></li>
					
				</ul>
				<ul class="navbar-nav mj-auto">
					<!--memberId가 없을때--> 
					<c:if test ="${loginUser == null}">
						<li class="nav-item member"><a href="login" class="nav-link">로그인</a></li>
						<li class="nav-item member"><a href="insertMemberForm" class="nav-link">회원가입</a></li>
					</c:if>
					
					<!--memberId가 있을떄  -->
					<c:if test = "${loginUser != null}">
						<c:if test="${loginUser.userLevel == 1}">
							<li class="nav-item member"><a href="myPage?memberNo=${loginUser.member.memberNo}" class="nav-link">${loginUser.member.memberName}</a></li>
						</c:if>
						<c:if test="${loginUser.userLevel == 2}">
							<li class="nav-item member"><a href="myPage?hostNo=${loginUser.host.hostNo}" class="nav-link">${loginUser.host.hostName}</a></li>
						</c:if>
						<c:if test="${loginUser.userLevel == 3}">
							<li class="nav-item member">
							<a href="myPage?memberNo=${loginUser.admin.adminNo}" class="nav-link">
									<img src="/images/jun_test/adminImg.png" width="20px" height="20px">
									${loginUser.admin.adminName}&nbsp;관리자
								</a>
							</li>
						</c:if>
						<li class="nav-item member"><a href="logout" class="nav-link">로그아웃</a></li>		
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 상단 내비바 - END -->
	
	<!-- 상단 이미지 배너 - START -->
	<div class="hero-wrap js-fullheight" style="background-image: url('images/bg_1.jpg');">
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start" data-scrollax-parent="true">
				<div class="col-md-9 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
					<h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><strong>공지<br></strong> 새로운 소식들</h1>
					<p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">신난다 소식은 여기서 확인하세요</p>
				</div>
			</div>
		</div>
	</div>
    <!-- 상단 이미지 배너 - END -->
    
    <!-- 관리자인 경우 공지사항 작성 링크 -->
	<c:if test="${loginUser.userLevel == 3}">
		<div>
			<a href="/admin/addNotice">공지사항 작성</a>
		</div>
	</c:if>
	
	<!-- [김영후] 공지사항 목록 출력 -->
	<section class="ftco-section testimony-section bg-light">
		<div class="container">
			<h1><strong>공지사항</strong></h1>
			<!-- 공지사항 카테고리별로 출력 -->
			<div class="container2">
				<select id="noticeCategory" name="noticeCategory" class="form-control-sm" onchange="location.href=this.value" style="float: right; margin-bottom: 20px;">
					<option value="">선택</option>
					<option value="/noticeList?noticeCategory=전체">전체문의</option>
					<option value="/noticeList?noticeCategory=기타">기타</option>
					<option value="/noticeList?noticeCategory=정보">정보</option>
					<option value="/noticeList?noticeCategory=시스템">시스템</option>
					<option value="/noticeList?noticeCategory=이벤트">이벤트</option>
					<option value="/noticeList?noticeCategory=뉴스">뉴스</option>
				</select>
			</div>
			<table class="table table-board" style="width: 100%;">
				<tr style="text-align:center">
					<th width="5%">번호</th>
					<th width="50%">제목</th>
					<th width="10%">공지유형</th>
					<th width="15%">작성자</th>
					<th width="10%">작성일</th>
				</tr>
				<c:forEach items="${noticePinList}" var="p">
					<tr style="background-color:LightGray;">
						<td style="text-align:center">${p.noticeNo}</td>
						<td>
							<a href="/noticeOne?noticeNo=${p.noticeNo}">${p.noticeTitle}</a>
						</td>
						<td style="text-align:center">${p.noticeCategory}</td>
						<td style="text-align:center">${p.adminName}</td>
						<td style="text-align:center">
							<fmt:parseDate value="${p.createDate}" var="createDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
							<fmt:formatDate value="${createDate}" pattern="yy/MM/dd HH:mm"/>
						</td>
					</tr>
				</c:forEach>
				<c:forEach items="${noticeList}" var="n">
					<tr>
						<td style="text-align:center">${n.noticeNo}</td>
						<td>
							<a href="/noticeOne?noticeNo=${n.noticeNo}">${n.noticeTitle}</a>
						</td>
						<td style="text-align:center">${n.noticeCategory}</td>
						<td style="text-align:center">${n.adminName}</td>
						<td style="text-align:center">
							<fmt:parseDate value="${n.createDate}" var="createDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
							<fmt:formatDate value="${createDate}" pattern="yy/MM/dd HH:mm"/>
						</td>
					</tr>
				</c:forEach>
			</table>
			
			<!-- [김영후] Paging -->	
			<div class="row mt-5">
		    	<div class="col text-center">
		            <div class="block-27">
						<ul>
							<!-- '이전' 버튼 -->
							<c:if test="${beginRow > ROW_PER_PAGE}">
								<li><a href="noticeList?currentPage=${currentPage-1}&noticeCategory=${noticeCategory}">&lt;</a></li>
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
											<li><a href="/noticeList?currentPage=${i}&noticeCategory=${noticeCategory}">${i}</a></li>	
										</c:otherwise>		
									</c:choose>
									<!-- LastPage이면 다음 페이지 번호를 출력하지 않는다 -->
									<c:if test="${i == lastPage}">
										<c:set var="doneLoop" value="true"></c:set>
									</c:if>
								</c:if>
							</c:forEach>
							
							<!-- '다음' 버튼 -->
							<c:if test="${currentPage != lastPage}">
								<li><a href="noticeList?currentPage=${currentPage+1}&noticeCategory=${noticeCategory}">&gt;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>	
		</div>
	</section>
	<!-- Paging -->
	
	<!-- 하단 Footer - SATRT -->
	<footer class="ftco-footer ftco-bg-dark ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">신난다</h2>
						<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
						<ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-5">
					<h2 class="ftco-heading-2">Information</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">About</a></li>
							<li><a href="#" class="py-2 d-block">Service</a></li>
							<li><a href="#" class="py-2 d-block">Terms and Conditions</a></li>
							<li><a href="#" class="py-2 d-block">Become a partner</a></li>
							<li><a href="#" class="py-2 d-block">Best Price Guarantee</a></li>
							<li><a href="#" class="py-2 d-block">Privacy and Policy</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2">Customer Support</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">FAQ</a></li>
							<li><a href="#" class="py-2 d-block">Payment Option</a></li>
							<li><a href="#" class="py-2 d-block">Booking Tips</a></li>
							<li><a href="#" class="py-2 d-block">How it works</a></li>
							<li><a href="#" class="py-2 d-block">Contact Us</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2">Have a Questions?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">
					<p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
				</div>
			</div>
		</div>
	</footer>
	<!-- 하단 Footer - END -->
	
	<!-- js 소스코드 -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.timepicker.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script src="direngine-master/js/google-map.js"></script>
	<script src="direngine-master/js/main.js"></script>
</body>
</html>