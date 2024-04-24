<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<link rel="stylesheet" type="text/css" href="css/site.css">

<!-- Favicon -->
<link rel="icon" href="<c:url value='/resources/images/favicon.ico'/>"
	type="image/x-icon">

<!-- need to move to site.css for uniformity; need this to limit size of image to fit within event list box -->
<style>
  .event-image {
    max-width: 100%; /* Limit image width to 100% of its parent container */
    height: auto; /* Keep the aspect ratio of the image */
    display: block; /* Display block to prevent unwanted margins */
    margin: 0 auto; /* Center align the image */
    border-radius: 5px; /* Optional: adds rounded corners to the image */
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15); /* Optional: adds shadow for a bit of depth */
  }
</style>

</head>

<jsp:include page="nav.jsp" />

<body>

	<main>

		<div class="container my-5">
			<h1 class="display-4 text-center mb-4">Events/Meetups List</h1>

			<!-- List of Events -->
			<div class="row">
				<div class="col-md-12">
					<ul class="list-group">
						<c:forEach items="${allEvents}" var="event">
							<li class="list-group-item">
								
								<c:if test="${not empty event.name}">
				                 	<div><strong>Name:</strong> <c:out value="${event.name}" /></div>
				                </c:if>
								
								<c:if test="${not empty event.eventType}">
                  					<div><strong>Type:</strong> <c:out value="${event.eventType.type}" /></div>
                				</c:if>	
                					
								<!-- 	not sure if we want displayed, but at least for testing -->
								<div>
									<strong>Event ID:</strong> ${event.id}
								</div>
									
								<c:if test="${not empty event.description}">
					            	<div><strong>Description:</strong> <c:out value="${event.description}" /></div>
					            </c:if>				
									
								<!-- Display formatted event start and end dates, using parse and format -->
								<c:if test="${not empty event.eventStart}">
									<fmt:parseDate value="${event.eventStart}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedStart" type="both" />
									<div>
										<strong>Start:</strong>
										<fmt:formatDate value="${parsedStart}" pattern="MMMM d, yyyy 'at' h:mm a" />
									</div>
								</c:if>

								<c:if test="${not empty event.eventEnd}">
									<fmt:parseDate value="${event.eventEnd}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedEnd" type="both" />
									<div>
										<strong>End:</strong>
										<fmt:formatDate value="${parsedEnd}" pattern="MMMM d, yyyy 'at' h:mm a" />
									</div>
								</c:if>
								
								<c:if test="${not empty event.locationDescription}">
                  					<div><strong>Location:</strong> <c:out value="${event.locationDescription}" /></div>
                				</c:if>

								<c:if test="${not empty event.active}">
                  					<div><strong>Active:</strong> ${event.active ? 'Yes' : 'No'} </div>
                				</c:if>

                				<c:if test="${not empty event.imageUrl}">
  									<div><strong>Image:</strong> <img class="event-image" src="<c:out value="${event.imageUrl}"/>" alt="Event Image"></div>
								</c:if>

								<!-- Update and View Details buttons for each record -->

								<div class="mt-2">
									<c:if
										test="${sessionScope.loggedInUser ne null && loggedInUser.id eq event.sponsor.id}">
										<a href="updateEvent?eventId=${event.id}" class="btn btn-primary btn-sm">Update</a>
									</c:if>

									<a href="eventDetail?eventId=${event.id}" class="btn btn-secondary btn-sm">View Details</a>
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
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>