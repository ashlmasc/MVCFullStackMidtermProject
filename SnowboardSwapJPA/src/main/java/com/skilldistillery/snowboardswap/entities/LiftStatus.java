package com.skilldistillery.snowboardswap.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="lift_status")
public class LiftStatus {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="occurrence_date")
	private LocalDateTime occurrenceDate;
	
	private String status;
	
	//FK: lift_id int

	public LiftStatus() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDateTime getOccurrenceDate() {
		return occurrenceDate;
	}

	public void setOccurrenceDate(LocalDateTime occurrenceDate) {
		this.occurrenceDate = occurrenceDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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
		LiftStatus other = (LiftStatus) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "LiftStatus [id=" + id + ", occurrenceDate=" + occurrenceDate + ", status=" + status + "]";
	}
}
