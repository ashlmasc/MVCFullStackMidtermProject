<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Details</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	
<link rel="stylesheet" type="text/css" href="css/eventDetail.css">

</head>
<header></header>

<jsp:include page="nav.jsp" />

<main>
	<body>
	
		<div>
		
		</div>
	
	
	
	
		<div class="container mt-5">
			<c:if test="${not empty event}">
				<h1 class="display-4 text-center mb-4">${event.name}Details</h1>
				<p>
					<strong>Event ID:</strong> ${event.id}
				</p>
				<p>
					<strong>Description:</strong> ${event.description}
				</p>

				<!-- Display formatted event start and end dates, using parse and format -->
				<c:if test="${not empty event.eventStart}">
					<fmt:parseDate value="${event.eventStart}"
						pattern="yyyy-MM-dd'T'HH:mm" var="parsedStart" type="both" />
					<div>
						Start:
						<fmt:formatDate value="${parsedStart}"
							pattern="yyyy-MM-dd HH:mm:ss" />
					</div>
				</c:if>

				<c:if test="${not empty event.eventEnd}">
					<fmt:parseDate value="${event.eventEnd}"
						pattern="yyyy-MM-dd'T'HH:mm" var="parsedEnd" type="both" />
					<div>
						End:
						<fmt:formatDate value="${parsedEnd}" pattern="yyyy-MM-dd HH:mm:ss" />
					</div>
				</c:if>

				<p>
					<strong>Location Description:</strong> ${event.locationDescription}
				</p>
				<p>
					<strong>Event Type:</strong> ${event.eventType.type}
				</p>
				<p>
					<strong>Address:</strong> ${event.address.street},
					${event.address.city}, ${event.address.state}
					${event.address.postalCode}
				</p>
				<%--             <p><strong>Created At:</strong> <c:if test="${not empty event.createdAt}">${event.createdAt.format(java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))}</c:if></p> --%>
				<%--             <p><strong>Updated At:</strong> <c:if test="${not empty event.updatedAt}">${event.updatedAt.format(java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))}</c:if></p> --%>
				<p>
					<strong>Active:</strong> ${event.active ? 'Yes' : 'No'}
				</p>
				<p>
					<strong>Image:</strong>
					<c:if test="${not empty event.imageUrl}">
						<img src="${event.imageUrl}" alt="Event Image"
							style="width: 300px;" />
					</c:if>
				</p>

				<!-- List of attendees -->
				<p>
					<strong>Attendees:</strong>
				</p>
				<ul>
					<c:forEach items="${event.eventAttendees}" var="attendee">
						<li>${attendee.firstName}${attendee.lastName}</li>
					</c:forEach>
				</ul>

				<!-- Update, Delete, and Return Links -->

				<div class="text-center mt-4">
					<c:if
						test="${sessionScope.loggedInUser ne null && loggedInUser.id eq event.sponsor.id}">

						<a href="updateEvent?eventId=${event.id}" class="btn btn-primary">Update
							Event</a>
					</c:if>

					<a href="event" class="btn btn-secondary">Return to List</a>
					<form action="deleteEvent" method="post"
						onsubmit="return confirm('Are you sure you want to delete this event?');"
						style="display: inline-block;">
						<input type="hidden" name="eventId" value="${event.id}">
						<input type="submit" value="Delete Event" class="btn btn-danger">
					</form>
				</div>
			</c:if>

		</div>
</main>

<footer></footer>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>