<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
</head>
<body>
    <h1>Error Occurred</h1>
    <h3>${message}</h3>
    <p>Details:</p>
    <pre>${exception.stackTrace}</pre> <!-- Displaying stack trace for debugging; remove for production!!!!!! -->
</body>
</html>