<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="${pageContext.request.contextPath}/assets/img/apple-icon.png">
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Weaving Groupware</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Files -->
<link
	href="${pageContext.request.contextPath}/assets/css/material-dashboard.css?v=2.1.1"
	rel="stylesheet" />
<script
	src="${pageContext.request.contextPath}/assets/js/core/jquery.min.js"></script>
	
  <!-- full calendar style sheet -->
  <link href='${pageContext.request.contextPath}/resources/fullcalendar/packages/core/main.css' rel='stylesheet' />
  <link href='${pageContext.request.contextPath}/resources/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
  <link href='${pageContext.request.contextPath}/resources/fullcalendar/packages/timegrid/main.css' rel='stylesheet' />
  <link href='${pageContext.request.contextPath}/resources/fullcalendar/packages/list/main.css' rel='stylesheet' />
  <link href='${pageContext.request.contextPath}/resources/fullcalendar/packages/bootstrap/main.css' rel='stylesheet' />
  <link href='https://use.fontawesome.com/releases/v5.0.6/css/all.css' rel='stylesheet'>
</head>


<div class="wrapper ">
	<div class="sidebar" data-color="azure" data-background-color="white"
		data-image="${pageContext.request.contextPath}/assets/img/sidebar-1.jpg">
		<!-- Logo -->
		<div class="logo">
			<a href="${pageContext.request.contextPath}/adminHome"
				class="simple-text logo-normal"> WEAVING </a> <br>
			<div>
				<div align="center">
					<img
						src="${pageContext.request.contextPath}/images/no_login_avatar.png"
						alt="Avatar" class="avatar"> <br> <br>
					<c:if test="${not empty emp && emp.adminYn}">
						<h5>관리자님, 환영합니다</h5>
					</c:if>
					<br>
					<c:if test="${not empty emp && emp.adminYn}">
						<div class="btn-group">
							<button class="btn btn-primary" onclick="location='${pageContext.request.contextPath}/logout'">로그아웃</button>
							<button class="btn btn-defualt" onclick="location='${pageContext.request.contextPath}/home'">WEAVING</button>
						</div>
					</c:if>
					<c:if test="${empty emp}">
						<button class="btn btn-defualt" style="width: 100%"
							onclick="location='${pageContext.request.contextPath}/login'">
							<i class="material-icons">face</i> 로그인
						</button>
					</c:if>
				</div>
			</div>
		</div>

		<!-- Logo -->
		<div class="sidebar-wrapper">
			<ul class="nav">

				<li class="nav-item ">
					<a class="nav-link" href="${pageContext.request.contextPath}/adminHome"> 
						<i class="material-icons">dashboard</i>
							<p>Home</p>
					</a>
				</li>

				<!-- 회사 관리 메뉴 -->
				<li class="nav-item">
					<a class="nav-link" data-toggle="collapse" data-target="#company"> <i class="material-icons">account_circle</i>
						<p>회사관리</p>
					</a>
				</li>
				<div class="collapse navbar-collapse" id="company">
					<ul class="navbar-nav">
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.request.contextPath}/adminemplist"> 
								<i class="material-icons">group</i>
								<p>직원관리</p>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.request.contextPath}/deptListFrom"> <i
								class="material-icons">business</i>
								<p>부서관리</p>
							</a>
						</li>
					</ul>
				</div>

				<!-- 결재 폼 관리 -->
				<li class="nav-item">
					<a class="nav-link" data-toggle="collapse" data-target="#document"> 
						<i class="material-icons">description</i>
						<p>결재폼 관리</p>
					</a>
				</li>
				<div class="collapse navbar-collapse" id="document">
					<ul class="navbar-nav">
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.request.contextPath}/docFormList"> 
							<i class="material-icons">list</i>
								<p>결재폼 목록</p>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.request.contextPath}/docFormInsertForm"> 
							<i class="material-icons">create</i>
								<p>결재폼 등록</p>
							</a>
						</li>
					</ul>
				</div>
				
				<!-- 공지사항 -->
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/boardListAdmin?boardType=0">
						<i class="material-icons">notifications</i>
						<p>공지사항</p>
					</a>
				</li>

				<!-- 전체 일정 -->
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/getCalAdmin.do?calType=ALL">
						<i class="material-icons">group</i>
						<p>전체 일정</p>
					</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- 메인 패널 -->
	<div class="main-panel">
	<!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/adminHome">Weaving Admin Page</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="sr-only">Toggle navigation</span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end">
            
            <ul class="navbar-nav">
			  
			  <li class="nav-item">
              	<a class="nav-link" href="${pageContext.request.contextPath}/home" aria-haspopup="true" aria-expanded="false">
                  <i class="material-icons">home</i>
                </a>
              </li>
              
              <li class="nav-item">
              	<a class="nav-link" href="${pageContext.request.contextPath}/logout" aria-haspopup="true" aria-expanded="false">
                  logout
                </a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
     
	<div class="content">
		<tiles:insertAttribute name="content" />
	</div>
	
	<!-- footer -->
	<footer class="footer">
		<div class="container-fluid">
          <div class="copyright float-center">
            &copy;
            <script>
              document.write(new Date().getFullYear())
            </script>, made with <i class="material-icons">favorite</i> by
            <a href="${pageContext.request.contextPath}/home" target="_blank">WEAVING</a> All Rights Reserved.
          </div>
        </div>
	</footer>
	</div>
