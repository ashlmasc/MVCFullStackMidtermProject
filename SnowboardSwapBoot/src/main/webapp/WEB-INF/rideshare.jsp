<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
  
!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ride Share</title>
</head>
<body>
    <jsp:include page="nav.jsp"/>

    <h1>Ride Share Page/Message Board</h1>

    <section>
        <h2>Rules of Ride Share to Participate</h2>
        <p>Details about participation rules...</p>
    </section>
    
    <section>
        <h2>Message Board</h2>
        <p>People can post looking for a ride or offering a ride...</p>
        <form action="createRideShare.do" method="post">
            <!-- Form inputs for creating a ride share -->
            <input type="submit" value="Create Ride Share" />
        </form>
        <form action="joinRideShare.do" method="post">
            <!-- Form inputs for joining a ride share -->
            <input type="submit" value="Join Ride Share" />
        </form>
    </section>
</body>
</html>