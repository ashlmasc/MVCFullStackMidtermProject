<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	href="https://www.cssportal.com/css-color-converter/00B3BA"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/editrideshare.css">
	<jsp:include page="nav.jsp" />
</head>
<body>
<h1>Edit Current Ride Share</h1>
	    	<div class="transbox">
	    
            <form action="updateRideShare" method="post" enctype="multipart/form-data">
                <!-- User id -->
                
                				<input type="hidden" name="sponsorid" value="1"> 
                				<input type="hidden" name="resortid" value="1"> 
            
                <div class="form-group">
                    <label for="id">Post Id:</label><br>
                    <input value="${ride.id}" type="text" id="id" name="id" readonly required>
                </div>
                <div class="form-group">
                    <label for="departure">Departure date and time:</label><br>
                    <input value="${ride.departure}" type="datetime-local" id="departure" name="departure" required>
                </div>
                
                <div class="form-group">
                    <label for="detail">Details:</label><br>
                    <input value="${ride.detail}" type="text" id="detail" name="detail" required>

                </div>
                
                <div class="form-group">
                    <label for="vehicleCapacity">Vehicle capacity:
                    <input value="${ride.vehicleCapacity}" type="number" class="form-control" id="vehicleCapacity" name="vehicleCapacity"></label>
                </div>
                
                <div class="form-group">
                    <label for="vehicleMake">Vehicle make:
                    <input value="${ride.vehicleMake}" type="text" class="form-control" id="vehicleMake" name="vehicleMake"></label>
                </div>
                
                <div class="form-group">
                    <label for="vehicleModel">Vehicle model:
                    <input value="${ride.vehicleModel}" type="text" class="form-control" id="vehicleModel" name="vehicleModel"></label>
                </div>
                <input type="submit" value="Post Edited Ride Share" class="btn btn-primary">
            </form>
                </div>
		
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>