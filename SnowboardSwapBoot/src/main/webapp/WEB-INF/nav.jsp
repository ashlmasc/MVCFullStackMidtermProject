<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="home.do">Home</a>
<jsp:include page="nav.jsp">


<!-- Check if a user is logged in -->

<%-- <c:choose>
<c:when test="${empty sessionScope.loggedInUser}"></c:when>

</c:choose> --%>

</body>
</html>