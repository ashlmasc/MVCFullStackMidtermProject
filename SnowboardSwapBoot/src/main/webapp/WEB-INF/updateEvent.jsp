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
                
                <!-- Hidden field for event type ID -->
				<input type="hidden" name="eventTypeId" value="${event.eventType.id}">
                
                
                <div class="form-group">
                    <label for="name">Event Name</label>
                    <input type="text" class="form-control" id="name" name="name" value="${event.name}" required>
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea class="form-control" id="description" name="description" rows="3">${event.description}</textarea>
                </div>
                
		 		<!-- Display formatted event start and end dates, using parse and format -->
				<c:if test="${not empty event.eventStart}">
				    <fmt:parseDate value="${event.eventStart}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedStart" type="both"/>
				    <div class="form-group">
				        <label for="start">Start:</label>
				        <input type="datetime-local" id="start" name="start" class="form-control" value="<fmt:formatDate value="${parsedStart}" pattern="yyyy-MM-dd'T'HH:mm" />">
				    </div>
				</c:if>
				
				<c:if test="${not empty event.eventEnd}">
				    <fmt:parseDate value="${event.eventEnd}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedEnd" type="both"/>
				    <div class="form-group">
				        <label for="end">End:</label>
				        <input type="datetime-local" id="end" name="end" class="form-control" value="<fmt:formatDate value="${parsedEnd}" pattern="yyyy-MM-dd'T'HH:mm" />">
				    </div>
				</c:if>
								                
                <div class="form-group">
                    <label for="eventType">Event Type</label>
                    <select class="form-control" id="eventType" name="eventType" required>
                        <c:forEach items="${eventTypes}" var="type">
                            <option value="${type.id}" ${type.id == event.eventType.id ? 'selected' : ''}>${type.type}</option>
                        </c:forEach>
                    </select>
                </div>
                
                 <!-- Location Description -->
                <div class="form-group">
                    <label for="locationDescription">Location Description</label>
                    <input type="text" class="form-control" id="locationDescription" name="locationDescription" value="${event.locationDescription}">
                </div>
                <!-- Image URL -->
                <div class="form-group">
                    <label for="imageUrl">Image URL</label>
                    <input type="text" class="form-control" id="imageUrl" name="imageUrl" value="${event.imageUrl}">
                </div>
                
                <!-- Address (Street, City, State, Postal Code, Phone Number) -->
                <div class="form-group">
                    <label for="street">Street</label>
                    <input type="text" class="form-control" id="street" name="street" value="${event.address.street}" required>
                </div>
                <div class="form-group">
                    <label for="city">City</label>
                    <input type="text" class="form-control" id="city" name="city" value="${event.address.city}" required>
                </div>
                <div class="form-group">
                    <label for="state">State</label>
                    <input type="text" class="form-control" id="state" name="state" value="${event.address.state}" required>
                </div>
                <div class="form-group">
                    <label for="postalCode">Postal Code</label>
                    <input type="text" class="form-control" id="postalCode" name="postalCode" value="${event.address.postalCode}">
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Phone Number</label>
                    <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="${event.address.phoneNumber}">
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