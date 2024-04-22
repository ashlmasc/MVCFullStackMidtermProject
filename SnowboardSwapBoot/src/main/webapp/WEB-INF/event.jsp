<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
  
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Events/Meetups</title>
</head>
<body>
    <jsp:include page="nav.jsp"/>

    <h1>Events/Meetups Page</h1>
    
    <div>
        <h2>Featured Upcoming Events</h2>
        <c:forEach var="event" items="${upcomingEvents}">
            <p>${event.name}</p> <!-- just an example of possible mapping -->
            <!-- Add more details as needed -->
        </c:forEach>
    </div>
    
    <!-- This form allows you to enter an event ID and submit it to the server -->
		<form action="eventDetail" method="get">
		    <input type="text" name="eventId" placeholder="Enter event ID">
		    <input type="submit" value="View Details">
		</form>
    
    <div>
    <!-- just an example of showing the list of events and meetups -->
        <h2>List of All Events and Meetups</h2>
        <c:forEach var="event" items="${allEvents}">
            <div>
                <p>${event.name}</p>
                <a href="eventDetail?eventId=${event.id}">View Details</a>
                <!-- Add more details and actions as needed; just an example of basic buttons based off wireframe -->
<!--                 <button>Create event/meetup</button> -->
<!--                 <button>Interested</button> -->
<!--                 <button>Not Interested</button> -->
<!--                 <button>Going</button> -->
<!--                 <button>Not Going</button> -->
            </div>
        </c:forEach>
    </div>
    
</body>
</html>