package com.skilldistillery.snowboardswap.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import org.apache.logging.log4j.core.tools.picocli.CommandLine.Help.Ansi.Text;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.grammars.hql.HqlParser.DateTimeContext;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Ride {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	
	@Column(name="sponsor_id")
	private int sponsorId;
	
	
	@Column(name="departure_address_id")
	private int departureAddressId;

	@CreationTimestamp
	private LocalDateTime departure;
	
	
	@CreationTimestamp
	@Column(name = "created_at")
	private LocalDateTime createdAt;
	
	@Column(name="resort_id")
	private int resortId;
	
	private int active;
	
	private String detail;
	
	
	@Column(name="vehicle_capacity")
	private int vehicleCapacity;
	
	
	@Column(name="vehicle_make")
	private String vehicleMake;
	
	
	@Column(name="vehicle_model")
	private String vehicleModel;
	
	
	@Column(name="arrival_address_id")
	private int arrivalAddressId;
	
	
	@CreationTimestamp
	@Column(name="updated_at")
	private LocalDateTime updatedAt;
	
	
	@Column(name="image_url")
	private String imageUrl;


	public Ride() {}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getSponsorId() {
		return sponsorId;
	}


	public void setSponsorId(int sponsorId) {
		this.sponsorId = sponsorId;
	}


	public int getDepartureAddressId() {
		return departureAddressId;
	}


	public void setDepartureAddressId(int departureAddressId) {
		this.departureAddressId = departureAddressId;
	}


	public LocalDateTime getDeparture() {
		return departure;
	}


	public void setDeparture(LocalDateTime departure) {
		this.departure = departure;
	}


	public LocalDateTime getCreatedAt() {
		return createdAt;
	}


	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}


	public int getResortId() {
		return resortId;
	}


	public void setResortId(int resortId) {
		this.resortId = resortId;
	}


	public int getActive() {
		return active;
	}


	public void setActive(int active) {
		this.active = active;
	}


	public String getDetail() {
		return detail;
	}


	public void setDetail(String detail) {
		this.detail = detail;
	}


	public int getVehicleCapacity() {
		return vehicleCapacity;
	}


	public void setVehicleCapacity(int vehicleCapacity) {
		this.vehicleCapacity = vehicleCapacity;
	}


	public String getVehicleMake() {
		return vehicleMake;
	}


	public void setVehicleMake(String vehicleMake) {
		this.vehicleMake = vehicleMake;
	}


	public String getVehicleModel() {
		return vehicleModel;
	}


	public void setVehicleModel(String vehicleModel) {
		this.vehicleModel = vehicleModel;
	}


	public int getArrivalAddressId() {
		return arrivalAddressId;
	}


	public void setArrivalAddressId(int arrivalAddressId) {
		this.arrivalAddressId = arrivalAddressId;
	}


	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}


	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}


	public String getImageUrl() {
		return imageUrl;
	}


	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
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
		Ride other = (Ride) obj;
		return id == other.id;
	}


	@Override
	public String toString() {
		return "Ride [id=" + id + ", sponsorId=" + sponsorId + ", departureAddressId=" + departureAddressId
				+ ", departure=" + departure + ", createdAt=" + createdAt + ", resortId=" + resortId + ", active="
				+ active + ", detail=" + detail + ", vehicleCapacity=" + vehicleCapacity + ", vehicleMake="
				+ vehicleMake + ", vehicleModel=" + vehicleModel + ", arrivalAddressId=" + arrivalAddressId
				+ ", updatedAt=" + updatedAt + ", imageUrl=" + imageUrl + "]";
	}
}












