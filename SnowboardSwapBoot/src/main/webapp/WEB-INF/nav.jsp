<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<nav class="navbar navbar-expand-lg bg-body-tertiary">
	<div class="container-fluid">
		<a class="navbar-brand" href="#">SiteName</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav">

				<li class="nav-item">
					<a class="nav-link" aria-current="page" href="home.do">Home</a>
				</li>

				<li class="nav-item">
					<a class="nav-link" href="resorts">Resorts</a>
				</li>
				
				<li class="nav-item">
					<a class="nav-link" href="rideshare">Ride Share</a>
				</li>
				
				<li class="nav-item dropdown">
					<a	class="nav-link dropdown-toggle" href="#" role="button"	data-bs-toggle="dropdown" aria-expanded="false"> 
						<i class="bi bi-person-circle"></i>
					</a>
						
					<ul class="dropdown-menu" >	
						<c:if test="${sessionScope.loggedInUser ne null }">
							<a class="dropdown-item" href="account">Account</a>
							<a class="dropdown-item" href="logout">Logout</a>
						</c:if>

						<c:if test="${sessionScope.loggedInUser eq null}">
							<a class="dropdown-item" href="register">Register</a>
							<a class="dropdown-item" href="login">Login</a>
						</c:if>

					</ul>
					</li>
			</ul>
		</div>
	</div>
</nav>



<!-- Check if a user is logged in -->

<%-- <c:choose> --%>
<%-- <c:when test="${empty sessionScope.loggedInUser}"></c:when> --%>
<%-- </c:choose>  --%>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>