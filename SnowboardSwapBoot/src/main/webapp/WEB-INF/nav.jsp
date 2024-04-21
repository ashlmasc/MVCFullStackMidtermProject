<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<nav>

<a href="home.do">Home</a>
<c:if test="${sessionScope.loggedInUser ne null }">
		<a href="account.do">Account</a>
		<a href="logout.do">Logout</a>
	</c:if>
	
	<c:if test="${sessionScope.loggedInUser eq null}">
		<a href="login.do">Login</a>
	</c:if>
</nav>

<!-- Check if a user is logged in -->

<%-- <c:choose> --%>
<%-- <c:when test="${empty sessionScope.loggedInUser}"></c:when> --%>
<%-- </c:choose>  --%>
