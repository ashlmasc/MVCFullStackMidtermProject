
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

<link rel="stylesheet" type="text/css" href="css/site.css">



</head>
<body>
	<main>

		<jsp:include page="nav.jsp" />


		<h1 class="page-header">Register Page</h1>
		<div class="container">
			<div class="image-container">

				<!--  Placeholder for images -->
				<img src="path_to_image.jpg" alt="Event Image" />
			</div>

			<div class="form-container">
				<h2>Register Page and Rules to join</h2>
				<form action="register.do" method="post">
					<div class="form-group">
						<input type="text" class="form-control" name="firstName"
							placeholder="First Name" required>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="lastName"
							placeholder="Last Name" required>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="username"
							placeholder="Username" required>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" name="password"
							placeholder="Password" required>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="city"
							placeholder="City">
					</div>
					<button type="submit" class="btn btn-primary">Register/Submit</button>
				</form>
			</div>

			<div class="image-container">

				<!--             Placeholder for images -->
				<img src="path_to_another_image.jpg" alt="Fun Mountain Image" />
			</div>
		</div>



	</main>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>