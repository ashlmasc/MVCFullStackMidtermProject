<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ride Share</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	
<link rel="stylesheet" type="text/css" href="css/rideshare.css">

</head>
<body>
	<jsp:include page="nav.jsp" />
	<div class="header">

		<h1 align="center">Ride Share Message Board</h1>

	</div>
	<div class="centertextbox">
		<section>
			<h2 align="center">Rules of Ride Share to Participate</h2>
		</section>
	</div>

	<section>




		<p>People can post looking for a ride or offering a ride...</p>
		<div class="post">
			<div class="container mt-5">
				<h2 class="display-4 text-center mb-4">Post New Ride Share</h2>
				<form action="rideshare" method="post" enctype="multipart/form-data">
					<!-- User id -->
					<input type="hidden" name="sponsorid" value="1"> <input
						type="hidden" name="resortid" value="1">

					<div class="form-group">
						<label for="departure">Departure date and time:</label> <input
							type="datetime-local" id="departure" name="departure" required>
					</div>

					<div class="form-group">
						<label for="departureAddress">Departure Address:</label> <input
							type="text" name="street1"> <input type="text"
							name="city1"> <input type="text" name="state1">
					</div>

					<div class="form-group">
						<label for="arrivalAddress">Arrival Address:</label> <input
							type="text" name="street2"> <input type="text"
							name="city2"> <input type="text" name="state2">
					</div>

					<div class="form-group">
						<label for="detail">Details:</label> <input class="form-control"
							id="detail" name="detail" placeholder="Details" required>
					</div>

					<div class="form-group">
						<label for="vehicleCapacity">Vehicle capacity:</label> <input
							type="number" class="form-control" id="vehicleCapacity"
							name="vehicleCapacity" placeholder="Capacity of vehicle" required>
					</div>

					<div class="form-group">
						<label for="vehicleMake">Vehicle make:</label> <input type="text"
							class="form-control" id="vehicleMake" name="vehicleMake"
							placeholder="Make of vehicle" required>
					</div>

					<div class="form-group">
						<label for="vehicleModel">Vehicle model:</label> <input
							type="text" class="form-control" id="vehicleModel"
							name="vehicleModel" placeholder="Model of vehicle" required>
					</div>

					<input type="submit" value="Post New Ride Share"
						class="btn btn-primary">
				</form>
			</div>
		</div>

	</section>
	<br>
	<br>
	<div class="background">
		<div class="tableheader">
			<h2>Message Board</h2>
		</div>
		<div class="transbox">

			<ul class="list-group">

				<c:forEach var="ride" items="${allRides}">
					<li class="list-group-item">Id: ${ride.id} <br> Departure
						Date and Time: ${ride.departure} <br> Vehicle Capacity:
						${ride.vehicleCapacity} <br> Vehicle Make:
						${ride.vehicleMake} <br> Vehicle Model:${ride.vehicleModel} 
						<br>
						<br>
						<a href="editRideShare?id=${ride.id}" class="btn btn-primary" type="submit" value="edit ride share">Edit Ride Share</a>

						<form action="deleteRideShare"
							onsubmit="return window.confirm('Are you sure you want to delete this log?');"
							method="POST">
							<div class="form-group">
								<input type="hidden" class="form-control" id="id" name="id"
									value="<c:out value='${ride.id}' />">
							</div>
							<button type="submit" value="Delete Ride Share">Delete
								Entry</button>
						</form>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>
