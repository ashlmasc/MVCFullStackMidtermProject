<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Account Registration</title>

<!--     Bootstrap CSS -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<link rel="stylesheet" type="text/css" href="css/register.css">



</head>
<body>
	<header></header>
	<jsp:include page="nav.jsp" />
	<main>


		<div class="container">
			<div class="image-container">

				<!--  Placeholder for images -->
				<img src="path_to_image.jpg" alt="Event Image" />
			</div>

			<div class="form-container">
				<h2>Register</h2>
				<form class="form-register" action="register.do" method="post">

					<div class="input-group mb-3">
						<div class="form-floating">
							<input type="text" class="form-control" id="firstName"
								name="firstName" placeholder="" required autofocus>
							<label for="firstName">First Name</label>
						</div>

						<div class="form-floating">
							<input type="text" class="form-control" id="lastName"
								name="lastName" placeholder="" required autofocus>
							<label for="lastName">Last Name</label>
						</div>
					</div>


					<div class="form-floating">
						<input type="text" class="form-control" id="username"
							name="username" placeholder="" required autofocus>
						<label for="username">Username</label>
					</div>

					<div class="form-floating mb-3">
						<input type="password" class="form-control" id="password"
							name="password" placeholder="" required autofocus>
						<label for="password">Password</label>
					</div>

					<div class="form-floating mb-3">
						<input type="text" placeholder="" class="form-control" id="city" name="city"
							autofocus>
						<label for="city">City</label>
					</div>


					<button type="submit" class="btn btn-primary col-12">Register/Submit</button>
				</form>
			</div>

			<div class="image-container">

				<!--             Placeholder for images -->
				<img src="path_to_another_image.jpg" alt="Fun Mountain Image" />
			</div>
		</div>



	</main>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>