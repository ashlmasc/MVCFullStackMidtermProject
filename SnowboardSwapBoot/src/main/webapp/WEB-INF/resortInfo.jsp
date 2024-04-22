<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Log In</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">


</head>
<body>

	<header></header>
	<jsp:include page="nav.jsp" />
	<main>

		<%-- <c:if test="${sessionScope.loggedInUser ne null }"> --%>
		<button class="btn btn-primary" type="button"
			data-bs-toggle="offcanvas" data-bs-target="#addResortForm"
			aria-controls="offcanvasWithBothOptions">Edit Resort</button>

		<div class="offcanvas offcanvas-start" data-bs-scroll="true"
			tabindex="-1" id="addResortForm"
			aria-labelledby="offcanvasWithBothOptionsLabel">

			<div class="offcanvas-header">
				<h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">

					Edit Resort</h5>

				<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
					aria-label="Close"></button>
			</div>

			<div class="offcanvas-body">
				<form action="editResort" method="post">
					<input type="hidden" name="id" value="${resort.id}">
						
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="resortName"
							placeholder="Name" name="name" value="${resort.name}">
						<label for="resortName">Resort Name</label>
					</div>

					<div class="form-floating mb-3">
						<input type="url" class="form-control" id="website"
							placeholder="Website" name="website" value="${resort.website}">
						<label for="website">Website</label>
					</div>
					
					<input type="hidden" name="addressId" value="3">
					
					<div class="form-floating">
						<input type="text" class="form-control" id="resortStreet"
							placeholder="Street" name="street" value="${resort.address.street}">
						<label for="resortStreet">Street Address</label>
					</div>
					<div class="form-floating">
						<input type="text" class="form-control" id="resortCity"
							placeholder="City" name="city" value="${resort.address.city}">
						<label for="resortCity">City</label>
					</div>
					<div class="form-floating">
						<input type="text" class="form-control" id="resortState"
							placeholder="State" name="state" value="${resort.address.state}">
						<label for="resortState">State</label>
					</div>
					<div class="form-floating">
						<input type="number" class="form-control" id="resortPostal"
							placeholder="Postal Code" name="postalCode" value="${resort.address.postalCode}">
						<label for="resortPostal">Postal Code</label>
					</div>
			</div>
			<div class="form-floating">
				<input type="text" class="form-control" id="resortPhone"
					placeholder="Phone Number" name="phoneNumber" value="${resort.address.phoneNumber}">
				<label for="resortPhone">Phone Number</label>
			</div>

			<button type="submit" class="btn btn-primary">Submit</button>

			</form>
		</div>
		</div>
		<%-- </c:if> --%>























		<p>${resort.name}</p>
		<a href="${resort.website}">To Website</a>
		<p>${resort.address.street},${resort.address.city},
			${resort.address.state} ${resort.address.postalCode}</p>
		<p>${resort.address.phoneNumber}</p>

		<a
			href="https://www.google.com/maps/search/?api=1&query=${resort.getMapURL()}">Map
			Pin</a>

		<ul>
			<p>Trails</p>

			<c:forEach var="trail" items="${resort.trails}">

				<li><c:if test="${sessionScope.loggedInUser ne null }">
					${trail.name}|${trail.difficulty}
					
					<form action="editTrail" method="post">
							<div class="form-floating mb-3">
								<input type="url" class="form-control" id="name${trail.id}"
									placeholder="Website" name="name">
								<label for="name${trail.id}">Name</label>
							</div>
							<div class="form-floating">
								<select class="form-select" id="floatingSelect"
									aria-label="Floating label select example">
									<option selected>Open this select menu</option>
									<option value="1">One</option>
									<option value="2">Two</option>
									<option value="3">Three</option>
								</select>
								<label for="floatingSelect">Works with selects</label>
							</div>


						</form>
					</c:if> <c:if test="${sessionScope.loggedInUser eq null }">
					${trail.name}|${trail.difficulty}
				</c:if></li>

			</c:forEach>

		</ul>
		<ul>
			<p>Lifts</p>

			<c:forEach var="lift" items="${resort.lifts}">

				<li>${lift.name}<c:if test="${lift.getStatuses().size() > 0}">
							 | ${lift.getStatuses().get(lift.getStatuses().size() - 1).status};
						</c:if>
				</li>

			</c:forEach>

		</ul>

	</main>
	<footer></footer>
</body>
</html>