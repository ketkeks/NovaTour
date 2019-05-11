<%@ page buffer="none" isThreadSafe="true" errorPage="error.jsp"
	language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>АРМ администратора</title>
<link href="../css/index.css" rel="stylesheet" />
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
<link href="../css/bootstrap.min.css" rel="stylesheet" />
<link href="../css/now-ui-kit.css?v=1.3.0" rel="stylesheet" />
<link rel="apple-touch-icon" sizes="76x76" href="../img/apple-icon.png">
<link rel="icon" type="image/png" href="../img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
</head>
<body class="profile-page sidebar-collapse">
	<!-- Navbar -->
	<nav
		class="navbar navbar-expand-lg bg-primary fixed-top navbar-transparent "
		color-on-scroll="400">
		<div class="container">
			<div class="dropdown button-dropdown">
				<a href="#" class="dropdown-toggle" id="navbarDropdown"
					data-toggle="dropdown"> <span class="button-bar"></span> <span
					class="button-bar"></span> <span class="button-bar"></span>
				</a>
			</div>
			<div class="navbar-translate">
				<a class="navbar-brand" href="/tour"
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
		<div class="page-header clear-filter page-header-small"
			filter-color="orange">
			<div class="page-header-image" data-parallax="true"
				style="background-image: url('../img/bg5.jpg');"></div>
			<div class="container">
				<h2 class="title">
					<c:out value="${userLastName}" />
				</h2>
				<h3 class="title">
					<c:out value="${userName}" />
				</h3>
				<div class="content">

					<div class="social-description">
						<p>
							<c:out value="${userEmail}" />
						</p>
					</div>
				</div>

			</div>
		</div>

		<div class="section">
			<div class="container">
				<div class="button-container">
					<form:form action="/tour/logout" method="get">
						<button class="btn btn-primary btn-round btn-lg"
							name="registration" type="Submit">
							<spring:message code="logout" />
						</button>
					</form:form>
				</div>
			</div>
		</div>
		<h1 class="title">
			<c:out value="${adminMessage}" />
		</h1>
	</div>

	<div>
		<h1>
			<spring:message code="orders" />
		</h1>
		<div>
			<table>
				<thead>
					<tr>
						<td>id</td>
						<td>Клиент</td>
						<td>Работник</td>
						<td>Курорт</td>
						<td>Цена</td>
						<td>Дата заказа</td>
						<td></td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${orders}" var="order">

						<tr>
							<td><c:out value="${order.id}"></c:out></td>
							<td><c:out value="${order.client.id}"></c:out></td>
							<td><c:out value="${order.emploee.id}"></c:out></td>
							<td><c:out value="${order.resort.id}"></c:out></td>
							<td><c:out value="${order.amount}"></c:out></td>
							<td><c:out value="${order.orderDate}"></c:out></td>
							<td><input type="submit" value="<spring:message code="edit" />" /></td>
						</tr>
					</c:forEach>
					<tr>
						<form:form method="POST" modelAttribute="orderSave"
							action="saveOrder.do">
							<td></td>
							<td><form:input path="client.id" /> <form:errors
									path="client.id" cssClass="error" /></td>
							<td><form:input path="emploee.id" /> <form:errors
									path="emploee.id" cssClass="error" /></td>
							<td><form:input path="resort.id" /> <form:errors
									path="resort.id" cssClass="error" /></td>
							<td><form:input path="amount" /> <form:errors path="amount"
									cssClass="error" /></td>
							<td><form:input path="orderDate" /> <form:errors
									path="orderDate" cssClass="error" /></td>
							<td><input type="submit"
								value="<spring:message code="save"/>" /></td>
						</form:form>
					</tr>
				</tbody>
			</table>
		</div>
		<h1>
			<spring:message code="clients" />
		</h1>
		<div>
			<div>
				<table>
					<thead>
						<tr>
							<td>Id</td>
							<td>Фамилия</td>
							<td>Имя</td>
							<td>Дата рождения</td>
							<td>Адресс</td>
							<td>Телефон</td>
							<td>Почта</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${clients}" var="client">
							<tr>
								<td><c:out value="${client.id}"></c:out></td>
								<td><c:out value="${client.firstName}"></c:out></td>
								<td><c:out value="${client.lastName}"></c:out></td>
								<td><c:out value="${client.date}"></c:out></td>
								<td><c:out value="${client.address}"></c:out></td>
								<td><c:out value="${client.phone}"></c:out></td>
								<td><c:out value="${client.email}"></c:out></td>
								<td><input type="submit" value="<spring:message code="edit" />" /></td>
							</tr>
						</c:forEach>
						<tr>
							<form:form method="POST" modelAttribute="clientSave"
								action="saveClient.do">
								<td></td>
								<td><form:input path="firstName" /> <form:errors
										path="firstName" cssClass="error" /></td>
								<td><form:input path="lastName" /> <form:errors
										path="lastName" cssClass="error" /></td>
								<td><form:input path="date" /> <form:errors path="date"
										cssClass="error" /></td>
								<td><form:input path="address" /> <form:errors
										path="address" cssClass="error" /></td>
								<td><form:input path="phone" /> <form:errors path="phone"
										cssClass="error" /></td>
								<td><form:input path="email" /> <form:errors path="email"
										cssClass="error" /> </td>
									<td><input type="submit"
									value="<spring:message code="save" />" /></td>
							</form:form>
						</tr>

					</tbody>
				</table>
			</div>
		</div>

		<h1>
			<spring:message code="emploeers" />
		</h1>

		<div>
			<table>
				<thead>
					<tr>
						<td>Id</td>
						<td>Фамилия</td>
						<td>Имя</td>
						<td>Дата рождения</td>
						<td>Адресс</td>
						<td>Телефон</td>
						<td>Почта</td>
						<td></td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${emploeers}" var="emploee">
						<tr>
							<td><c:out value="${emploee.id}"></c:out></td>
							<td><c:out value="${emploee.firstName}"></c:out></td>
							<td><c:out value="${emploee.lastName}"></c:out></td>
							<td><c:out value="${emploee.date}"></c:out></td>
							<td><c:out value="${emploee.address}"></c:out></td>
							<td><c:out value="${emploee.phone}"></c:out></td>
							<td><c:out value="${emploee.email}"></c:out></td>
							<td><input type="submit" value="<spring:message code="edit" />" /></td>
						</tr>

					</c:forEach>
					<tr>
						<form:form method="POST" modelAttribute="emploeeSave"
							action="saveEmploee.do">
							<td></td>
							<td><form:input path="firstName" /> <form:errors
									path="firstName" cssClass="error" /></td>
							<td><form:input path="lastName" /> <form:errors
									path="lastName" cssClass="error" /></td>
							<td><form:input path="date" /> <form:errors path="date"
									cssClass="error" /></td>
							<td><form:input path="address" /> <form:errors
									path="address" cssClass="error" /></td>
							<td><form:input path="phone" /> <form:errors path="phone"
									cssClass="error" /></td>
							<td><form:input path="email" /> <form:errors path="email"
									cssClass="error" /> </td>
								<td><input type="submit"
								value="<spring:message code="save"/>" /></td>
						</form:form>
					</tr>

				</tbody>
			</table>
		</div>
		<h1>
			<spring:message code="resorts" />
		</h1>
		<div>
			<table>
				<thead>
					<tr>
						<td>Id</td>
						<td>Рейс</td>
						<td>Отель</td>
						<td>Цена</td>
						<td></td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${resorts}" var="resort">
						<tr>
							<td><c:out value="${resort.id}"></c:out></td>
							<td><c:out value="${resort.flight.id}"></c:out></td>
							<td><c:out value="${resort.hotel.id}"></c:out></td>
							<td><c:out value="${resort.price}"></c:out></td>
							<td><input type="submit" value="<spring:message code="edit" />" /></td>
						</tr>
					</c:forEach>
					<tr>
						<form:form method="POST" modelAttribute="resortSave"
							action="saveResort.do">
							<td></td>

							<td><form:input path="flight.id" /> <form:errors
									path="flight.id" cssClass="error" /></td>
							<td><form:input path="hotel.id" /> <form:errors
									path="hotel.id" cssClass="error" /></td>
							<td><form:input path="price" /> <form:errors path="price"
									cssClass="error" /> </td>
								<td><input type="submit"
								value="<spring:message code="save"/>" /></td>
						</form:form>
					</tr>
				</tbody>

			</table>

		</div>
		<h1>
			<spring:message code="flights" />
		</h1>

		<div>
			<table>
				<thead>
					<tr>
						<td>Id</td>
						<td>Дата прибытия</td>
						<td>Дата отбытия</td>
						<td>Цена</td>
						<td>Количество дней</td>
						<td></td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${flights}" var="flight">
						<tr>
							<td><c:out value="${flight.id}"></c:out></td>
							<td><c:out value="${flight.arrivalDate}"></c:out></td>
							<td><c:out value="${flight.departureDate}"></c:out></td>
							<td><c:out value="${flight.price}"></c:out></td>
							<td><c:out value="${flight.numberOfDays}"></c:out></td>
							<td><input type="submit" value="<spring:message code="edit" />" /></td>
						</tr>
					</c:forEach>
					<tr>
						<form:form method="POST" modelAttribute="flightSave"
							action="saveFlight.do">
							<td></td>

							<td><form:input path="arrivalDate" /> <form:errors
									path="arrivalDate" cssClass="error" /></td>
							<td><form:input path="departureDate" /> <form:errors
									path="departureDate" cssClass="error" /></td>
							<td><form:input path="price" /> <form:errors path="price"
									cssClass="error" /></td>
							<td><form:input path="numberOfDays" /> <form:errors
									path="numberOfDays" cssClass="error" /> </td>
								<td><input type="submit"
								value="<spring:message code="save"/>" /></td>
						</form:form>
					</tr>
				</tbody>
			</table>
		</div>


		<h1>
			<spring:message code="hotels" />
		</h1>
		<div>
			<table>
				<thead>
					<tr>
						<td>Id</td>
						<td>Название</td>
						<td>Страна</td>
						<td>Город</td>
						<td>Количество звёзд</td>
						<td>Питание</td>
						<td>Ссылка</td>
						<td></td>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${hotels}" var="hotel">
						<tr>
							<td><c:out value="${hotel.id}"></c:out></td>
							<td><c:out value="${hotel.name}"></c:out></td>
							<td><c:out value="${hotel.country}"></c:out></td>
							<td><c:out value="${hotel.city}"></c:out></td>
							<td><c:out value="${hotel.stars}"></c:out></td>
							<td><c:out value="${hotel.food}"></c:out></td>
							<td><c:out value="${hotel.href}"></c:out></td>
							<td><input type="submit" value="<spring:message code="edit" />" /></td>
						</tr>
					</c:forEach>
					<tr>
						<form:form method="POST" modelAttribute="hotelSave"
							action="saveHotel.do">
							<td></td>

							<td><form:input path="name" /> <form:errors path="name"
									cssClass="error" /></td>
							<td><form:input path="country" /> <form:errors
									path="country" cssClass="error" /></td>
							<td><form:input path="city" /> <form:errors path="city"
									cssClass="error" /></td>
							<td><form:input path="stars" /> <form:errors path="stars"
									cssClass="error" /></td>
							<td><form:input path="food" /> <form:errors path="food"
									cssClass="error" /></td>
							<td><form:input path="href" /> <form:errors
									path="href" cssClass="error" /> </td>
								<td><input type="submit"
								value="<spring:message code="save"/>" /></td>
						</form:form>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<footer class="footer footer-default">
		<div class=" container ">
			<nav>
				<ul>
					<li><form:form action="/tour/logout" method="get">
							<button class="btn btn-md btn-danger btn-block"
								name="registration" type="Submit">
								<spring:message code="logout" />
							</button>
						</form:form></li>

					<li><label><spring:message code="chooseLang" /></label> <select
						id="locales">
							<option value="ru"><spring:message code="rus" /></option>
							<option value="en"><spring:message code="eng" /></option>
					</select></li>

				</ul>
			</nav>
			<div class="copyright" id="copyright">
				&copy;
				<script>
					document.getElementById('copyright').appendChild(
							document.createTextNode(new Date().getFullYear()))
				</script>
				, Created by <a href="https://www.instagram.com/ketkeks"
					target="_blank">Ketkeks</a>
			</div>
		</div>
	</footer>
	<!--   Core JS Files   -->
	<script src="../js/core/jquery.min.js" type="text/javascript"></script>
	<script src="../js/core/popper.min.js" type="text/javascript"></script>
	<script src="../js/core/bootstrap.min.js" type="text/javascript"></script>
	<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
	<script src="../js/plugins/bootstrap-switch.js"></script>
	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script src="../js/plugins/nouislider.min.js" type="text/javascript"></script>
	<!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
	<script src="../js/plugins/bootstrap-datepicker.js"
		type="text/javascript"></script>
	<!-- Control Center for Now Ui Kit: parallax effects, scripts for the example pages etc -->
	<script src="../js/now-ui-kit.js?v=1.3.0" type="text/javascript"></script>
	<script>
		$(document).ready(function() {
			nowuiKit.initContactUsMap();
		});
	</script>
</body>
</html>