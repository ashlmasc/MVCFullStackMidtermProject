<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
<div class="offcanvas offcanvas-start" data-bs-scroll="true"
	tabindex="-1" id="addLiftForm"
	aria-labelledby="offcanvasWithBothOptionsLabel">

	<div class="offcanvas-header">
		<h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">

			Add Trail</h5>

		<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
			aria-label="Close"></button>
	</div>

	<div class="offcanvas-body">
		<form action="addTrail" method="post">
			<input type="hidden" name="resortId" value="${resort.id}">

			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="trailName"
					placeholder="Name" name="name">
				<label for="trailName">Lift Name</label>
			</div>
				
			<div class="form-floating">
				<select class="form-select" id="liftType"
					aria-label="Trail difficulty" name="lift_type_id">
					<option selected value="1">Telemix</option>
					<option value="2">Double</option>
					<option value="3">Triple</option>
					<option value="4">Quad</option>
					<option value="5">6-Person</option>
					<option value="6">Carpet</option>
					<option value="7">Surface</option>
				</select>
				<label for="liftType">Type</label>
			</div>
	</div>

	<button type="submit" class="btn btn-primary">Submit</button>
	</form>
</div>