<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Update Event</title>
    <!-- Bootstrap CSS for styling -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <c:choose>
        <c:when test="${not empty param.success}">
            <h2>Update Successful</h2>
            <p>The event details have been successfully updated.</p>
            
        </c:when>
        <c:otherwise>
            <h2>Update Event</h2>
            <form action="updateEvent" method="post" >
            
            
                <!-- Hidden field for event ID -->
                <input type="hidden" name="eventId" value="${event.id}">
                
                <div class="form-group">
                    <label for="name">Event Name</label>
                    <input type="text" class="form-control" id="name" name="name" value="${event.name}" required>
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea class="form-control" id="description" name="description" rows="3">${event.description}</textarea>
                </div>
                
		 		<!-- Event Start Date/Time -->
		        <div class="form-group">
		            <label for="eventStart">Event Start Date and Time:</label>
		            <input type="datetime-local" class="form-control" id="eventStart" name="eventStart" required>
		        </div>
		
		        <!-- Event End Date/Time -->
		        <div class="form-group">
		            <label for="eventEnd">Event End Date and Time:</label>
		            <input type="datetime-local" class="form-control" id="eventEnd" name="eventEnd" required>
		        </div>
                
                <div class="form-group">
                    <label for="eventType">Event Type</label>
                    <select class="form-control" id="eventType" name="eventType" required>
                        <c:forEach items="${eventTypes}" var="type">
                            <option value="${type.id}" ${type.id == event.eventType.id ? 'selected' : ''}>${type.type}</option>
                        </c:forEach>
                    </select>
                </div>
                
                           <!-- Buttons for navigation -->
            <a href="home.do" class="btn btn-primary">Go Home</a>
            <a href="eventDetail?eventId=${param.eventId}" class="btn btn-secondary">View Event Details</a>
            <a href="event" class="btn btn-info">View All Events</a>
                
                <!-- Submit button with tooltip -->
                <button type="submit" class="btn btn-primary" data-toggle="tooltip" title="Click to update the event">Confirm Update</button>
                
                <!-- Cancel button -->
                <a href="event" class="btn btn-secondary" data-toggle="tooltip" title="Cancel and return to the list of events">Cancel</a>
            </form>
        </c:otherwise>
    </c:choose>
</div>

<!-- Bootstrap JS, Popper.js, and jQuery for tooltips -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
    $(function () {
        $('[data-toggle="tooltip"]').tooltip(); // Initialize tooltips
    });
</script>

</body>
</html>