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

		${resort.name}
		<a href="${resort.website}">To Website</a>
		<p>${resort.address.street}</p>
		<p>${resort.address.city}</p>
		<p>${resort.address.state}</p>
		<p>${resort.address.state}</p>
		<p>${resort.address.postalCode}</p>
		<p>${resort.address.postalCode}</p>
		<p>${resort.address.phoneNumber}</p>
	
		<a
			href="https://www.google.com/maps/search/?api=1&query=${resort.getMapURL()}">Map
			Lgreink</a>

		<c:forEach var="trail" items="${resort.trails}">

			<p>${trail.name}</p>
			<p></p>
		</c:forEach>


	</main>
	<footer></footer>
</body>
</html>