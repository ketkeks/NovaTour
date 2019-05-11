package com.worldTour.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.worldTour.model.Hotel;

@Repository("hotelRepository")
public interface HotelRepository extends JpaRepository<Hotel, Long> {
	Hotel findByCountry(String country);
	Hotel findByCity(String city);
	Hotel findByFood(String food);
	Hotel findByCountryAndCity(String country, String city);

}