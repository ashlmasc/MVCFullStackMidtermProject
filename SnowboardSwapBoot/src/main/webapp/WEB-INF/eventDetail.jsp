<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Event Detail</title>
</head>
<body>
    <jsp:include page="nav.jsp"/>

    <h1>Event Details</h1>
    
    <div>
        <h2>${event.name}</h2>
        <p>Description: ${event.description}</p>
        <p>Start: ${event.eventStart}</p>
        <p>End: ${event.eventEnd}</p>
        <!-- Add more event details here -->
    </div>
    
</body>
</html>