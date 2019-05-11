package com.worldTour.model;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "flight")
public class Flight {

	@Id
	@Column(name = "id_flight")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	
	@Column(name = "arrival_date")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date arrivalDate;
	
	
	@Column(name = "departure_date")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date departureDate;
	
	@NotNull(message="Price is empty")
	private int price;
	
	@Column(name = "number_of_days")
	@NotNull(message="NumberOfDays is empty")
	private int numberOfDays;
	
	 @OneToMany(mappedBy = "flight")
	    private Set<Resort> resort;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getArrivalDate() {
		return arrivalDate;
	}

	public void setArrivalDate(Date arrivalDate) {
		this.arrivalDate = arrivalDate;
	}

	public Date getDepartureDate() {
		return departureDate;
	}

	public void setDepartureDate(Date departureDate) {
		this.departureDate = departureDate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getNumberOfDays() {
		return numberOfDays;
	}

	public void setNumberOfDays(int numberOfDays) {
		this.numberOfDays = numberOfDays;
	}

	public Set<Resort> getResort() {
		return resort;
	}

	public void setResort(Set<Resort> resort) {
		this.resort = resort;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((arrivalDate == null) ? 0 : arrivalDate.hashCode());
		result = prime * result + ((departureDate == null) ? 0 : departureDate.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + numberOfDays;
		result = prime * result + price;
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
		Flight other = (Flight) obj;
		if (arrivalDate == null) {
			if (other.arrivalDate != null)
				return false;
		} else if (!arrivalDate.equals(other.arrivalDate))
			return false;
		if (departureDate == null) {
			if (other.departureDate != null)
				return false;
		} else if (!departureDate.equals(other.departureDate))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (numberOfDays != other.numberOfDays)
			return false;
		if (price != other.price)
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
		return "Flight [id=" + id + ", arrivalDate=" + arrivalDate + ", departureDate=" + departureDate + ", price="
				+ price + ", numberOfDays=" + numberOfDays + ", resort=" + resort + "]";
	}
	 
}
