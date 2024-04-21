<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Account Registration</title>
</head>
<body>
    <div class="nav-bar">
        <%-- Dynamic include for the navigation bar --%>
        <jsp:include page="nav.jsp"/>
    </div>

    <h1 class="page-header">Register Page</h1>
    <div class="container">
        <div class="image-container">
            <p>Pictures of other users at events posted on our site</p>
            <%-- Placeholder for images --%>
            <img src="path_to_image.jpg" alt="Event Image" />
        </div>
        
        <div class="form-container">
            <h2>Register Page and Rules to join</h2>
            <form action="register.do" method="post">
                <input type="text" name="firstName" placeholder="First Name" required>
                <input type="text" name="lastName" placeholder="Last Name" required>
                <input type="email" name="email" placeholder="Email" required>
                <input type="text" name="username" placeholder="Username" required>
                <input type="password" name="password" placeholder="Password" required>
                <input type="text" name="cityLocation" placeholder="City/Location">
                <button type="submit">Register/Submit</button>
            </form>
        </div>

        <div class="image-container">
            <p>Picture of users having fun on the mountain together</p>
            <%-- Placeholder for images --%>
            <img src="path_to_another_image.jpg" alt="Fun Mountain Image" />
        </div>
    </div>
</body>
</html>