</div>
<!--   Core JS Files   -->
<script
	src="${pageContext.request.contextPath}/assets/js/core/popper.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/core/bootstrap-material-design.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<!-- Plugin for the momentJs  -->
<script
	src="${pageContext.request.contextPath}/assets/js/plugins/moment.min.js"></script>
<!--  Plugin for Sweet Alert -->
<script
	src="${pageContext.request.contextPath}/assets/js/plugins/sweetalert2.js"></script>
<!-- Forms Validations Plugin -->
<script
	src="${pageContext.request.contextPath}/assets/js/plugins/jquery.validate.min.js"></script>
<!-- Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
<script
	src="${pageContext.request.contextPath}/assets/js/plugins/jquery.bootstrap-wizard.js"></script>
<!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
<script
	src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap-selectpicker.js"></script>
<!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
<script
	src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap-datetimepicker.min.js"></script>
<!--  DataTables.net Plugin, full documentation here: https://datatables.net/  -->
<script
	src="${pageContext.request.contextPath}/assets/js/plugins/jquery.dataTables.min.js"></script>
<!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
<script
	src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap-tagsinput.js"></script>
<!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script
	src="${pageContext.request.contextPath}/assets/js/plugins/jasny-bootstrap.min.js"></script>
<!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
<script
	src="${pageContext.request.contextPath}/assets/js/plugins/fullcalendar.min.js"></script>
<!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
<script
	src="${pageContext.request.contextPath}/assets/js/plugins/jquery-jvectormap.js"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script
	src="${pageContext.request.contextPath}/assets/js/plugins/nouislider.min.js"></script>
<!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
<!-- Library for adding dinamically elements -->
<script
	src="${pageContext.request.contextPath}/assets/js/plugins/arrive.min.js"></script>
<!-- Chartist JS -->
<script
	src="${pageContext.request.contextPath}/assets/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script
	src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
<script
	src="${pageContext.request.contextPath}/assets/js/material-dashboard.js?v=2.1.1"
	type="text/javascript"></script>
 
