<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>Update Profile</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<link rel="stylesheet" type="text/css" href="css/site.css">



</head>
<body>
	<header></header>
	
	<jsp:include page="nav.jsp" />
	
	<main>
		<div class="container mt-5">
			<h2>Update Profile</h2>
			<form action="updateProfile" method="post">

				<!-- Hidden field for user ID -->
				<input type="hidden" name="userId" value="${user.id}">
				<!-- Hidden field for address ID -->
				<input type="hidden" name="addressId" value="${user.address.id}">

				
				<div class="form-floating mb-3">
					<label for="username">Username</label>
					<input type="text" class="form-control" id="username"
						name="username" value="${user.username}" required>
				</div>

				<div class="form-group">
					<label for="password">Password</label>
					<input type="text" class="form-control" id="password"
						name="password" value="${user.password}">
				</div>

				<!-- hides the password, however, user needs to see it to make sure they know their password -->
				<!--         <div class="form-group"> -->
				<!--             <label for="password">Password</label> -->
				<%--             <input type="password" class="form-control" id="password" name="password" value="${user.password}"> --%>
				<!--         </div> -->

				<div class="form-group">
					<label for="firstName">First Name</label>
					<input type="text" class="form-control" id="firstName"
						name="firstName" value="${user.firstName}" required>
				</div>
				<div class="form-group">
					<label for="lastName">Last Name</label>
					<input type="text" class="form-control" id="lastName"
						name="lastName" value="${user.lastName}" required placeholder="">
				</div>
				<div class="form-group">
					<label for="bio">Bio</label>
					<textarea class="form-control" id="bio" name="bio" rows="3">${user.bio}</textarea>
				</div>
				<div class="form-group">
					<label for="imageUrl">Image URL</label>
					<input type="text" class="form-control" id="imageUrl"
						name="imageUrl" value="${user.imageUrl}">
				</div>

				<!-- Address fields -->
				<div class="form-group">
					<label for="street">Street</label>
					<input type="text" class="form-control" id="street" name="street"
						value="${user.address.street}">
				</div>
				<div class="form-group">
					<label for="city">City</label>
					<input type="text" class="form-control" id="city" name="city"
						value="${user.address.city}">
				</div>
				<div class="form-group">
					<label for="state">State</label>
					<input type="text" class="form-control" id="state" name="state"
						value="${user.address.state}">
				</div>
				<div class="form-group">
					<label for="postalCode">Postal Code</label>
					<input type="text" class="form-control" id="postalCode"
						name="postalCode" value="${user.address.postalCode}">
				</div>
				<div class="form-group">
					<label for="phoneNumber">Phone Number</label>
					<input type="text" class="form-control" id="phoneNumber"
						name="phoneNumber" value="${user.address.phoneNumber}">
				</div>
				<!-- Add more fields as needed -->

				<!-- Cancel/Update Button -->
				<a href="profile" class="btn btn-secondary" data-toggle="tooltip"
					title="Cancel and return to the profile page">Cancel</a>
				<button type="submit" class="btn btn-primary" data-toggle="tooltip"
					title="Update Profile">Confirm Edit</button>
			</form>
		</div>
	</main>
	<footer></footer>
	<!-- Bootstrap JS, Popper.js, and jQuery for tooltips -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script>
		$(function() {
			$('[data-toggle="tooltip"]').tooltip(); // Initialize tooltips
		});
	</script>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>
</html>
