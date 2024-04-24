package com.skilldistillery.snowboardswap.data;

import java.util.List;

import com.skilldistillery.snowboardswap.entities.Ride;

public interface RideShareDAO {


	Ride createRideShare(Ride ride);
	
	boolean deleteRideShare(int id);

	Ride joinRideShare(Ride ride);
	

	Ride findRideById(int id);

	List<Ride> displayAllRides();

	List<Ride> findByUserName(String username);

	Ride updateRideShare(Ride ride, int id);
	
	
	

}
