<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<title>User Profile</title>
</head>
<body>
	<%--Edit the file nav.jsp to change nav links --%>
	<jsp:include page="nav.jsp" />

	<h1>
		Welcome,
		<c:out value="${loggedInUser.username}" />
		!
	</h1>
	<p>Your details are below:</p>

	<div class="container">
    <div class="form-container">
        <h2></h2>
        <form id="updateProfile" action="updateProfile.do?=${loggedInUser}" method="POST">
            <label for="username">User Name:</label>
            <input type="text" id="userName" name="userName" value="${loggedInUser.username}"/>
          <%--   <label for="logDate">Date of Log Entry:</label>
            <input type="text" id="logDate" name="logDate" value="${healthLog.logDate}"/>
            <label for="totalSteps">Total Steps:</label>
            <input type="text" id="totalSteps" name="totalSteps" value="${healthLog.totalSteps}"/>
            <label for="sleepMinutes">Sleep in Minutes:</label>
            <input type="text" id="sleepMinutes" name="sleepMinutes" value="${healthLog.sleepMinutes}"/>
            <label for="waterOunces">Ounces of Water:</label>
            <input type="text" id="waterOunces" name="waterOunces"value="${healthLog.waterOunces}" />
            <label for="mood">Mood:</label>
            <input type="text" id="mood" name="mood" value="${healthLog.mood}"/> --%>
            <input type="submit" value= "Update">
        </form>
    </div>
<div>


	Add more user details as needed

	<a href="logout.do">Logout</a>
</body>
</html>