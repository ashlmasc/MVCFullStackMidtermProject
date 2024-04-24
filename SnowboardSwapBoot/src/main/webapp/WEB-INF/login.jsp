<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  --%>
  
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<!-- <title>Log In</title> -->

<!-- <link -->
<!-- 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" -->
<!-- 	rel="stylesheet" -->
<!-- 	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" -->
<!-- 	crossorigin="anonymous"> -->

<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"> -->

<!-- <link rel="stylesheet" type="text/css" href="css/site.css"> -->

<!-- </head> -->
<!-- <body> -->
<%-- <%--Edit the file nav.jsp to change nav links --%> 
<%-- <jsp:include page="nav.jsp"/> --%>

<!-- <h2>Log In</h2> -->
<!-- <form action="login.do" method="post"> -->
<%-- 	<%-- Error messages --%>
<!-- 	<input type="text" name="userName" value="admin"> -->
<!-- 	<input type="password" name="password" value="sspass"/> -->
<!-- 	<input type="submit" value="Log In" >  -->
<!-- </form> -->
<!-- </body> -->
<!-- </html> -->

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Log In</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-signin {
            max-width: 400px;
            padding: 15px;
            margin: auto;
        }
    </style>
</head>
<body>

<jsp:include page="nav.jsp" />

<div class="container">
    <form class="form-signin" action="login.do" method="post">
        <h2 class="form-signin-heading">Please sign in</h2>
        
        <%-- Display error message if present --%>
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger" role="alert">
                <c:out value="${errorMessage}" />
            </div>
        </c:if>
        
        <label for="inputUsername" class="sr-only">Username</label>
        <input type="text" id="inputUsername" class="form-control" placeholder="Username" name="userName" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="password" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
    </form>
</div> <!-- /container -->

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>