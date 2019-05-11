package com.worldTour.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.worldTour.model.Flight;
import com.worldTour.model.Hotel;
import com.worldTour.model.Resort;

@Repository("resortRepository")
public interface ResortRepository extends JpaRepository<Resort, Long> {
	Resort findById(int id);
	Resort findByHotel(Hotel hotel);
	Resort findByFlight(Flight flight);
	

}