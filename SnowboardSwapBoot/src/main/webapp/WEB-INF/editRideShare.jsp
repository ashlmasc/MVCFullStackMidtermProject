<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

		<h2 class="display-4 text-center mb-4">Edit Current Ride Share</h2>
		<form action="updateRideShare" method="post"
			enctype="multipart/form-data">
			<!-- User id -->

			<input type="hidden" name="sponsorid" value="1">
			<input type="hidden" name="resortid" value="1">

			<div class="form-group">
				<label for="id">Post Id:</label>
				<input value="${ride.id}" type="text" id="id" name="id" readonly
					required>
			</div>
			<div class="form-group">
				<label for="departure">Departure date and time:</label>
				<input value="${ride.departure}" type="datetime-local"
					id="departure" name="departure" required>
			</div>

			<div class="form-group">
				<label for="detail">Details:</label>
				<input value="${ride.detail}" type="text" id="detail" name="detail"
					required>

			</div>

			<div class="form-group">
				<label for="vehicleCapacity">Vehicle capacity:</label>
				<input value="${ride.vehicleCapacity}" type="number"
					class="form-control" id="vehicleCapacity" name="vehicleCapacity">
			</div>

			<div class="form-group">
				<label for="vehicleMake">Vehicle make:</label>
				<input value="${ride.vehicleMake}" type="text" class="form-control"
					id="vehicleMake" name="vehicleMake">
			</div>

			<div class="form-group">
				<label for="vehicleModel">Vehicle model:</label>
				<input value="${ride.vehicleModel}" type="text" class="form-control"
					id="vehicleModel" name="vehicleModel">
			</div>

			<input type="submit" value="Post Edited Ride Share"
				class="btn btn-primary">
		</form>
	</main>
	<footer></footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>