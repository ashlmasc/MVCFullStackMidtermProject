<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%-- 	pageEncoding="UTF-8"%> --%>
<%-- <%@ taglib prefix="c" uri="jakarta.tags.core"%> --%>

<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <title>User Profile</title> -->
<!-- </head> -->
<!-- <body> -->
<%-- 	<%--Edit the file nav.jsp to change nav links --%> 
<%-- 	<jsp:include page="nav.jsp" /> --%>

<!-- 	<h1> -->
<!-- 		Welcome, -->
<%-- 		<c:out value="${loggedInUser.username}" /> --%>
<!-- 		! -->
<!-- 	</h1> -->
<!-- 	<p>Your details are below:</p> -->

<!-- 	<div class="container"> -->
<!--     <div class="form-container"> -->
<!--         <h2></h2> -->
<%--         <form id="updateProfile" action="updateProfile.do?=${loggedInUser}" method="POST"> --%>
<!--             <label for="username">User Name:</label> -->
<%--             <input type="text" id="userName" name="userName" value="${loggedInUser.username}"/> --%>
<%--             <label for="logDate">Date of Log Entry:</label>
<%--             <input type="text" id="logDate" name="logDate" value="${healthLog.logDate}"/> --%>
<%--             <label for="totalSteps">Total Steps:</label> --%>
<%--             <input type="text" id="totalSteps" name="totalSteps" value="${healthLog.totalSteps}"/> --%>
<%--             <label for="sleepMinutes">Sleep in Minutes:</label> --%>
<%--             <input type="text" id="sleepMinutes" name="sleepMinutes" value="${healthLog.sleepMinutes}"/> --%>
<%--             <label for="waterOunces">Ounces of Water:</label> --%>
<%--             <input type="text" id="waterOunces" name="waterOunces"value="${healthLog.waterOunces}" /> --%>
<%--             <label for="mood">Mood:</label> --%>
<%--             <input type="text" id="mood" name="mood" value="${healthLog.mood}"/> --%> 
<!--             <input type="submit" value= "Update"> -->
<!--         </form> -->
<!--     </div> -->
<!-- <div> -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    <!-- Bootstrap CSS for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons for icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>

    <!-- Include your navigation bar here -->
    <jsp:include page="nav.jsp" />

    <div class="container mt-4">
        <h1>Profile Details</h1>
        <div class="mb-3">
            <label class="form-label"><strong>First Name:</strong></label>
            <p>${loggedInUser.firstName}</p>
        </div>

        <div class="mb-3">
            <label class="form-label"><strong>Last Name:</strong></label>
            <p>${loggedInUser.lastName}</p>
        </div>

        <div class="mb-3">
            <label class="form-label"><strong>Bio:</strong></label>
            <p>${loggedInUser.bio}</p>
        </div>

        <div class="mb-3">
            <label class="form-label"><strong>Image URL:</strong></label>
            <p>${loggedInUser.imageUrl}</p>
        </div>

        <a href="editProfile.jsp" class="btn btn-primary" role="button">Edit Profile</a>
    </div>

    <!-- Bootstrap JS and Popper.js, including jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
