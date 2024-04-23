<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
  
!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ride Share</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="nav.jsp"/>

    <h1>Ride Share Page/Message Board</h1>
    <dialog> <p>This is a message box.</p> </dialog>

    <section>
        <h2>Rules of Ride Share to Participate</h2>
        <p>Details about participation rules...</p>
    </section>
    
    <section>
        <h2>Message Board</h2>
        <p>People can post looking for a ride or offering a ride...</p>
        
        <div class="container mt-5">
    <h2 class="display-4 text-center mb-4">Add New Ride Share</h2>
    <form action="createRideShare.do" method="post" enctype="multipart/form-data">
    	
    	<!-- User id -->
    	<input type="hidden" name="rideId" value="${rideId}">
    
        <!-- Event Name -->
        <div class="form-group">
            <label for="username">Driver: </label>
            <input type="text" class="form-control" id="username" name="username" placeholder="Enter username" required>
        </div>

        <!-- Description -->
        <div class="form-group">
            <label for="departureAddress">Departure Address:</label>
            <textarea class="form-control" id="departureAddress" name="departureAddress" placeholder="Departure address" required></textarea>
        </div>
        <div class="form-group">
            <label for="arrivalAddress">Arrival Address:</label>
            <textarea class="form-control" id="arrivalAddress" name="arrivalAddress" placeholder="Arrival address" required></textarea>
        </div>
        <div class="form-group">
            <label for="resort">Resort:</label>
            <textarea class="form-control" id="resort" name="resort" placeholder="Resort" required></textarea>
        </div>
        
        <div class="form-group">
            <label for="detail">Details:</label>
            <textarea class="form-control" id="detail" name="detail" placeholder="Details" required></textarea>
        </div>
        
        <div class="form-group">
            <label for="departure">Departure date and time:</label>
            <textarea id="departure" name="departure" placeholder="Departure date and time" pattern="yyyy-MM-dd HH:mm:ss" required></textarea>
            
        </div>
        
        
            <input type="submit" value="Create Ride Share" />
        </form>
        
        <form action="joinRideShare.do" method="post">
            <!-- Form inputs for joining a ride share -->
            <input type="submit" value="Join Ride Share" />
        </form>
    </section>
      <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>