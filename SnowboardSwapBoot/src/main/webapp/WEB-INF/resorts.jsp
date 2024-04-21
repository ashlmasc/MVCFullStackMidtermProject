<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
  
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Log In</title>
</head>
<body>
<%--Edit the file nav.jsp to change nav links --%>
<jsp:include page="nav.jsp"/>


<c:forEach var="resort" items="${resorts}">
	
	<a href="resort?id=${resort.id}">Link to resort info</a>
	<p>${resort.name}</p>
	<p>${resort.address.street}</p>
	<p>${resort.address.city}</p>
	<p>${resort.address.state}</p>
	<p>${resort.address.state}</p>
	<p>${resort.address.postalCode}</p>
	<p>${resort.address.postalCode}</p>
	<p>${resort.address.phoneNumber}</p>
	<p>${resort.getMapURL()}</p>

</c:forEach>

</body>
</html>