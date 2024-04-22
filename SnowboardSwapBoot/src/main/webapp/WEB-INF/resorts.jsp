<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Resorts</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" type="text/css" href="css/resorts.css">

</head>
<body>

	<header> </header>
	<jsp:include page="nav.jsp" />

	<main>
		<c:if test="${sessionScope.loggedInUser ne null }">
			<button class="btn btn-primary" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#addResortForm"
				aria-controls="offcanvasWithBothOptions">Add new resort</button>

			<div class="offcanvas offcanvas-start" data-bs-scroll="true"
				tabindex="-1" id="addResortForm"
				aria-labelledby="offcanvasWithBothOptionsLabel">

				<div class="offcanvas-header">
					<h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">

						Add new Resort</h5>

					<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
						aria-label="Close"></button>
				</div>

				<div class="offcanvas-body">
					<form action="addResort" method="post">

						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="resortName"
								placeholder="Name" name="name"> <label for="resortName">Resort
								Name</label>
						</div>
						<div class="form-floating mb-3">
							<input type="url" class="form-control" id="website"
								placeholder="Website" name="website"> <label for="website">Website</label>
						</div>
						<div class="form-floating">
							<input type="text" class="form-control" id="resortStreet"
								placeholder="Street" name="street"> <label for="resortStreet">Street
								Address</label>
						</div>
						<div class="form-floating">
							<input type="text" class="form-control" id="resortCity"
								placeholder="City" name="city"> <label for="resortCity">City</label>
						</div>
						<div class="form-floating">
							<input type="text" class="form-control" id="resortState"
								placeholder="State" name="state"> <label for="resortState">State</label>
						</div>
							<div class="form-floating">
							<input type="number" class="form-control" id="resortPostal"
								placeholder="Postal Code" name="postalCode"> <label for="resortPostal">Postal Code</label>
						</div>
						
						</div>
							<div class="form-floating">
							<input type="text" class="form-control" id="resortPhone"
								placeholder="Phone Number" name="phoneNumber"> <label for="resortPhone">Phone Number</label>
						</div>
						
						<button type="submit" class="btn btn-primary">Submit</button>
						
					</form>
				</div>
			</div>
		</c:if>


		<c:forEach var="resort" items="${resorts}">

			<div class="resort-card">
				<img
					src="https://www.coppercolorado.com/_gatsby/image/7c52b160aea9dcc37c0af3dccb45e77d/37ff55ff33e858b62e6b9a28a9c49586/CM_Winter_Center%20Village%20Drone_3-2-23_CD_01.webp?u=https%3A%2F%2Fcms.coppercolorado.com%2Fsites%2Fdefault%2Ffiles%2F2023-11%2FCM_Winter_Center%2520Village%2520Drone_3-2-23_CD_01.jpg&a=w%3D1920%26h%3D1279%26fm%3Dwebp%26q%3D90&cd=ad3c7a103795f406e21b7d566b88eea5"
					alt="${resort.name} image"> <a href="resort?id=${resort.id}">Link
					to resort info</a>
				<p>${resort.name}</p>
				<p>${resort.address.street},${resort.address.city},
					${resort.address.state} ${resort.address.postalCode}</p>

				<p>${resort.address.phoneNumber}</p>
				<p>${resort.getMapURL()}</p>

			</div>


		</c:forEach>
		
		
		
	</main>
	<footer> </footer>


</body>
</html>