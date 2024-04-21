<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
</head>
<body>
    <h1>Welcome, <c:out value="${loggedInUser.username}"/>!</h1>
    <p>Your details are below:</p>
    <!-- Add more user details as needed -->
    
    <a href="logout.do">Logout</a>
</body>
</html>