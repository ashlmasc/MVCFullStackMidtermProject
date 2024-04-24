<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ride Share</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	href="https://www.cssportal.com/css-color-converter/00B3BA"
	rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/rideshare.css">
</head>
<body>
	<jsp:include page="nav.jsp" />


	<h1 align="center">Ride Share Page/Message Board</h1>
	<section>
		<h2 align="center">Rules of Ride Share to Participate</h2>
		<p>Details about participation rules...</p>
	</section>

	<section>
<div class="header">
		<h2>Message Board</h2></div>

		<div class="row">
			<div class="leftcolumn">
				<div class="card">
					<h2>New Post</h2>

					<c:forEach var="ride" items="${allRides}">
						<h2></h2>
						<div>
						
							<ul>

								<li>Id: ${ride.id}</li>
								<li>Departure Date and Time: ${ride.departure}</li>
								<li>Vehicle Capacity: ${ride.vehicleCapacity}</li>
								<li>Vehicle Make: ${ride.vehicleMake}</li>
								<li>Vehicle Model:${ride.vehicleModel}</li>


							</ul>

							<a href="editRideShare?id=${ride.id}" class="btn btn-primary"></a>

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
						</div>


					</c:forEach>

				</div>
			</div>
		</div>
		<p>People can post looking for a ride or offering a ride...</p>

		<div class="container mt-5">
			<h2 class="display-4 text-center mb-4">Post New Ride Share</h2>
			<form action="rideshare" method="post"
				enctype="multipart/form-data">
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
					<label for="detail">Details:</label>
					<input class="form-control" id="detail" name="detail"
						placeholder="Details" required>
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
					<label for="vehicleModel">Vehicle model:</label> <input type="text"
						class="form-control" id="vehicleModel" name="vehicleModel"
						placeholder="Model of vehicle" required>
				</div>

				<input type="submit" value="Post New Ride Share"
					class="btn btn-primary">
			</form>
		</div>
		<div>

		

		<form action="joinRideShare.do" method="post">
			<!-- Form inputs for joining a ride share -->
			<input type="submit" value="Join Ride Share" class="btn btn-primary">
		</form>
	</section>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
