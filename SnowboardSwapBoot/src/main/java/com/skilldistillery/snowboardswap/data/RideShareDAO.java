package com.skilldistillery.snowboardswap.data;

import com.skilldistillery.snowboardswap.entities.Ride;

public interface RideShareDAO {


	Ride createRideShare(Ride ride);
	
	boolean deleteRideShare(int id);

	Ride updateRideShare(Ride ride);
	
	Ride joinRideShare(Ride ride);
	

	
	
	

}
