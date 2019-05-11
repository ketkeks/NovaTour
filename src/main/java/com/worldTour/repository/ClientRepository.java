package com.worldTour.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.worldTour.model.Client;



@Repository
public interface ClientRepository extends CrudRepository<Client, Long> {

	public List<Client> findByFirstNameAndLastName(String firstName, String lastName);

}