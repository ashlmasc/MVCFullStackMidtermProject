<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Log In</title>
</head>
<body>
<%--Edit the file nav.jsp to change nav links --%>
<jsp:include page="nav.jsp"/>

<h2>Log In</h2>
<form action="login.do" method="post">
	<%-- Error messages --%>
	<input type="text" name="userName" value="admin">
	<input type="password" name="password" value="sspass"/>
	<input type="submit" value="Log In" > 
</form>
</body>
</html>