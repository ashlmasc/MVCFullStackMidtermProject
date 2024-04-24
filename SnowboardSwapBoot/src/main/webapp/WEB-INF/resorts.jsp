<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Resorts</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" type="text/css" href="css/resorts.css">

</head>
<body>

	<header> </header>
	<jsp:include page="nav.jsp" />

	<main>
		<c:if test="${sessionScope.loggedInUser ne null }">
			<button class="btn btn-primary" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#addResortForm"
				aria-controls="offcanvasWithBothOptions">Add new resort</button>

			<jsp:include page="resort/resortAddForm.jsp" />

		</c:if>

		<div class="section">
			<div class="resortsContainer siteWidthWrapper">
				<c:forEach var="resort" items="${resorts}">

					<div class="card resort-card" style="width: 18rem;">
						<div class="imgCont">
							<img src="${resort.imageUrl}" class="card-img-top" alt="...">
						</div>
						<div class="card-body">
							<h5 class="card-title">${resort.name}</h5>
							<p class="card-text limit-text">${resort.description}</p>
							<a href="resort?id=${resort.id}" class="btn btn-primary">More
								Info</a>
						</div>
					</div>
					
				</c:forEach>
			</div>
		</div>
	</main>
	<footer> 
	</footer>
</body>
</html>