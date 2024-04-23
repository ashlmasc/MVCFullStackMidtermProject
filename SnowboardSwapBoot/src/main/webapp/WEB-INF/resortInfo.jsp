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
				
				Add Trail
				
				</button>

			<jsp:include page="resort/resortEditForm.jsp" />
		</c:if>



		<c:forEach var="trail" items="${resort.trails}">

			<li>${trail.name}|${trail.difficulty}</li>

		</c:forEach>


		<hr>
		<p>Lifts</p>

		<c:if test="${sessionScope.loggedInUser ne null }">
			<button type="button" data-bs-toggle="offcanvas"
				data-bs-target="#addLiftForm" aria-controls="addLiftForm">

				Add Lift
				
			</button>

			<jsp:include page="resort/resortEditForm.jsp" />
		</c:if>

		<c:forEach var="lift" items="${resort.lifts}">

			<li>${lift.name} | ${lift.liftType.type}
			<c:if test="${lift.getStatuses().size() > 0}">
							 | ${lift.getStatuses().get(lift.getStatuses().size() - 1).status};
						</c:if>
			</li>

		</c:forEach>




		<c:if test="${sessionScope.loggedInUser ne null }">
			<jsp:include page="trail/trailsAddForm.jsp" />
			<jsp:include page="lift/addLiftForm.jsp" />
		</c:if>


	</main>
	<footer></footer>
</body>
</html>