<!-- full calendar packages -->
<script src='${pageContext.request.contextPath}/resources/fullcalendar/packages/core/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/fullcalendar/packages/interaction/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/fullcalendar/packages/daygrid/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/fullcalendar/packages/timegrid/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/fullcalendar/packages/list/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/fullcalendar/packages/bootstrap/main.js'></script>
<script>
	$(document)
			.ready(
					function() {
						$()
								.ready(
										function() {
											$sidebar = $('.sidebar');

											$sidebar_img_container = $sidebar
													.find('.sidebar-background');

											$full_page = $('.full-page');

											$sidebar_responsive = $('body > .navbar-collapse');

											window_width = $(window).width();

											fixed_plugin_open = $(
													'.sidebar .sidebar-wrapper .nav li.active a p')
													.html();

											if (window_width > 767
													&& fixed_plugin_open == 'Dashboard') {
												if ($('.fixed-plugin .dropdown')
														.hasClass(
																'show-dropdown')) {
													$('.fixed-plugin .dropdown')
															.addClass('open');
												}

											}

											$('.fixed-plugin a')
													.click(
															function(event) {
																// Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
																if ($(this)
																		.hasClass(
																				'switch-trigger')) {
																	if (event.stopPropagation) {
																		event
																				.stopPropagation();
																	} else if (window.event) {
																		window.event.cancelBubble = true;
																	}
																}
															});

											$(
													'.fixed-plugin .active-color span')
													.click(
															function() {
																$full_page_background = $('.full-page-background');

																$(this)
																		.siblings()
																		.removeClass(
																				'active');
																$(this)
																		.addClass(
																				'active');

																var new_color = $(
																		this)
																		.data(
																				'color');

																if ($sidebar.length != 0) {
																	$sidebar
																			.attr(
																					'data-color',
																					new_color);
																}

																if ($full_page.length != 0) {
																	$full_page
																			.attr(
																					'filter-color',
																					new_color);
																}

																if ($sidebar_responsive.length != 0) {
																	$sidebar_responsive
																			.attr(
																					'data-color',
																					new_color);
																}
															});

											$(
													'.fixed-plugin .background-color .badge')
													.click(
															function() {
																$(this)
																		.siblings()
																		.removeClass(
																				'active');
																$(this)
																		.addClass(
																				'active');

																var new_color = $(
																		this)
																		.data(
																				'background-color');

																if ($sidebar.length != 0) {
																	$sidebar
																			.attr(
																					'data-background-color',
																					new_color);
																}
															});

											$('.fixed-plugin .img-holder')
													.click(
															function() {
																$full_page_background = $('.full-page-background');

																$(this)
																		.parent(
																				'li')
																		.siblings()
																		.removeClass(
																				'active');
																$(this)
																		.parent(
																				'li')
																		.addClass(
																				'active');

																var new_image = $(
																		this)
																		.find(
																				"img")
																		.attr(
																				'src');

																if ($sidebar_img_container.length != 0
																		&& $('.switch-sidebar-image input:checked').length != 0) {
																	$sidebar_img_container
																			.fadeOut(
																					'fast',
																					function() {
																						$sidebar_img_container
																								.css(
																										'background-image',
																										'url("'
																												+ new_image
																												+ '")');
																						$sidebar_img_container
																								.fadeIn('fast');
																					});
																}

																if ($full_page_background.length != 0
																		&& $('.switch-sidebar-image input:checked').length != 0) {
																	var new_image_full_page = $(
																			'.fixed-plugin li.active .img-holder')
																			.find(
																					'img')
																			.data(
																					'src');

																	$full_page_background
																			.fadeOut(
																					'fast',
																					function() {
																						$full_page_background
																								.css(
																										'background-image',
																										'url("'
																												+ new_image_full_page
																												+ '")');
																						$full_page_background
																								.fadeIn('fast');
																					});
																}

																if ($('.switch-sidebar-image input:checked').length == 0) {
																	var new_image = $(
																			'.fixed-plugin li.active .img-holder')
																			.find(
																					"img")
																			.attr(
																					'src');
																	var new_image_full_page = $(
																			'.fixed-plugin li.active .img-holder')
																			.find(
																					'img')
																			.data(
																					'src');

																	$sidebar_img_container
																			.css(
																					'background-image',
																					'url("'
																							+ new_image
																							+ '")');
																	$full_page_background
																			.css(
																					'background-image',
																					'url("'
																							+ new_image_full_page
																							+ '")');
																}

																if ($sidebar_responsive.length != 0) {
																	$sidebar_responsive
																			.css(
																					'background-image',
																					'url("'
																							+ new_image
																							+ '")');
																}
															});

											$('.switch-sidebar-image input')
													.change(
															function() {
																$full_page_background = $('.full-page-background');

																$input = $(this);

																if ($input
																		.is(':checked')) {
																	if ($sidebar_img_container.length != 0) {
																		$sidebar_img_container
																				.fadeIn('fast');
																		$sidebar
																				.attr(
																						'data-image',
																						'#');
																	}

																	if ($full_page_background.length != 0) {
																		$full_page_background
																				.fadeIn('fast');
																		$full_page
																				.attr(
																						'data-image',
																						'#');
																	}

																	background_image = true;
																} else {
																	if ($sidebar_img_container.length != 0) {
																		$sidebar
																				.removeAttr('data-image');
																		$sidebar_img_container
																				.fadeOut('fast');
																	}

																	if ($full_page_background.length != 0) {
																		$full_page
																				.removeAttr(
																						'data-image',
																						'#');
																		$full_page_background
																				.fadeOut('fast');
																	}

																	background_image = false;
																}
															});

											$('.switch-sidebar-mini input')
													.change(
															function() {
																$body = $('body');

																$input = $(this);

																if (md.misc.sidebar_mini_active == true) {
																	$('body')
																			.removeClass(
																					'sidebar-mini');
																	md.misc.sidebar_mini_active = false;

																	$(
																			'.sidebar .sidebar-wrapper, .main-panel')
																			.perfectScrollbar();

																} else {

																	$(
																			'.sidebar .sidebar-wrapper, .main-panel')
																			.perfectScrollbar(
																					'destroy');

																	setTimeout(
																			function() {
																				$(
																						'body')
																						.addClass(
																								'sidebar-mini');

																				md.misc.sidebar_mini_active = true;
																			},
																			300);
																}

																// we simulate the window Resize so the charts will get updated in realtime.
																var simulateWindowResize = setInterval(
																		function() {
																			window
																					.dispatchEvent(new Event(
																							'resize'));
																		}, 180);

																// we stop the simulation of Window Resize after the animations are completed
																setTimeout(
																		function() {
																			clearInterval(simulateWindowResize);
																		}, 1000);

															});
										});
					});
</script>
</body>

</html>
