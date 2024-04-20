package com.skilldistillery.snowboardswap.entities;

import java.util.List;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Address {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
    private String street;

    private String city;

    private String state;

    @Column(name = "postal_code")
    private Integer postalCode;

    @Column(name = "phone_number")
    private String phoneNumber;
    
    @OneToMany(mappedBy = "address") 
    private List<Resort> resorts;
    
    @OneToMany(mappedBy = "departureAddress") 
    private List<Ride> departureRides;
    
    @OneToMany(mappedBy = "arrivalAddress") 
    private List<Ride> arrivalRides;

	public Address() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Integer getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(Integer postalCode) {
		this.postalCode = postalCode;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public List<Resort> getResorts() {
		return resorts;
	}

	public void setResorts(List<Resort> resorts) {
		this.resorts = resorts;
	}

	public List<Ride> getDepartureRides() {
		return departureRides;
	}

	public void setDepartureRides(List<Ride> departureRides) {
		this.departureRides = departureRides;
	}

	public List<Ride> getArrivalRides() {
		return arrivalRides;
	}

	public void setArrivalRides(List<Ride> arrivalRides) {
		this.arrivalRides = arrivalRides;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Address other = (Address) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Address [id=" + id + ", street=" + street + ", city=" + city + ", state=" + state + ", postalCode="
				+ postalCode + ", phoneNumber=" + phoneNumber + "]";
	}
}
