<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Events/Meetups List</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Favicon -->
    <link rel="icon" href="<c:url value='/resources/images/favicon.ico'/>" type="image/x-icon">
</head>
<body>

<div class="container my-5">
    <h1 class="display-4 text-center mb-4">Events/Meetups List</h1>

    <!-- List of Events -->
    <div class="row">
        <div class="col-md-12">
            <ul class="list-group">
                <c:forEach items="${allEvents}" var="event">
                    <li class="list-group-item">
                        <div><strong>Name:</strong> ${event.name}</div>
                        <div><strong>Description:</strong> ${event.description}</div>
                        <!-- Display formatted event start and end dates, using parse and format -->
			            <c:if test="${not empty event.eventStart}">
			                <fmt:parseDate value="${event.eventStart}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedStart" type="both"/>
			                <div>Start: <fmt:formatDate value="${parsedStart}" pattern="yyyy-MM-dd HH:mm:ss" /></div>
			            </c:if>
			            
			            <c:if test="${not empty event.eventEnd}">
			                <fmt:parseDate value="${event.eventEnd}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedEnd" type="both"/>
			                <div>End: <fmt:formatDate value="${parsedEnd}" pattern="yyyy-MM-dd HH:mm:ss" /></div>
			            </c:if>
			            
                        <div><strong>Location:</strong> ${event.locationDescription}</div>
                        <div><strong>Type:</strong> ${event.eventType.type}</div>
                        <div><strong>Active:</strong> ${event.active ? 'Yes' : 'No'}</div>
                        
                        <!-- Update and View Details buttons for each record -->
                        <div class="mt-2">
                            <a href="updateEvent?eventId=${event.id}" class="btn btn-primary btn-sm">Update</a>
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

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>