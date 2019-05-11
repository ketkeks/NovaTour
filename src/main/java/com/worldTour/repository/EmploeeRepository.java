package com.worldTour.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.worldTour.model.Emploee;



@Repository("ReemploeeRpository")
public interface EmploeeRepository extends JpaRepository<Emploee, Long> {
	Emploee findByFirstNameAndLastName(String firstName, String lastName);

}
