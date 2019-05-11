package com.worldTour.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "orders")
public class Order {

	@Id
	@Column(name = "order_id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn
	private Client client;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn
	private Emploee emploee;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn
	private Resort resort;
	
	@NotNull(message="Amount is empty")
	private int amount;
	
	@Column(name = "order_date")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date orderDate;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public Emploee getEmploee() {
		return emploee;
	}

	public void setEmploee(Emploee emploee) {
		this.emploee = emploee;
	}

	public Resort getResort() {
		return resort;
	}

	public void setResort(Resort resort) {
		this.resort = resort;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + amount;
		result = prime * result + ((client == null) ? 0 : client.hashCode());
		result = prime * result + ((emploee == null) ? 0 : emploee.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((orderDate == null) ? 0 : orderDate.hashCode());
		result = prime * result + ((resort == null) ? 0 : resort.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Order other = (Order) obj;
		if (amount != other.amount)
			return false;
		if (client == null) {
			if (other.client != null)
				return false;
		} else if (!client.equals(other.client))
			return false;
		if (emploee == null) {
			if (other.emploee != null)
				return false;
		} else if (!emploee.equals(other.emploee))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (orderDate == null) {
			if (other.orderDate != null)
				return false;
		} else if (!orderDate.equals(other.orderDate))
			return false;
		if (resort == null) {
			if (other.resort != null)
				return false;
		} else if (!resort.equals(other.resort))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", client=" + client + ", emploee=" + emploee + ", resort=" + resort + ", amount="
				+ amount + ", orderDate=" + orderDate + "]";
	}
		
}
