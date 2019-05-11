package com.worldTour.repository;

import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.worldTour.model.Flight;


@Repository("flightRepository")
public interface FlightRepository extends JpaRepository<Flight, Long> {
	Flight findByArrivalDate(Date date);
	Flight findByDepartureDate(Date date);
	Flight findByArrivalDateAndDepartureDate(Date arrivalDate, Date departureDate);

}