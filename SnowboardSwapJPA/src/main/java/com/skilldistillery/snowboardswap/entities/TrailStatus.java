package com.skilldistillery.snowboardswap.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

@Entity
public class TrailStatus {

	@Id
	@GeneratedValue()
	private int Id;
	
	@Column(name="occurence_date")
	private LocalDateTime occurenceDate;
	
	private String status;
	
	
	@Column(name="trail_id")
	private int trail_id;
	
	public TrailStatus() {}


	public int getId() {
		return Id;
	}


	public void setId(int id) {
		Id = id;
	}


	public LocalDateTime getOccurenceDate() {
		return occurenceDate;
	}


	public void setOccurenceDate(LocalDateTime occurenceDate) {
		this.occurenceDate = occurenceDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public int getTrail_id() {
		return trail_id;
	}


	public void setTrail_id(int trail_id) {
		this.trail_id = trail_id;
	}


	@Override
	public int hashCode() {
		return Objects.hash(Id);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		TrailStatus other = (TrailStatus) obj;
		return Id == other.Id;
	}


	@Override
	public String toString() {
		return "TrailStatus [Id=" + Id + ", occurenceDate=" + occurenceDate + ", status=" + status + ", trail_id="
				+ trail_id + "]";
	}
	
	
	
	
}
