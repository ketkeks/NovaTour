<%@ page buffer="none" isThreadSafe="true" errorPage="error.jsp" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>NovaTour</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var selItem = localStorage.getItem("locales");
		$('#locales').val(selItem ? selItem : 'en');
		$("#locales").change(function() {
			var selectedOption = $('#locales').val();
			if (selectedOption) {
				window.location.replace('?lang=' + selectedOption);
				localStorage.setItem("locales", selectedOption);
			}
		});
	});
</script>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png">
<link rel="icon" type="image/png" href="img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>NovaTour</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
<!-- CSS Files -->
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/now-ui-kit.css?v=1.3.0" rel="stylesheet" />
</head>

<body class="landing-page sidebar-collapse">
	<div class="wrapper">
		<!-- Navbar -->
		<nav
			class="navbar navbar-expand-lg bg-primary fixed-top navbar-transparent "
			color-on-scroll="400">
			<div class="container">
				<div class="dropdown button-dropdown">
					<a href="#pablo" class="dropdown-toggle" id="navbarDropdown"
						data-toggle="dropdown"> <span class="button-bar"></span> <span
						class="button-bar"></span> <span class="button-bar"></span>
					</a>
				</div>
				<div class="navbar-translate">
					<a class="navbar-brand" href="#"
						title="Designed by Ketkeks. Coded by Ketkeks"> NovaTour </a>
					<button class="navbar-toggler navbar-toggler" type="button"
						data-toggle="collapse" data-target="#navigation"
						aria-controls="navigation-index" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-bar top-bar"></span> <span
							class="navbar-toggler-bar middle-bar"></span> <span
							class="navbar-toggler-bar bottom-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse justify-content-end"
					id="navigation" data-nav-image="img/blurred-image-1.jpg">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="/tour/login"><spring:message code="login"/></a></li>
						<li class="nav-item"><a class="nav-link"
							href="/tour/registration"><spring:message code="registration"/></a></li>
						<li class="nav-item"><a class="nav-link" rel="tooltip"
							title="Follow us on Instagram" data-placement="bottom"
							href="https://www.instagram.com/ketkeks" target="_blank"> <i
								class="fab fa-instagram"></i>
								<p class="d-lg-none d-xl-none">Instagram</p>
						</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- End Navbar -->
		<div class="wrapper">
			<div class="page-header page-header-small">
				<div class="page-header-image" data-parallax="true"
					style="background-image: url('img/bg6.jpg');"></div>
				<div class="content-center">
					<div class="card-header text-center">
						<div class="logo-container">
							<img src="img/now-logo.png" alt="">
						</div>
					</div>
					<div class="container">
						<h1 class="title">NovaTour</h1>
						<div class="text-center"></div>
					</div>
				</div>
			</div>
			<div class="section section-about-us">
				<div class="container">
					<div class="row">
						<div class="col-md-8 ml-auto mr-auto text-center">
							<h2 class="title"><spring:message code="whowe"/></h2>
							<h5 class="description"><spring:message code="text1"/></h5>
						</div>
					</div>
					<div class="separator separator-primary"></div>
					<div class="section-story-overview">
						<div class="row">
							<div class="col-md-6">
								<div class="image-container image-left"
									style="background-image: url('img/bg4.jpg')">
									<!-- First image on the left side -->
									<p class="blockquote blockquote-primary">
									<spring:message code="text2"/></p>
								</div>
								<!-- Second image on the left side of the article -->
								<div class="image-container"
									style="background-image: url('img/bg3.jpg')"></div>
							</div>
							<div class="col-md-5">
								<!-- First image on the right side, above the article -->
								<div class="image-container image-right"
									style="background-image: url('img/bg1.jpg')"></div>
								<h3><spring:message code="text3"/></h3>
								<p><spring:message code="text4"/></p>
								<p><spring:message code="text5"/></p>
								<p><spring:message code="text6"/></p>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="section" id="carousel">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-8 col-md-12">
							<div id="carouselExampleIndicators" class="carousel slide"
								data-ride="carousel">
								<ol class="carousel-indicators">
									<li data-target="#carouselExampleIndicators" data-slide-to="0"
										class="active"></li>
									<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
									<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
								</ol>
								<div class="carousel-inner" role="listbox">
									<div class="carousel-item active">
										<img class="d-block" src="img/carusel1.jpg" >
										<div class="carousel-caption d-none d-md-block">
										</div>
									</div>
									<div class="carousel-item">
										<img class="d-block" src="img/carusel2.jpg">
										<div class="carousel-caption d-none d-md-block">
										</div>
									</div>
									<div class="carousel-item">
										<img class="d-block" src="img/carusel3.jpg" >
										<div class="carousel-caption d-none d-md-block">
										</div>
									</div>
									<div class="carousel-item">
										<img class="d-block" src="img/carusel4.jpg" >
										<div class="carousel-caption d-none d-md-block">
										</div>
									</div>
								</div>
								<a class="carousel-control-prev"
									href="#carouselExampleIndicators" role="button"
									data-slide="prev"> <i
									class="now-ui-icons arrows-1_minimal-left"></i>
								</a> <a class="carousel-control-next"
									href="#carouselExampleIndicators" role="button"
									data-slide="next"> <i
									class="now-ui-icons arrows-1_minimal-right"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<form:form autocomplete="off" action="/tour/" modelAttribute="comment"
				method="POST" class="form">
				<div class="section section-contact-us text-center">
					<div class="container">
						<h2 class="title"><spring:message code="question2"/></h2>
						<p class="description"><spring:message code="important"/></p>
						<div class="row">
							<div class="col-lg-6 text-center col-md-8 ml-auto mr-auto">
								<div class="input-group input-lg">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i
											class="now-ui-icons users_circle-08"></i>
										</span>
									</div>
									<form:input type="text" path="fio" class="form-control"
										placeholder="FIO..." />		
								</div>
								<form:errors path="fio" cssClass="badge badge-danger" />
								<div class="input-group input-lg">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i
											class="now-ui-icons ui-1_email-85"></i>
										</span>
									</div>
									<form:input type="text" path="email" class="form-control"
										placeholder="Email..." />										
								</div>
								<form:errors path="email" cssClass="badge badge-danger" />
								<div class="textarea-container">
									<form:textarea path="message" class="form-control" name="name" rows="4" cols="80"
										placeholder="Type a message..."></form:textarea>
										
								</div>
								<form:errors path="message" cssClass="badge badge-danger" />
								<div class="send-button">
									<button class="btn btn-primary btn-round btn-block btn-lg"
										type="submit"><spring:message code="send"/></button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form:form>
			<footer class="footer footer-default">
				<div class=" container ">
					<nav>
						<ul>
							<li><a href="/tour/login"> <spring:message code="login"/></a></li>
							<li><a href="/tour/registration"> <spring:message code="registration"/></a></li>
							<li><label><spring:message code="chooseLang" /></label> <select
								id="locales">
									<option value="ru"><spring:message code="rus"/></option>
									<option value="en"><spring:message code="eng"/></option>
							</select></li>

						</ul>
					</nav>
					<div class="copyright" id="copyright">
						&copy;
						<script>
							document.getElementById('copyright').appendChild(
									document.createTextNode(new Date()
											.getFullYear()))
						</script>
						, Created by <a href="https://www.instagram.com/ketkeks"
							target="_blank">Ketkeks</a>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script src="js/plugins/bootstrap-switch.js"></script>
	<script src="js/plugins/nouislider.min.js" type="text/javascript"></script>
	<script src="js/plugins/bootstrap-datepicker.js" type="text/javascript"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
	<script src="js/now-ui-kit.js?v=1.3.0" type="text/javascript"></script>
	<script src="js/core/jquery.min.js" type="text/javascript"></script>
	<script src="js/core/popper.min.js" type="text/javascript"></script>
	<script src="js/core/bootstrap.min.js" type="text/javascript"></script>
	<script>
		$(document).ready(function() {
			// the body of this function is in assets/js/now-ui-kit.js
			nowuiKit.initSliders();
		});

		function scrollToDownload() {

			if ($('.section-download').length != 0) {
				$("html, body").animate({
					scrollTop : $('.section-download').offset().top
				}, 1000);
			}
		}
	</script>
</body>
</html>