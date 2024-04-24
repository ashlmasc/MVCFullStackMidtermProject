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
	rel="stylesheet">
</head>
<body>
	<jsp:include page="nav.jsp" />

	<style>
body {
	font: 12px Arial, Tahoma, Helvetica, FreeSans, sans-serif;
	text-transform: inherit;
	color: #333;
	background: #21a2d1;
	width: 100%;
}

.wrap {
	width: 720px;
	margin: 15px auto;
	padding: 15px 10px;
	background: white;
	border: 2px solid #DBDBDB;
	border-radius: 5px;
}

.title, .userName {
	font-weight: 700;
}

.post {
	border-bottom: 1px solid black;
	padding-bottom: 5px;
}

.post .title {
	font-style: italic;
}

.post .body {
	margin-top: 5px;
}
</style>

	<h1 align="center">Ride Share Page/Message Board</h1>
	<section>
		<h2 align="center">Rules of Ride Share to Participate</h2>
		<p>Details about participation rules...</p>
	</section>

	<section>
		<h2>Message Board</h2>

		<c:forEach var="ride" items="${allRides}">
			<h2>
				<b>New Post!</b>
			</h2>
			<div>
				<ul>

					<li>Id: <br> ${ride.id}
					</li>


					<li>Departure Date and Time: ${ride.departure}</li>
                                  <%--   <li>Departure Address: ${ride.departureAddress}</li>
                                    <li>Arrival Address:${ride.arrivalAddress}</li>
                                    <li>Resort Destination:${ride.resort}</li>
                                    <li>Vehicle Capacity: ${ride.vehicleCapacity}</li>
                                    <li>Vehicle Make: ${ride.vehicleMake}</li>
                                    <li>Vehicle Model:${ride.vehicleModel}</li> --%>


				</ul>
				
				<a href="editRideShare?id=${ride.id}" class="btn btn-primary"></a>
				
	<form action="deleteRideShare.do" onsubmit="return window.confirm('Are you sure you want to delete this log?');" method="POST">
                                            <div class="form-group">
                                                <input type="hidden" class="form-control" id="id" name="id" value="<c:out value='${ride.id}' />">
                                            </div>
                                            <button type="submit"value="Delete Ride Share">Delete Entry</button>
                                        </form> </div>
			

		</c:forEach>


		<p>People can post looking for a ride or offering a ride...</p>

		<div class="container mt-5">
			<h2 class="display-4 text-center mb-4">Post New Ride Share</h2>
			<form action="createRideShare" method="post"
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
					<textarea class="form-control" id="detail" name="detail"
						placeholder="Details" required></textarea>
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

			<form action="showPostsById" method="POST">
				<h2>
					<b> Search for posts by Id: </b>
				</h2>

				<input type="text" name="id" /> <input type="submit" value="Submit" />
			</form>
		</div>
		<br>
		<form action="getRideUser.do" method="GET">
			<h2>
				<b> Search for posts by User: </b>
			</h2>
			<input type="text" name="userName" /> <input type="submit"
				value="Submit" />
		</form>

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
