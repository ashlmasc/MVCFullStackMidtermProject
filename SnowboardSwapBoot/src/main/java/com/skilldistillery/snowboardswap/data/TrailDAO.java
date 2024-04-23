package com.skilldistillery.snowboardswap.data;

import com.skilldistillery.snowboardswap.entities.Resort;
import com.skilldistillery.snowboardswap.entities.Trail;

public interface TrailDAO {

	Resort findTrailByID(int id);

	Trail addTrail(Trail trail);

}
