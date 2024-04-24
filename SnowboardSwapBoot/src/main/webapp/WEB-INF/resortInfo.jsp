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

		<c:if test="${sessionScope.loggedInUser ne null }">
			<button class="btn btn-primary" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#addResortForm"
				aria-controls="offcanvasWithBothOptions">Edit Resort</button>


		</c:if>


		<p>${resort.name}</p>
		<a href="${resort.website}">To Website</a>
		<p>${resort.description}</p>
		<p>${resort.imageUrl}</p>

		<p>${resort.address.street},${resort.address.city},
			${resort.address.state} ${resort.address.postalCode}</p>
		<p>${resort.address.phoneNumber}</p>

		<a
			href="https://www.google.com/maps/search/?api=1&query=${resort.getMapURL()}"
			target="_blank">Map Pin</a>


		<p>Trails</p>

		<c:if test="${sessionScope.loggedInUser ne null }">
			<button type="button" data-bs-toggle="offcanvas"
				data-bs-target="#addTrailForm" aria-controls="addTrailForm">

				Add Trail</button>
		</c:if>



		<c:forEach var="trail" items="${resort.trails}">

			<li>${trail.name}|${trail.difficulty}<c:if
					test="${sessionScope.loggedInUser ne null }">


					<button type="button" data-bs-toggle="offcanvas"
						data-bs-target="#editTrailForm${trail.id}" aria-controls="">Edit</button>


					<div class="offcanvas offcanvas-start" data-bs-scroll="true"
						tabindex="-1" id="editTrailForm${trail.id}" aria-labelledby="">

						<div class="offcanvas-header">
							<h5 class="offcanvas-title" id="">Edit</h5>

							<button type="button" class="btn-close"
								data-bs-dismiss="offcanvas" aria-label="Close"></button>
						</div>

						<div class="offcanvas-body">
							<form action="editTrail" method="post">
								<%-- <input type="hidden" name="resortId" value="${resort.id}"> --%>
								<input type="hidden" name="id" value="${trail.id}">

								<div class="form-floating mb-3">
									<input type="text" class="form-control" id="trailName"
										placeholder="Name" name="name" value="${trail.name}">
									<label for="trailName">Trail Name</label>
								</div>

								<div class="form-floating">
									<select class="form-select" id="difficulty"
										aria-label="Trail difficulty" name="difficulty">

										<option
											<c:if test="${trail.difficulty eq Easiest }">
											 selected 
										</c:if>
											value="Easiest">Easiest</option>

										<option
											<c:if test="${trail.difficulty eq 'More Difficult'}">
											selected 
										</c:if>
											value="More Difficult">More Difficult</option>



										<option
											<c:if test="${trail.difficulty eq 'Most Difficult'}">
											selected 
										</c:if>
											value="Most Difficult">Most Difficult</option>



										<option
											<c:if test="${trail.difficulty eq 'Extreme'}">
											selected 
										</c:if>
											value="Extreme">Extreme</option>


										<option
											<c:if test="${trail.name eq 'Extreme Terrain'}">
											selected 
										</c:if>
											value="Extreme Terrain">Extreme Terrain</option>

									</select>
									<label for="floatingSelect">Difficulty</label>
								</div>
						</div>

						<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>

				</c:if>

			</li>

		</c:forEach>


		<hr>
		<p>Lifts</p>

		<c:if test="${sessionScope.loggedInUser ne null }">
			<button type="button" data-bs-toggle="offcanvas"
				data-bs-target="#addLiftForm" aria-controls="addLiftForm">

				Add Lift</button>

			<jsp:include page="resort/resortEditForm.jsp" />
		</c:if>

		<c:forEach var="lift" items="${resort.lifts}">

			<li>${lift.name}|${lift.liftType.type}<c:if
					test="${lift.getStatuses().size() > 0}">
							 | ${lift.getStatuses().get(lift.getStatuses().size() - 1).status};
			</c:if> <c:if test="${sessionScope.loggedInUser ne null }">
					<button type="button" data-bs-toggle="offcanvas"
						data-bs-target="#editLiftForm${lift.id}" aria-controls="">Edit</button>
				</c:if>
			</li>
			<c:if test="${sessionScope.loggedInUser ne null }">
				<div class="offcanvas offcanvas-start" data-bs-scroll="true"
					tabindex="-1" id="editLiftForm${lift.id}" aria-labelledby="">

					<div class="offcanvas-header">
						<h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">

							Edit Trail</h5>

						<button type="button" class="btn-close"
							data-bs-dismiss="offcanvas" aria-label="Close"></button>
					</div>

					<div class="offcanvas-body">

						<form action="editLift" method="post">
							<input type="hidden" name="id" value="${lift.id}">

							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="liftName"
									placeholder="Name" name="name" value="${lift.name}">
								<label for="liftName">Lift Name</label>
							</div>

							<div class="form-floating">
								<select class="form-select" id="liftType" aria-label=""
									name="liftTypeId">
									<c:forEach var="type" items="${liftTypes}">
										<option
											<c:if test="${lift.liftType.type eq type.type}">selected</c:if>
											value="${type.id}">${type.type}</option>
									</c:forEach>
								</select>
								<label for="liftType">Type</label>
							</div>

							<button type="submit" class="btn btn-primary">Submit</button>
						</form>


					</div>
				</div>
			</c:if>
		</c:forEach>




		<c:if test="${sessionScope.loggedInUser ne null }">
			<jsp:include page="trail/trailsAddForm.jsp" />
			<jsp:include page="lift/addLiftForm.jsp" />
		</c:if>


	</main>
	<footer></footer>
</body>
</html>