<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  --%>
  
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<!-- <title>Account Registration</title> -->
<!-- </head> -->
<!-- <body> -->
<!--     <div class="nav-bar"> -->
<!--         Dynamic include for the navigation bar -->
<%--         <jsp:include page="nav.jsp"/> --%>
<!--     </div> -->

<!--     <h1 class="page-header">Register Page</h1> -->
<!--     <div class="container"> -->
<!--         <div class="image-container"> -->
<!--             <p>Pictures of other users at events posted on our site</p> -->
<!--             Placeholder for images -->
<!--             <img src="path_to_image.jpg" alt="Event Image" /> -->
<!--         </div> -->
        
<!--         <div class="form-container"> -->
<!--             <h2>Register Page and Rules to join</h2> -->
<!--             <form action="register.do" method="post"> -->
<!--                 <input type="text" name="firstName" placeholder="First Name" required> -->
<!--                 <input type="text" name="lastName" placeholder="Last Name" required> -->
<!--                 <input type="text" name="username" placeholder="Username" required> -->
<!--                 <input type="password" name="password" placeholder="Password" required> -->
<!--                 <input type="text" name="city" placeholder="City"> -->
<!--                 <button type="submit">Register/Submit</button> -->
<!--             </form> -->
<!--         </div> -->

<!--         <div class="image-container"> -->
<!--             <p>Picture of users having fun on the mountain together</p> -->
<!--             Placeholder for images -->
<!--             <img src="path_to_another_image.jpg" alt="Fun Mountain Image" /> -->
<!--         </div> -->
<!--     </div> -->
<!-- </body> -->
<!-- </html> -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
  
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Account Registration</title>
    
	<!--     Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="nav-bar">
        Dynamic include for the navigation bar
        <jsp:include page="nav.jsp"/>
    </div>

    <h1 class="page-header">Register Page</h1>
    <div class="container">
        <div class="image-container">

<!--  Placeholder for images -->
            <img src="path_to_image.jpg" alt="Event Image" />
        </div>
        
        <div class="form-container">
            <h2>Register Page and Rules to join</h2>
            <form action="register.do" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" name="firstName" placeholder="First Name" required>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="lastName" placeholder="Last Name" required>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="username" placeholder="Username" required>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="password" placeholder="Password" required>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="city" placeholder="City">
                </div>
                <button type="submit" class="btn btn-primary">Register/Submit</button>
            </form>
        </div>

        <div class="image-container">
        
<!--             Placeholder for images -->
            <img src="path_to_another_image.jpg" alt="Fun Mountain Image" />
        </div>
    </div>

    Bootstrap JS, Popper.js, and jQuery for tooltips
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>