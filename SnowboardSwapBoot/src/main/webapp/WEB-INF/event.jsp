<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Events/Meetups List</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<link rel="stylesheet" type="text/css" href="css/event.css">

<!-- Favicon -->
<link rel="icon" href="<c:url value='/resources/images/favicon.ico'/>"
	type="image/x-icon">

</head>

<jsp:include page="nav.jsp" />

<body>

	<main>

		<div class="container my-5">
			<h1 class="display-4 text-center mb-4">Events/Meetups List</h1>

			<!-- List of Events -->

			<c:forEach items="${allEvents}" var="event">

				<div class="event Card">
					<div class="image-cont">
						<c:if test="${not empty event.imageUrl}">
							<img class="event-image" src="<c:out value="${event.imageUrl}"/>"
								alt="Event Image">
						</c:if>
					</div>
					<div class="event-info">
						<c:if test="${not empty event.name}">
							<h3>
								<c:out value="${event.name}" />
							</h3>
						</c:if>









						<c:if test="${not empty event.description}">
							<div>
								<strong>Description:</strong>
								<c:out value="${event.description}" />
							</div>
						</c:if>

						<c:if test="${not empty event.eventStart}">
							<fmt:parseDate value="${event.eventStart}"
								pattern="yyyy-MM-dd'T'HH:mm" var="parsedStart" type="both" />
							<div>
								<strong>Start:</strong>
								<fmt:formatDate value="${parsedStart}"
									pattern="MMMM d, yyyy 'at' h:mm a" />
							</div>
						</c:if>
					</div>
					<c:if test="${not empty event.eventType}">
						<div>
							<strong>Type:</strong>
							<c:out value="${event.eventType.type}" />
						</div>
					</c:if>






					<!-- Display formatted event start and end dates, using parse and format -->
					<c:if test="${not empty event.eventStart}">
						<fmt:parseDate value="${event.eventStart}"
							pattern="yyyy-MM-dd'T'HH:mm" var="parsedStart" type="both" />
						<div>
							<strong>Start:</strong>
							<fmt:formatDate value="${parsedStart}"
								pattern="MMMM d, yyyy 'at' h:mm a" />
						</div>
					</c:if>

					<c:if test="${not empty event.eventEnd}">
						<fmt:parseDate value="${event.eventEnd}"
							pattern="yyyy-MM-dd'T'HH:mm" var="parsedEnd" type="both" />
						<div>
							<strong>End:</strong>
							<fmt:formatDate value="${parsedEnd}"
								pattern="MMMM d, yyyy 'at' h:mm a" />
						</div>
					</c:if>

					<c:if test="${not empty event.locationDescription}">
						<div>
							<strong>Location:</strong>
							<c:out value="${event.locationDescription}" />
						</div>
					</c:if>
				</div>

				<!-- Update and View Details buttons for each record -->

				<div class="mt-2">
					<c:if
						test="${sessionScope.loggedInUser ne null && loggedInUser.id eq event.sponsor.id}">
						<a href="updateEvent?eventId=${event.id}"
							class="btn btn-primary btn-sm">Update</a>
					</c:if>

					<a href="eventDetail?eventId=${event.id}"
						class="btn btn-secondary btn-sm">View Details</a>
				</div>
				</li>
			</c:forEach>
			</ul>
		</div>
		</div>

		<!-- Navigation Button to Add New Event -->
		<div class="text-center mt-4">
			<a href="addEvent" class="btn btn-outline-primary">Add New Event</a>
		</div>
		</div>
	</main>
	<!-- Bootstrap JS and dependencies -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>