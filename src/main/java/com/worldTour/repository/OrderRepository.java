package com.worldTour.repository;

import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.worldTour.model.Client;
import com.worldTour.model.Emploee;
import com.worldTour.model.Order;

@Repository("orderRepository")
public interface OrderRepository extends JpaRepository<Order, Long> {
	Order findById(int id);
	Order findByOrderDate(Date Date);
	Order findByEmploee(Emploee emploee);
	Order findByClient(Client Client);


}