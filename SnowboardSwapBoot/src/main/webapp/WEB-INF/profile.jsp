<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>User Profile</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<link rel="stylesheet" type="text/css" href="css/profile.css">


</head>
<body>
	<header></header>
	<jsp:include page="nav.jsp" />
	<main>


		<h2 style="text-align: center">${loggedInUser.username}</h2>

		<div class="card">
			<img src="${loggedInUser.imageUrl}" alt="${loggedInUser.firstName}"
				style="width: 100%">
			<h1>${loggedInUser.firstName}${loggedInUser.lastName}</h1>
			<p class="title">${loggedInUser.bio}</p>
			<p>${loggedInUser.address.street}</p>
			<p>${loggedInUser.address.city},${loggedInUser.address.state}
				${loggedInUser.address.postalCode}</p>
			<div style="margin: 24px 0;"></div>
			<p>
				<a href="updateProfile" class="btn btn-primary">Edit Profile</a>
			</p>
		</div>


		<%-- <div class="container mt-5">
			<h1>
				Welcome,
				<c:out value="${loggedInUser.username}" />
			</h1>
			<p>Your details are below:</p>

			<form action="login.do" method="post">

				<!-- Hidden field for user ID -->
				<input type="hidden" name="userId" value="${user.id}">
				<!-- Hidden field for address ID -->
				<input type="hidden" name="addressId" value="${user.address.id}">

				<div class="form-group">
					<label for="firstName">First Name:</label>
					<input type="text" class="form-control" id="firstName"
						name="firstName" value="${loggedInUser.firstName}" disabled>
				</div>
				<div class="form-group">
					<label for="lastName">Last Name:</label>
					<input type="text" class="form-control" id="lastName"
						name="lastName" value="${loggedInUser.lastName}" disabled>
				</div>
				<div class="form-group">
					<label for="username">Username:</label>
					<input type="text" class="form-control" id="username"
						name="username" value="${loggedInUser.username}" disabled>
				</div>
				<div class="form-group">
					<label for="bio">Bio:</label>
					<textarea class="form-control" id="bio" name="bio" rows="3"
						disabled>${loggedInUser.bio}</textarea>
				</div>
				<div class="form-group">
					<label for="imageUrl">Image URL:</label>
					<input type="text" class="form-control" id="imageUrl"
						name="imageUrl" value="${loggedInUser.imageUrl}" disabled>
				</div>
			</form>

			<!-- Address details display -->
			<div class="form-group">
				<label for="street">Street:</label>
				<input type="text" class="form-control" id="street" name="street"
					value="${loggedInUser.address.street}" disabled>
			</div>
			<div class="form-group">
				<label for="city">City:</label>
				<input type="text" class="form-control" id="city" name="city"
					value="${loggedInUser.address.city}" disabled>
			</div>
			<div class="form-group">
				<label for="state">State:</label>
				<input type="text" class="form-control" id="state" name="state"
					value="${loggedInUser.address.state}" disabled>
			</div>
			<div class="form-group">
				<label for="postalCode">Postal Code:</label>
				<input type="text" class="form-control" id="postalCode"
					name="postalCode" value="${loggedInUser.address.postalCode}"
					disabled>
			</div>
			<div class="form-group">
				<label for="phoneNumber">Phone Number:</label>
				<input type="text" class="form-control" id="phoneNumber"
					name="phoneNumber" value="${loggedInUser.address.phoneNumber}"
					disabled>
			</div>

			<!-- Edit Profile Button -->
			<a href="updateProfile" class="btn btn-primary">Edit Profile</a>

		</div> --%>
	</main>
	<footer></footer>
	<!-- Bootstrap JS, Popper.js, and jQuery for tooltips -->
	
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>
</html>