<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
  
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ride Share</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="nav.jsp"/>
    
    <style>
    body {
        font: 12px Arial, Tahoma, Helvetica, FreeSans, sans-serif;
        text-transform: inherit;
        color: #333;
        background: #e7edee;
        width: 100%;
    }
    .wrap {
        width: 720px;
        margin: 15px auto;
        padding: 15px 10px;
        background: white;
        border: 2px solid #DBDBDB;
        border-radius: 5px;
    }
    .title, .userName {
        font-weight: 700;
    }
    .post {
        border-bottom: 1px solid black;
        padding-bottom: 5px;
    }
    .post .title {
        font-style: italic;
    }
    .post .body {
        margin-top: 5px;
    }
    </style>

    <h1>Ride Share Page/Message Board</h1>
    <section>
        <h2>Rules of Ride Share to Participate</h2>
        <p>Details about participation rules...</p>
    </section>
    
    <section>
        <h2>Message Board</h2>
        
        <div class="wrap"> 
            <div>
                <h1 class="title">Filters</h1>
                <div class="byUser">
                    <span class="title">All posts by User:</span>
                    <select id="selUser">
                        <option value="0">All</option>
                    </select>
                    <button type="button" onclick="searchUser()">Search</button>
                </div>
            </div>
        </div>

        <div class="wrap">
            <div>
                <h1 class="title">Posts</h1>
            </div>
            <p class="reply">
                <div class="container">
                    <div class="form-container">
                        <br>
                        <br>
                        <br>
                        <h2><b>New Post!</b></h2>
                        <div>
                            <table>
                                <tr>
                                    <th>Post ID:</th>
                                    <td>${ride.id}</td>
                                </tr>
                                <tr>
                                    <th>Post Created:</th>
                                    <td>${ride.createdAt}</td>
                                </tr>
                                <tr>
                                    <th>Post Updated:</th>
                                    <td>${ride.updatedAt}</td>
                                </tr>
                                <tr>
                                    <th>Departure Date and Time:</th>
                                    <td>${ride.departure}</td>
                                </tr>
                                <tr>
                                    <th>Driver:</th>
                                    <td>${ride.username}</td>
                                </tr>
                                <tr>
                                    <th>Departure Address:</th>
                                    <td>${ride.departureAddress}</td>
                                </tr>
                                <tr>
                                    <th>Arrival Address:</th>
                                    <td>${ride.arrivalAddress}</td>
                                </tr>
                                <tr>
                                    <th>Resort Destination:</th>
                                    <td>${ride.resort}</td>
                                </tr>
                                <tr>
                                    <th>Vehicle Capacity:</th>
                                    <td>${ride.vehicleCapacity}</td>
                                </tr>
                                <tr>
                                    <th>Vehicle Make:</th>
                                    <td>${ride.vehicleMake}</td>
                                </tr>
                                <tr>
                                    <th>Vehicle Model:</th>
                                    <td>${ride.vehicleModel}</td>
                                </tr>
                                <tr>
                                    <th>Active:</th>
                                    <td>${ride.active}</td>
                                </tr>
                                <tr>
                                    <td>
                                        <form action="deleteRideShare.do" onsubmit="return window.confirm('Are you sure you want to delete this log?');" method="POST">
                                            <div class="form-group">
                                                <input type="hidden" class="form-control" id="id" name="id" value="<c:out value='${ride.id}' />">
                                            </div>
                                            <button type="submit" class="btn btn-danger">Delete Entry</button>
                                        </form>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </p>
        </div>
        
        <p>People can post looking for a ride or offering a ride...</p>
        
        <div class="container mt-5">
            <h2 class="display-4 text-center mb-4">Post New Ride Share</h2>
            <form action="rideshare" method="post" enctype="multipart/form-data">
                <!-- User id -->
                <input type="hidden" name="sponsorid" value="1">
                <input type="hidden" name="resortid" value="1">
            
                <div class="form-group">
                    <label for="departure">Departure date and time:</label>
                    <input type="datetime-local" id="departure" name="departure" required>
                </div>

                <div class="form-group">
                    <label for="departureAddress">Departure Address:</label>
                    <input type="text" name="street1">
                    <input type="text" name="city1">
                    <input type="text" name="state1">
                </div>

                <div class="form-group">
                    <label for="arrivalAddress">Arrival Address:</label>
  					 <input type="text" name="street2">
                    <input type="text" name="city2">
                    <input type="text" name="state2">
                </div>
                
                <div class="form-group">
                    <label for="detail">Details:</label>
                    <textarea class="form-control" id="detail" name="detail" placeholder="Details" required></textarea>
                </div>
                
                <div class="form-group">
                    <label for="vehicleCapacity">Vehicle capacity:</label>
                    <input type="number" class="form-control" id="vehicleCapacity" name="vehicleCapacity" placeholder="Capacity of vehicle" required>
                </div>
                
                <div class="form-group">
                    <label for="vehicleMake">Vehicle make:</label>
                    <input type="text" class="form-control" id="vehicleMake" name="vehicleMake" placeholder="Make of vehicle" required>
                </div>
                
                <div class="form-group">
                    <label for="vehicleModel">Vehicle model:</label>
                    <input type="text" class="form-control" id="vehicleModel" name="vehicleModel" placeholder="Model of vehicle" required>
                </div>
                
                <input type="submit" value="Post New Ride Share" class="btn btn-primary">
            </form>
        </div>
        
        <form action="joinRideShare.do" method="post">
            <!-- Form inputs for joining a ride share -->
            <input type="submit" value="Join Ride Share" class="btn btn-primary">
        </form>
    </section>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
