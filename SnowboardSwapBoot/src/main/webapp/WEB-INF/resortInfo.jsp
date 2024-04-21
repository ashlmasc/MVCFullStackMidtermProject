<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Log In</title>
</head>
<body>
<%--Edit the file nav.jsp to change nav links --%>
<jsp:include page="nav.jsp"/>

	${resort.name}
	<a href="${resort.website}">To Website</a>
	<p>${resort.address.street}</p>
	<p>${resort.address.city}</p>
	<p>${resort.address.state}</p>
	<p>${resort.address.state}</p>
	<p>${resort.address.postalCode}</p>
	<p>${resort.address.postalCode}</p>
	<p>${resort.address.phoneNumber}</p>
	<a href="https://www.google.com/maps/@?api=1&map_action=map&query=${resort.getMapURL()}">Map Link</a>
	<a href="https://www.google.com/maps/search/?api=1&query=${resort.getMapURL()}">Map Lgreink</a>

	

</body>
</html>